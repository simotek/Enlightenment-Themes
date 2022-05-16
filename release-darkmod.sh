#!/bin/bash
source darkmond-util.sh

if [ -n "$1" ]; then
  VERSION=$1
else
  error "Please pass the Version"
  exit 1
fi



branches=("Dark" "Ice" "Neonz" "Dimensions" "openSUSE-e-Dimensions" "openSUSE-e-Ice" "openSUSE-e-Neon" "openSUSE-e-OliveLeaf")

rm -r artifacts

git checkout master
git tag -a -m "darkmod-release $VERSION" "$VERSION"

for b in ${branches[@]}; do
  echo "Processing $b"
  if [[ -f "artifacts/bundle/$b-$VERSION-Bundle.tar.xz" ]]; then
    warn "Bundle exists skipping"
  else
    git checkout $b
    git merge master -m "Merge branch 'master' into $b - Releasing"
    test $? -eq 0 || error "Merge Failed, Exiting"
    ./package-darkmod.sh
    ./build-darkmod.sh
    test $? -eq 0 || error "Build Failed, Exiting"
    git tag -a -m "darkmod-release $VERSION" "$VERSION-$b"
    git push
  fi
done

git checkout master
git push
git push --tags
