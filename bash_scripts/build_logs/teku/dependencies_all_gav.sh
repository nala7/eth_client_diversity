# Analyzes the dependencies taking into account version numbers


# Version 25.1.0
grep "\---" teku-25.1.0_dependencies_tree.txt |
grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed -E 's/(.*):[0-9]+\.[0-9]+[^ ]* -> ([0-9]+\.[0-9]+[^ ]*)/\1:\2/' | # removes detailed version numbers (keeps version on the right of the arrow, the highest version)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-25.1.0_dependencies_all_gav.txt

echo -e "All dependencies (with versions) 25.1.0: $(cat teku-25.1.0_dependencies_all_gav.txt | wc -l)";

# Version 24.1.0
grep "\---" teku-24.1.0_dependencies_tree.txt |
grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed -E 's/(.*):[0-9]+\.[0-9]+[^ ]* -> ([0-9]+\.[0-9]+[^ ]*)/\1:\2/' | # removes detailed version numbers (keeps version on the right of the arrow, the highest version)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-24.1.0_dependencies_all_gav.txt

echo -e "All dependencies (with versions) 24.1.0: $(cat teku-24.1.0_dependencies_all_gav.txt | wc -l)";

# Version 23.1.0
grep "\---" teku-23.1.0_dependencies_tree.txt |
grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed -E 's/(.*):[0-9]+\.[0-9]+[^ ]* -> ([0-9]+\.[0-9]+[^ ]*)/\1:\2/' | # removes detailed version numbers (keeps version on the right of the arrow, the highest version)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-23.1.0_dependencies_all_gav.txt

echo -e "All dependencies (with versions) 23.1.0: $(cat teku-23.1.0_dependencies_all_gav.txt | wc -l)";


# Version 22.1.0
grep "\---" teku-22.1.0_dependencies_tree.txt |
grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed -E 's/(.*):[0-9]+\.[0-9]+[^ ]* -> ([0-9]+\.[0-9]+[^ ]*)/\1:\2/' | # removes detailed version numbers (keeps version on the right of the arrow, the highest version)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-22.1.0_dependencies_all_gav.txt

echo -e "All dependencies (with versions) 22.1.0: $(cat teku-22.1.0_dependencies_all_gav.txt | wc -l)";

# Version 21.10.6
grep "\---" teku-21.10.6_dependencies_tree.txt |
grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
sed -E 's/(.*):[0-9]+\.[0-9]+[^ ]* -> ([0-9]+\.[0-9]+[^ ]*)/\1:\2/' | # removes detailed version numbers (keeps version on the right of the arrow, the highest version)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-21.10.6_dependencies_all_gav.txt

echo -e "All dependencies (with versions) 21.10.6: $(cat teku-21.10.6_dependencies_all_gav.txt | wc -l)";

# ------------------------------------------------------------------------------------------------
#
## Dependency tree teku-20.10.4
#grep "\---" teku-20.10.4_dependencies_tree.txt |
#grep -v "project " |
#cut -d "-" -f 4-7 |
#grep -v "(*)" |
##sed 's/->.*$/ /p' |
##sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
#sed 's/[[:blank:]]*$//' |
#grep -v "\---" |
#sort -u > teku-20.10.4_dependencies_all_gav.txt
#
#echo -e "All dependencies: $(cat teku-20.10.4_dependencies_all_gav.txt | wc -l)";