import json
from get_stats_github_url import GitHubRepoStats

excecution_clients = [
    'https://github.com/ethereum/go-ethereum',
    'https://github.com/NethermindEth/nethermind',
    'https://github.com/hyperledger/besu',
    'https://github.com/erigontech/erigon',
    'https://github.com/paradigmxyz/reth'
]

consensus_clients = [
    'https://github.com/sigp/lighthouse',
    'https://github.com/OffchainLabs/prysm',
    'https://github.com/Consensys/teku',
    'https://github.com/status-im/nimbus-eth2',
    'https://github.com/ChainSafe/lodestar',
    'https://github.com/grandinetech/grandine'
]

# Replace with your actual token
token = '123'

# Collect execution client stats
execution_stats = []
for client in excecution_clients:
    stats = GitHubRepoStats(client, token).get_stats()
    execution_stats.append(stats)

# Collect consensus client stats
consensus_stats = []
for client in consensus_clients:
    stats = GitHubRepoStats(client, token).get_stats()
    consensus_stats.append(stats)

# Convert to JSON strings
execution_json = json.dumps(execution_stats, indent=2)
consensus_json = json.dumps(consensus_stats, indent=2)

# Save to files
with open("data/execution_clients.json", "w") as f:
    f.write(execution_json)

with open("data/consensus_clients.json", "w") as f:
    f.write(consensus_json)

if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        print("Usage: python script.py <repo_url> [github_token]")
        sys.exit(1)

    repo_url = sys.argv[1]
    token = sys.argv[2] if len(sys.argv) > 2 else None

    gh = GitHubRepoStats(repo_url, token)
    stats = gh.get_stats()
    print(json.dumps(stats, indent=2))
