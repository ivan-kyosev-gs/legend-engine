#!/bin/bash

# NB - this script is currently only testing the build performance in GCP

# printing tool versions
java --version
mvn --version
gpg --version

# installing docker
apt update && apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update && apt -y install docker-ce docker-ce-cli containerd.io
systemctl enable --now docker
usermod -aG docker $USER
newgrp docker


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
