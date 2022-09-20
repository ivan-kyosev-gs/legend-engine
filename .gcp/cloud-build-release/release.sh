#!/bin/bash

# NB - this script is currently only testing the build performance in GCP

# printing tool versions
java --version
mvn --version
gpg --version

# setting env variables
export MAVEN_OPTS="-Xms8g -Xmx16g"



git clone https://github.com/kevin-m-knight-gs/legend-pure.git
cd legend-pure
git checkout thread_safe_repos

mvn -B -e install -DskipTests -Dskip.yarn=true

cd ..

find . -type f -name "pom.xml" -exec sed -i 's/${legend.pure.version}/3.6.2-SNAPSHOT/g' {} +


echo "------------------------------ running legend-engine-build -----------------"

# running the build
mvn -B -e -T 8 install
