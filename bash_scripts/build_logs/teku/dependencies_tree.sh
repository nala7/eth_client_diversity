cd ../../../nodes_src/
git clone https://github.com/Consensys/teku


# A shell alias to display the dependency tree of all the Gradle submodules
alias gradle-all-deps='gradle -q dependencies $(gradle -q projects \
    | grep -Fe ---\ Project \
    | sed -Ee "s/^.+--- Project '"'([^']+)'/\1:dependencies/"'")'

#declare -A VERSIONS
#VERSIONS["25.1.0"]="d56ce97"
#VERSIONS["24.1.0"]="82435a7"
#VERSIONS["23.1.0"]="8f1ef50"
#VERSIONS["22.1.0"]="5b85ef1"
#VERSIONS["21.1.0"]="dcfb0eb"

# Version 25.1.0
cd ../../../nodes_src/teku
git checkout d56ce97
sdk use java 21.0.6-tem
sdk use gradle 8.12.1
gradle-all-deps > teku-25.1.0_dependencies_tree.txt
mv teku-25.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/teku
cd ../../bash_scripts/build_logs/teku


# Version 24.1.0
cd ../../../nodes_src/teku
git checkout 82435a7
sdk use gradle 7.6.3
sdk use java 17.0.8-tem
gradle-all-deps > teku-24.1.0_dependencies_tree.txt
mv teku-24.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/teku
cd ../../bash_scripts/build_logs/teku


# Version 23.1.0
cd ../../../nodes_src/teku
git checkout 8f1ef50
sdk use gradle 7.6.3
sdk use java 17.0.8-tem
gradle-all-deps > teku-23.1.0_dependencies_tree.txt
mv teku-23.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/teku
cd ../../bash_scripts/build_logs/teku


# Version 22.1.0
cd ../../../nodes_src/teku
git checkout 5b85ef1
sdk use gradle 7.6.3
sdk use java 17.0.8-tem
gradle-all-deps > teku-22.1.0_dependencies_tree.txt
mv teku-22.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/teku
cd ../../bash_scripts/build_logs/teku


#cd ../../../nodes_src/teku
#git checkout dcfb0eb
#sdk use java 17.0.8-tem
#sdk use gradle 7.3.3
#gradle-all-deps > teku-21.1.0_dependencies_tree.txt
#mv teku-21.1.0_dependencies_tree.txt ../../bash_scripts/build_logs/teku
#cd ../../bash_scripts/build_logs/teku

