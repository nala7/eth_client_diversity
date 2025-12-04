## Version TEST 25.1.0
#grep -E "\\---|\\+---" besu-25.1.0_dependencies_tree.txt |
##grep -v "project " |
#cut -d "-" -f 4-7 | # extracts group:artifact:version
#grep -v "(*)" | # removes repeated dependencies
#sed 's/->.*$/ /p' | # conflict resolutions '->'
## sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers (keeps version on the left)
#
#sed 's/[[:blank:]]*$//' | # trims railing paces
#grep -v "\---" | # removes all lines that don't contain '\---'
#sort -u > besu-25.1.0_dependencies_all_TEST.txt # sorts and removes duplicates
#
#echo -e "All dependencies TEST 25.1.0: $(cat besu-25.1.0_dependencies_all_TEST.txt | wc -l)";



# Analyzes the dependencies NOT taking into account version numbers

# Version 25.1.0
grep "\---" besu-25.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 | # extracts group:artifact:version
grep -v "(*)" | # removes repeated dependencies
sed 's/->.*$/ /p' | # conflict resolutions '->'
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers
sed 's/[[:blank:]]*$//' | # trims railing paces
grep -v "\---" | # removes all lines that don't contain '\---'
sort -u > besu-25.1.0_dependencies_all.txt # sorts and removes duplicates

echo -e "All dependencies 25.1.0: $(cat besu-25.1.0_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Version 24.1.0
grep "\---" besu-24.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' |
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers (keeps version on the left)
grep -v "\---" |
sort -u > besu-24.1.0_dependencies_all.txt

echo -e "All dependencies 24.1.0: $(cat besu-24.1.0_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Version 23.1.0
grep "\---" besu-23.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' | # conflict resolutions '->'
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers (keeps version on the left)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > besu-23.1.0_dependencies_all.txt

echo -e "All dependencies 23.1.0: $(cat besu-23.1.0_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Version 22.1.0
grep "\---" besu-22.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' | # conflict resolutions '->'
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers (keeps version on the left)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > besu-22.1.0_dependencies_all.txt

echo -e "All dependencies 22.1.0: $(cat besu-22.1.0_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Version 21.10.6
grep "\---" besu-21.10.6_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' | # conflict resolutions '->'
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers (keeps version on the left)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > besu-21.10.6_dependencies_all.txt

echo -e "All dependencies 21.10.6: $(cat besu-21.10.6_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

## Dependency tree besu-20.10.4
#grep "\---" besu-20.10.4_dependencies_tree.txt |
##grep -v "project " |
#cut -d "-" -f 4-7 |
#grep -v "(*)" |
#sed 's/->.*$/ /p' |
#sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |
#sed 's/[[:blank:]]*$//' |
#grep -v "\---" |
#sort -u > besu-20.10.4_dependencies_all.txt
#
#echo -e "All dependencies: $(cat besu-20.10.4_dependencies_all.txt | wc -l)";
