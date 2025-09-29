import json
import sys
import pandas as pd

def json_to_latex_table(json_file, output_file="table.tex"):
    with open(json_file, "r") as f:
        data = json.load(f)

    # Transform JSON into a DataFrame
    rows = []
    for repo in data:
        repository = repo.get("repository", "")
        commits = repo.get("num_commits", 0)
        first_commit = repo.get("first_commit_date", "")
        contributors = repo.get("num_contributors", 0)

        top_contributors = repo.get("top_contributors", [])
        contribs_str = ", ".join(
            [f"{c['login']} ({c['commits']})" for c in top_contributors]
        )

        rows.append({
            "Repository": repository,
            "Commits": commits,
            "First Commit": first_commit,
            "Contributors": contributors,
            "Top Contributors": contribs_str,
        })

    df = pd.DataFrame(rows)

    # Convert DataFrame to LaTeX
    latex_table = df.to_latex(index=False, escape=False)

    with open(output_file, "w") as f:
        f.write(latex_table)

    print(f"LaTeX table written to {output_file}")


execution_json = "data/execution_clients.json"
consensus_json = "data/consensus_clients.json"

output_execution = "data/execution_table.tex"
output_consensus = "data/consensus_table.tex"

json_to_latex_table(execution_json, output_execution)
json_to_latex_table(consensus_json, output_consensus)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python json_to_latex_table.py <json_file> [output_file]")
        sys.exit(1)

    json_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else "table.tex"

    json_to_latex_table(json_file, output_file)
