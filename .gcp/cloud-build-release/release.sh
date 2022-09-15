#!/bin/bash

# NB - this script is currently only testing the build performance in GCP

# printing tool versions
java --version
mvn --version
gpg --version


apt-get update && apt-get install ca-certificates curl gnupg lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin


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
