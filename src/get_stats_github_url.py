import requests
import re
from datetime import datetime

class GitHubRepoStats:
    def __init__(self, repo_url: str, token: str = None):
        self.repo_url = repo_url
        self.token = token
        self.owner, self.repo = self._parse_repo_url(repo_url)
        self.headers = {"Accept": "application/vnd.github.v3+json"}
        if token:
            self.headers["Authorization"] = f"token {token}"

    def _parse_repo_url(self, url: str):
        match = re.search(r"github.com/([\w.-]+)/([\w.-]+)", url)
        if not match:
            raise ValueError("Invalid GitHub repository URL")
        return match.group(1), match.group(2)

    def _get_total_commits(self):
        commits_url = f"https://api.github.com/repos/{self.owner}/{self.repo}/commits"
        resp = requests.get(commits_url, headers=self.headers, params={"per_page": 1})
        if "Link" in resp.headers:
            links = resp.headers["Link"]
            last_page = int(re.search(r'&page=(\d+)>; rel="last"', links).group(1))
            return last_page
        return len(resp.json())

    def _get_first_commit_date(self, num_commits: int):
        commits_url = f"https://api.github.com/repos/{self.owner}/{self.repo}/commits"
        resp = requests.get(commits_url, headers=self.headers, params={"per_page": 1, "page": num_commits})
        data = resp.json()[0]
        return datetime.strptime(
            data["commit"]["author"]["date"], "%Y-%m-%dT%H:%M:%SZ"
        ).strftime("%d/%m/%Y")

    def _get_contributors_with_top(self, top_n=2):
        contributors = []
        page = 1

        while True:
            url = f"https://api.github.com/repos/{self.owner}/{self.repo}/contributors"
            params = {"per_page": 100, "page": page, "anon": "true"}
            resp = requests.get(url, headers=self.headers, params=params)
            if resp.status_code != 200:
                raise Exception(f"Error {resp.status_code}: {resp.text}")

            data = resp.json()
            if not data:
                break

            contributors.extend(data)
            page += 1

        total_contributors = len(contributors)

        # --- extract top N contributors ---
        top_contributors_data = sorted(contributors, key=lambda c: c.get("contributions", 0), reverse=True)[:top_n]
        top_contributors = []

        for c in top_contributors_data:
            login = c["login"]
            commits = c["contributions"]
            email = None

            user_url = f"https://api.github.com/users/{login}"
            user_resp = requests.get(user_url, headers=self.headers)
            if user_resp.status_code == 200:
                user_data = user_resp.json()
                email = user_data.get("email")

            top_contributors.append({
                "login": login,
                "commits": commits,
                "email": email
            })

        return {"total_contributors": total_contributors, "top_contributors": top_contributors}

    def get_stats(self):
        num_commits = self._get_total_commits()
        first_commit_date = self._get_first_commit_date(num_commits)
        contributors_info = self._get_contributors_with_top(top_n=2)

        return {
            "repository": f"{self.owner}/{self.repo}",
            "num_commits": num_commits,
            "first_commit_date": first_commit_date,
            "num_contributors": contributors_info["total_contributors"],
            "top_contributors": contributors_info["top_contributors"],
        }


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        print("Usage: python script.py <repo_url> [github_token]")
        sys.exit(1)

    repo_url = sys.argv[1]
    token = sys.argv[2] if len(sys.argv) > 2 else None

    gh = GitHubRepoStats(repo_url, token)
    stats = gh.get_stats()
    print(stats)
