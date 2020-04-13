#!/bin/bash

source darkmod-color-paths.conf
source darkmod-util.sh

source clean-darkmod.sh

clean-darkmod

E_THEME_PKG_DIR="enlightenment-theme-$THEME_NAME-$THEME_VERSION"

mkdir $E_THEME_PKG_DIR

cp -r $ELM_ENLIGHT_THEME_PATH "$E_THEME_PKG_DIR/$ELM_ENLIGHT_THEME_PATH"
cp -r "licenses-authors" "$E_THEME_PKG_DIR/licenses-authors"
cp build-darkmod.sh "$E_THEME_PKG_DIR/build-darkmod.sh"
cp clean-darkmod.sh "$E_THEME_PKG_DIR/clean-darkmod.sh"
cp COPYING "$E_THEME_PKG_DIR/COPYING"
cp darkmod-color-paths.conf "$E_THEME_PKG_DIR/darkmod-color-paths.conf"
cp darkmod-copy.sh "$E_THEME_PKG_DIR/darkmod-copy.sh"
cp darkmod-fdo-icon-recolor.txt "$E_THEME_PKG_DIR/darkmod-fdo-icon-recolor.txt"
cp darkmod-util.sh "$E_THEME_PKG_DIR/darkmod-util.sh"
cp README.md "$E_THEME_PKG_DIR/README.md"

rm "build/pkg/$E_THEME_PKG_DIR.tar.xz"
tar cfJ "build/pkg/$E_THEME_PKG_DIR.tar.xz" $E_THEME_PKG_DIR

# Kill package dir once done
rm -rf $E_THEME_PKG_DIR


TERM_THEME_PKG_DIR="terminology-theme-$THEME_NAME-$THEME_VERSION"

mkdir $TERM_THEME_PKG_DIR

cp -r $TERMINOLOGY_THEME_PATH "$TERM_THEME_PKG_DIR/$TERMINOLOGY_THEME_PATH"
cp -r "licenses-authors" "$TERM_THEME_PKG_DIR/licenses-authors"
cp build-darkmod.sh "$TERM_THEME_PKG_DIR/build-darkmod.sh"
cp clean-darkmod.sh "$TERM_THEME_PKG_DIR/clean-darkmod.sh"
cp COPYING "$TERM_THEME_PKG_DIR/COPYING"
cp darkmod-color-paths.conf "$TERM_THEME_PKG_DIR/darkmod-color-paths.conf"
cp darkmod-copy.sh "$TERM_THEME_PKG_DIR/darkmod-copy.sh"
cp darkmod-fdo-icon-recolor.txt "$TERM_THEME_PKG_DIR/darkmod-fdo-icon-recolor.txt"
cp darkmod-util.sh "$TERM_THEME_PKG_DIR/darkmod-util.sh"
cp README.md "$TERM_THEME_PKG_DIR/README.md"

rm "build/pkg/$TERM_THEME_PKG_DIR.tar.xz"
tar cfJ "build/pkg/$TERM_THEME_PKG_DIR.tar.xz" $TERM_THEME_PKG_DIR

# Kill package dir once done
rm -rf $TERM_THEME_PKG_DIR
