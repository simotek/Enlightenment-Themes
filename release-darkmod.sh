#!/bin/bash
source darkmod-util.sh

if [ -n "$1" ]; then
  VERSION=$1
else
  error "Please pass the Version"
  exit 1
fi

# branches=("Dark" "Ice" "Neonz" "Dimensions" "openSUSE-e-Dimensions" "openSUSE-e-Ice" "openSUSE-e-Neon" "openSUSE-e-OliveLeaf")
branches=("Dimensions" "openSUSE-e-Dimensions")


rm -r artifacts

git checkout master

for b in ${branches[@]}; do
  echo "Processing $b"
  if [[ -f "artifacts/bundle/$b-$VERSION-Bundle.tar.xz" ]]; then
    warn "Bundle exists skipping"
  else
    git checkout $b
    test $? -eq 0 || { error "Checkout Failed, Exiting"; exit 2; };
    git merge master -m "Merge branch 'master' into $b - Releasing"
    test $? -eq 0 || { error "Merge Failed, Exiting"; exit 3; };
    ./package-darkmod.sh
    ./build-darkmod.sh
    test $? -eq 0 || { error "Build Failed, Exiting"; exit 4; };
    git tag -a -m "darkmod-release $VERSION" "$VERSION-$b"
    git push
  fi
done

git checkout master
git tag -a -m "darkmod-release $VERSION" "$VERSION"
git push
git push --tags
