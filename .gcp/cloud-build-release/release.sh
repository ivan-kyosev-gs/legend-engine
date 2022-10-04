#!/bin/bash

# NB - this script is currently only testing the build performance in GCP

# printing tool versions
java --version
mvn --version
gpg --version

# setting env variables
export MAVEN_OPTS="-Xms6g -Xmx6g"

# running the build
mvn -B -e -T 3 install -DargLine="-Xms8g -Xmx8g"
