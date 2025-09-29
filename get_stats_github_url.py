import requests
import sys
import re
from datetime import datetime

# -------------------------
# Helper function to extract owner/repo from URL
# -------------------------
def parse_repo_url(url: str):
    match = re.search(r"github.com/([\w.-]+)/([\w.-]+)", url)
    if not match:
        raise ValueError("Invalid GitHub repository URL")
    return match.group(1), match.group(2)

# -------------------------
# Get repo stats
# -------------------------
def get_repo_stats(repo_url: str, token: str = None):
    owner, repo = parse_repo_url(repo_url)
    headers = {"Accept": "application/vnd.github.v3+json"}
    if token:
        headers["Authorization"] = f"token {token}"

    # 1. Get number of commits (via /commits with per_page=1 + link header)
    commits_url = f"https://api.github.com/repos/{owner}/{repo}/commits"
    commits_resp = requests.get(commits_url, headers=headers, params={"per_page": 1})
    if "Link" in commits_resp.headers:
        links = commits_resp.headers["Link"]
        last_page = int(re.search(r'&page=(\d+)>; rel="last"', links).group(1))
        num_commits = last_page
    else:
        num_commits = len(commits_resp.json())

    # 2. Get first commit (oldest)
    first_commit_resp = requests.get(
        commits_url, headers=headers, params={"per_page": 1, "page": num_commits}
    )
    first_commit_data = first_commit_resp.json()[0]
    first_commit_date = datetime.strptime(
        first_commit_data["commit"]["author"]["date"], "%Y-%m-%dT%H:%M:%SZ"
    ).strftime("%d/%m/%Y")

    # 3. Get contributors
    contributors_url = f"https://api.github.com/repos/{owner}/{repo}/contributors"
    contributors_resp = requests.get(contributors_url, headers=headers, params={"per_page": 100})
    contributors_data = contributors_resp.json()

    num_contributors = len(contributors_data)

    # Sort contributors by commit count
    top_contributors = sorted(contributors_data, key=lambda c: c.get("contributions", 0), reverse=True)[:2]

    top_contribs_info = []
    for c in top_contributors:
        login = c["login"]
        commits = c["contributions"]
        email = None

        # Fetch user profile for email
        user_url = f"https://api.github.com/users/{login}"
        user_resp = requests.get(user_url, headers=headers)
        if user_resp.status_code == 200:
            user_data = user_resp.json()
            email = user_data.get("email")

        top_contribs_info.append({
            "login": login,
            "commits": commits,
            "email": email
        })

    return {
        "repository": f"{owner}/{repo}",
        "num_commits": num_commits,
        "first_commit_date": first_commit_date,
        "num_contributors": num_contributors,
        "top_contributors": top_contribs_info,
    }

# -------------------------
# Example usage
# -------------------------
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python script.py <repo_url> [github_token]")
        sys.exit(1)

    repo_url = sys.argv[1]
    token = sys.argv[2] if len(sys.argv) > 2 else None

    stats = get_repo_stats(repo_url, token)
    print(stats)