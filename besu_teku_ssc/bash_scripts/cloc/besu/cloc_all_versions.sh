#!/bin/bash

declare -A VERSIONS
VERSIONS["25.1.0"]="870f3b7"
VERSIONS["24.1.0"]="ab4882c"
VERSIONS["23.1.0"]="79c1a97"
VERSIONS["22.1.0"]="b2c457b"

cd ../../../nodes_src/ || exit
git clone https://github.com/hyperledger/besu

## Version 25.1.0
cd besu/
git checkout 870f3b7
cd ../
cloc besu > besu_25.1.0_cloc.txt

## Version 24.1.0
cd besu/
git checkout ab4882c
cd ../
cloc besu > besu_24.1.0_cloc.txt

## Version 23.1.0
cd besu/
git checkout 79c1a97
cd ../
cloc besu > besu_23.1.0_cloc.txt

## Version 22.1.0
cd besu/
git checkout b2c457b
cd ../
cloc besu > besu_22.1.0_cloc.txt
