#!/bin/bash

echo "Extracting number of commits..." > besu_commits_summary.txt

versions=("besu-25.1.0" "besu-24.1.0" "besu-23.1.0" "besu-22.1.0" "besu-21.10.6" "besu-20.10.4")

commit_hashes=("870f3b7" "ab4882c" "79c1a97" "b2c457b" "ef7984b" "120d0d4")

for i in "${!versions[@]}"; do
    echo "${versions[$i]}: $(git -C ../../../nodes_src/besu rev-list --count "${commit_hashes[$i]}") commits" >> besu_commits_summary.txt
done

cat besu_commits_summary.txt
