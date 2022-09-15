#!/bin/bash

# NB - this script is currently only testing the build performance in GCP

# printing tool versions
java --version
mvn --version
gpg --version


echo "--------------------------------------- DOCKER VERSION ----------------------------------"
docker --version
echo "--------------------------------------- DOCKER VERSION ----------------------------------"



echo "--------------------------------------- DOCKER PS A ----------------------------------"
docker ps -a
echo "--------------------------------------- DOCKER PS A ----------------------------------"


# setting env variables
export MAVEN_OPTS="-Xms16g -Xmx24g"

# running the build
mvn -B -e install
