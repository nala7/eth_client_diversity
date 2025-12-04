# A shell alias to display the dependency tree of all the Gradle submodules
alias gradle-all-deps='gradle -q dependencies $(gradle -q projects \
    | grep -Fe ---\ Project \
    | sed -Ee "s/^.+--- Project '"'([^']+)'/\1:dependencies/"'")'

#declare -A VERSIONS
#VERSIONS["25.1.0"]="870f3b7"
#VERSIONS["24.1.0"]="ab4882c"
#VERSIONS["23.1.0"]="79c1a97"
#VERSIONS["22.1.0"]="b2c457b"
#VERSIONS["21.10.6"]="ef7984b"
#VERSION["21.1.0]"="97ef557"


# Version 25.1.0
cd ../../../nodes_src/besu
git checkout 870f3b7
sdk use java 21.0.6-tem
sdk use gradle 8.12.1
gradle-all-deps > besu-25.1.0_dependencies_tree.txt
mv besu-25.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/besu
cd ../../bash_scripts/build_logs/besu

# Version 24.1.0
#cd ../../../nodes_src/besu
#git checkout ab4882
#sdk use gradle 7.6.3
#sdk use java 17.0.8-tem
#gradle-all-deps > besu-24.1.0_dependencies_tree.txt
#mv besu-24.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/besu
#cd ../../bash_scripts/build_logs/besu
#
## Version 23.1.0
#cd ../../../nodes_src/besu
#git checkout 79c1a97
#sdk use gradle 7.6.3
#sdk use java 17.0.8-tem
#gradle-all-deps > besu-23.1.0_dependencies_tree.txt
#mv besu-23.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/besu
#cd ../../bash_scripts/build_logs/besu
#
#
## Version 22.1.0
#cd ../../../nodes_src/besu
#git checkout b2c457b
#sdk use gradle 7.6.3
#sdk use java 17.0.8-tem
#gradle-all-deps > besu-22.1.0_dependencies_tree.txt
#mv besu-22.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/besu
#cd ../../bash_scripts/build_logs/besu

# Version 21.10.6
cd ../../../nodes_src/besu
git checkout ef7984b
sdk use gradle 7.3.3
sdk use java 17.0.8-tem
gradle-all-deps > besu-21.10.6_dependencies_tree.txt
mv besu-21.10.6_dependencies_tree.txt ../../bash_scripts/build_logs/besu

## Version 21.10.6
#cd ../../../nodes_src/besu-21.10.6
#sdk use gradle 7.3.3
#sdk use java 17.0.8-tem
#gradle-all-deps > besu-21.10.6_dependencies_tree.txt
#mv besu-21.10.6_dependencies_tree.txt ../../bash_scripts/build_logs/besu
#
### Dependency tree besu-20.10.4
#cd ../../bash_scripts/build_logs/besu
#cd ../../../nodes_src/besu-20.10.4
#gradle-all-deps > besu-20.10.4_dependencies_tree.txt
#mv besu-20.10.4_dependencies_tree.txt ../../bash_scripts/build_logs/besu


#./gradlew dependencies --configuration runtimeClasspath --refresh-dependencies > besu-25.1.0_dependencies_tree.txt