#!/bin/bash

echo "Provided release version is: ${RELEASE_VERSION}"

echo "JAVA_HOME is: ${JAVA_HOME}"
echo "M2_HOME is: ${M2_HOME}"

java --version
mvn --version


# export MAVEN_OPTS=-Xmx12g
# mvn -T 8 install

