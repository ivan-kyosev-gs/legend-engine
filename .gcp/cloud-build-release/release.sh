#!/bin/bash

# calculating the next development version
n=${RELEASE_VERSION//[!0-9]/ }
a=(${n//\./ })
nextPatch=$((${a[2]} + 1))
export DEVELOPMENT_VERSION="${a[0]}.${a[1]}.${nextPatch}-SNAPSHOT"

echo "Provided release version is: ${RELEASE_VERSION}"
echo "Next development version is: ${DEVELOPMENT_VERSION}"

# printing tool versions
java --version
mvn --version
gpg --version

# setting env variables
export MAVEN_OPTS=-Xmx4g

# importing GPG private key
echo "${CI_GPG_PRIVATE_KEY}" > private.key
gpg --batch --import private.key
rm private.key

# configuring finos-admin git user
git config --global user.email "37706051+finos-admin@users.noreply.github.com"
git config --global user.name "FINOS Administrator"


export FAKE_TOKEN="abc_hewuiewbf_r223"


echo "----------------------------------------------"
echo $HOME
echo "----------------------------------------------"

git remote -v

# running the build
#mvn -B install
