#!/bin/bash

find_common_versioned_dependencies() {
    local version=$1
    local output_file="overlap_with_version-${version}.txt"

    comm -12 <(sort "teku/teku-${version}_dependencies_all_gav.txt") <(sort "besu/besu-${version}_dependencies_all_gav.txt") > "$output_file"
    echo "Common versioned dependencies ${version}: $(wc -l < "$output_file")"
}

versions=("25.1.0" "24.1.0" "23.1.0" "22.1.0")

for version in "${versions[@]}"; do
    find_common_versioned_dependencies "$version"
done
