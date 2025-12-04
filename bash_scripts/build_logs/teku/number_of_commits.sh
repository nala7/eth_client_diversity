#!/bin/bash

echo "Extracting number of commits..." > teku_commits_summary.txt

versions=("teku-25.1.0" "teku-24.1.0" "teku-23.1.0" "teku-22.1.0")

commit_hashes=("d56ce97" "82435a7" "8f1ef50" "5b85ef1" )

for i in "${!versions[@]}"; do
    echo "${versions[$i]}: $(git -C ../../../nodes_src/teku rev-list --count "${commit_hashes[$i]}") commits" >> teku_commits_summary.txt
done

cat teku_commits_summary.txt
