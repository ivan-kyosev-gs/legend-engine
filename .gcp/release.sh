#!/bin/bash

# calculating the next development version
n=${RELEASE_VERSION//[!0-9]/ }
a=(${n//\./ })
nextPatch=$((${a[2]} + 1))
export DEVELOPMENT_VERSION="${a[0]}.${a[1]}.${nextPatch}-SNAPSHOT"

echo "Provided release version is: ${RELEASE_VERSION}"
echo "Next development version is: ${DEVELOPMENT_VERSION}"

# printing java and maven versions
java --version
mvn --version

# setting env variables
export MAVEN_OPTS=-Xmx4g

echo "========================================================================="
gpg --list-secret-keys
echo "========================================================================="
gpg --list-secret-keys
echo "========================================================================="


# running the build
# mvn -B install
