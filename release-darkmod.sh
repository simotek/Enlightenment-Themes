#!/bin/bash

VERSION=20220219.1.26

branches=("Dark" "Ice" "Neonz" "openSUSE-e-Ice" "openSUSE-e-Neon" "openSUSE-e-OliveLeaf")

rm -r artifacts

git checkout master
git tag -a -m "darkmod-release $VERSION" "$VERSION"

for b in ${branches[@]}; do
  echo "Processing $b"
  git checkout $b
  git merge master
  git tag -a -m "darkmod-release $VERSION" "$VERSION-$b"
  ./package-darkmod.sh
  ./build-darkmod.sh
  git push
done

git checkout master
git push
