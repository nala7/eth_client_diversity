# Function to extract direct dependencies for a given version
extract_direct_dependencies() {
    local version=$1
    grep -E '^\|    \+--- ' besu-${version}_dependencies_tree.txt |  # Ensures only direct dependencies (not nested)
    grep -v "project :" |        # Removes lines starting with 'project:'
    cut -d "-" -f 4-7 |          # Extracts 'group:artifact:version'
    grep -v "(*)" |              # Removes repeated dependencies
    sed 's/->.*$/ /p' |          # Removes conflict resolutions '->'
    sed -E 's/:[0-9]+\.[0-9]+.*$/ /g' |  # Removes detailed version numbers
    sed 's/[[:blank:]]*$//' |    # Trims trailing spaces
    sort -u > besu-${version}_dependencies_direct.txt  # Sorts and removes duplicates
    echo "Direct dependencies Besu ${version}: $(wc -l < besu-${version}_dependencies_direct.txt)"
}

# Run the function for each version
extract_direct_dependencies "25.1.0"
extract_direct_dependencies "24.1.0"
extract_direct_dependencies "23.1.0"
extract_direct_dependencies "22.1.0"
extract_direct_dependencies "21.10.6"


###### Count direct dependencies, see https://docs.gradle.org/current/userguide/java_plugin.html#sec:java_plugin_and_dependency_management
#cd ../../../nodes_src/besu-25.1.0
#
#find . -name "build.gradle" -exec cat {} \; |
#grep "implementation \|api \|runtimeOnly\|compileOnly\|testCompileOnly\|testImplementation\|testRuntimeOnly\|compileOnlyApi" |
#grep -v "project(" | tr -s ' ' |
#sort -u > besu-25.1.0_dependencies_direct.txt;
#
#echo -e "Direct dependencies: $(cat besu-25.1.0_dependencies_direct.txt | wc -l)";
#mv besu-25.1.0_dependencies_direct.txt ../../bash_scripts/build_logs/besu
#cd ../../bash_scripts/build_logs/besu
#
#
## Version 21.10.6
#cd ../../../nodes_src/besu-21.10.6
#
#find . -name "build.gradle" -exec cat {} \; |
#grep "implementation \|api \|runtimeOnly\|compileOnly\|testCompileOnly\|testImplementation\|testRuntimeOnly\|compileOnlyApi" |
#grep -v "project(" | tr -s ' ' |
#sort -u > besu-21.10.6_dependencies_direct.txt;
#echo -e "Direct dependencies: $(cat besu-21.10.6_dependencies_direct.txt | wc -l)";
#mv besu-21.10.6_dependencies_direct.txt ../../bash_scripts/build_logs/besu
#cd ../../bash_scripts/build_logs/besu
#
#
## Version 20.10.4
#cd ../../../nodes_src/besu-20.10.4
#
#find . -name "build.gradle" -exec cat {} \; |
#grep "implementation \|api \|runtimeOnly\|compileOnly\|testCompileOnly\|testImplementation\|testRuntimeOnly\|compileOnlyApi" |
#grep -v "project(" | tr -s ' ' |
#sort -u > besu-20.10.4_dependencies_direct.txt;
#echo -e "Direct dependencies: $(cat besu-20.10.4_dependencies_direct.txt | wc -l)";
#mv besu-20.10.4_dependencies_direct.txt ../../bash_scripts/build_logs/besu
#cd ../../bash_scripts/build_logs/besu
