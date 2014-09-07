#!/bin/bash

source darkmod-color-paths.conf
source darkmod-util.sh

source clean-darkmod.sh

clean-darkmod

THEME_PKG_DIR="$THEME_NAME-$THEME_VERSION"

mkdir $THEME_PKG_DIR

cp -r $ELM_ENLIGHT_THEME_PATH "$THEME_PKG_DIR/$ELM_ENLIGHT_THEME_PATH"
cp -r "licenses-authors" "$THEME_PKG_DIR/licenses-authors"
cp build-darkmod.sh "$THEME_PKG_DIR/build-darkmod.sh"
cp clean-darkmod.sh "$THEME_PKG_DIR/clean-darkmod.sh"       
cp COPYING "$THEME_PKG_DIR/COPYING"
cp darkmod-color-paths.conf "$THEME_PKG_DIR/darkmod-color-paths.conf"
cp darkmod-copy.sh "$THEME_PKG_DIR/darkmod-copy.sh"
cp darkmod-util.sh "$THEME_PKG_DIR/darkmod-util.sh"
cp README.md "$THEME_PKG_DIR/README.md"

rm "$THEME_PKG_DIR.tar.xz"
tar cfJ "$THEME_PKG_DIR.tar.xz" $THEME_PKG_DIR

# Kill package dir once done
rm -rf $THEME_PKG_DIR