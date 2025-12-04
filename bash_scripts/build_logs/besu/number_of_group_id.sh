#!/bin/bash

# Input file containing dependencies
input_file="besu-25.1.0_dependencies_all.txt"

# Output file to store the results
output_file="besu-25.1.0_groupIds.txt"

# Extract and count occurrences of groupId, then store the result in a file
cut -d ":" -f 1 "$input_file" | sort | uniq -c | sort -nr > "$output_file"