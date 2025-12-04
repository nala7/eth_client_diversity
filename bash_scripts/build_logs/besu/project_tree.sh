#cd ../../../nodes_src/besu-25.1.0
#sdk use gradle
#gradle -q projects > besu-25.1.0_projects_tree.txt
#mv besu-25.1.0_projects_tree.txt ../../bash_scripts/build_logs/besu

#cd ../../bash_scripts/build_logs/besu
#sdk use gradle 7.3.3
#cd ../../../nodes_src/besu-21.10.6
#gradle -q projects > besu-21.10.6_projects_tree.txt
#mv besu-21.10.6_projects_tree.txt ../../bash_scripts/build_logs/besu

#cd ../../bash_scripts/build_logs/besu
#sdk use gradle 6.8.1
cd ../../../nodes_src/besu-20.10.4
gradle -q projects > besu-besu-20.10.4_projects_tree.txt
mv besu-besu-20.10.4_projects_tree.txt ../../bash_scripts/build_logs/besu