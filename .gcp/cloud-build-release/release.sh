#!/bin/bash

# NB - this script is currently only testing the build performance in GCP

# printing tool versions
java --version
mvn --version
gpg --version

# setting env variables
export MAVEN_OPTS="-Xms10g -Xmx10g"

# running the build
mvn -B -e -T 4 install -DargLine="-Xms5g -Xmx5g"
