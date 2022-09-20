#!/bin/bash

# NB - this script is currently only testing the build performance in GCP

# printing tool versions
java --version
mvn --version
gpg --version

# setting env variables
export MAVEN_OPTS="-Xms16g -Xmx24g"



git clone https://github.com/kevin-m-knight-gs/legend-pure.git
cd legend-pure
git checkout thread_safe_repos

cd legend-pure-maven-java-compiled
mvn versions:use-dep-version -Dincludes=org.apache.maven:maven-core -DdepVersion=3.8.6 -DforceVersion=true
cd ..

mvn -B -e -pl !legend-pure-ide-light install

cd ..

sed -i 's/${legend.pure.version}/3.6.2-SNAPSHOT/g' pom.xml


echo "------------------------------ running legend-engine-build -----------------"

# running the build
mvn -B -e -T 8 install
