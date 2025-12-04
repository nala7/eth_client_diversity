# Analyzes the dependencies NOT taking into account version numbers

# Version 25.1.0
grep "\---" teku-25.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 | # extracts group:artifact:version
grep -v "(*)" | # removes repeated dependencies
sed 's/->.*$/ /p' | # conflict resolutions '->'
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers
sed 's/[[:blank:]]*$//' | # trims railing paces
grep -v "\---" | # removes all lines that don't contain '\---'
sort -u > teku-25.1.0_dependencies_all.txt # sorts and removes duplicates

echo -e "All dependencies 25.1.0: $(cat teku-25.1.0_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Version 24.1.0
grep "\---" teku-24.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' |
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers (keeps version on the left)
grep -v "\---" |
sort -u > teku-24.1.0_dependencies_all.txt

echo -e "All dependencies 24.1.0: $(cat teku-24.1.0_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Version 23.1.0
grep "\---" teku-23.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' | # conflict resolutions '->'
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers (keeps version on the left)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-23.1.0_dependencies_all.txt

echo -e "All dependencies 23.1.0: $(cat teku-23.1.0_dependencies_all.txt | wc -l)";

# ------------------------------------------------------------------------------------------------

# Version 22.1.0
grep "\---" teku-22.1.0_dependencies_tree.txt |
#grep -v "project " |
cut -d "-" -f 4-7 |
grep -v "(*)" |
sed 's/->.*$/ /p' | # conflict resolutions '->'
sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' | # removes detailed version numbers (keeps version on the left)
sed 's/[[:blank:]]*$//' |
grep -v "\---" |
sort -u > teku-22.1.0_dependencies_all.txt

echo -e "All dependencies 22.1.0: $(cat teku-22.1.0_dependencies_all.txt | wc -l)";