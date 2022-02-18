#!/bin/bash

source darkmod-color-paths.conf
source darkmod-util.sh

source clean-darkmod.sh

clean-darkmod

mkdir -p "artifacts/source"

E_THEME_PKG_DIR="enlightenment-theme-$THEME_NAME-$THEME_VERSION"

if [[ -d "build/pkg/$E_THEME_PKG_DIR" ]]; then
  rm -r "build/pkg/$E_THEME_PKG_DIR"
fi
mkdir -p "build/pkg/$E_THEME_PKG_DIR"

cp -r $ELM_ENLIGHT_THEME_PATH "build/pkg/$E_THEME_PKG_DIR/$ELM_ENLIGHT_THEME_PATH"
cp -r "licenses-authors" "build/pkg/$E_THEME_PKG_DIR/licenses-authors"
cp build-darkmod.sh "build/pkg/$E_THEME_PKG_DIR/build-darkmod.sh"
cp clean-darkmod.sh "build/pkg/$E_THEME_PKG_DIR/clean-darkmod.sh"
cp COPYING "build/pkg/$E_THEME_PKG_DIR/COPYING"
cp darkmod-color-paths.conf "build/pkg/$E_THEME_PKG_DIR/darkmod-color-paths.conf"
cp darkmod-copy.sh "build/pkg/$E_THEME_PKG_DIR/darkmod-copy.sh"
cp darkmod-fdo-icon-recolor.txt "build/pkg/$E_THEME_PKG_DIR/darkmod-fdo-icon-recolor.txt"
cp darkmod-util.sh "build/pkg/$E_THEME_PKG_DIR/darkmod-util.sh"
cp README.md "build/pkg/$E_THEME_PKG_DIR/README.md"


if [[ -f "artifacts/pkg/$E_THEME_PKG_DIR.tar.xz" ]]; then
  rm "artifacts/pkg/$E_THEME_PKG_DIR.tar.xz"
fi

pushd "build/pkg/" &> /dev/null
inform "Creating $E_THEME_PKG_DIR.tar.xz"
report_on_error tar cfJ "../../artifacts/source/$E_THEME_PKG_DIR.tar.xz" $E_THEME_PKG_DIR
popd &> /dev/null

# Kill package dir once done
rm -rf "build/pkg/$E_THEME_PKG_DIR"


TERM_THEME_PKG_DIR="terminology-theme-$THEME_NAME-$THEME_VERSION"

if [[ -d "build/pkg/$TERM_THEME_PKG_DIR" ]]; then
  rm -r "build/pkg/$TERM_THEME_PKG_DIR"
fi
mkdir -p "build/pkg/$TERM_THEME_PKG_DIR"

cp -r $TERMINOLOGY_THEME_PATH "build/pkg/$TERM_THEME_PKG_DIR/$TERMINOLOGY_THEME_PATH"
cp -r "licenses-authors" "build/pkg/$TERM_THEME_PKG_DIR/licenses-authors"
cp build-darkmod.sh "build/pkg/$TERM_THEME_PKG_DIR/build-darkmod.sh"
cp clean-darkmod.sh "build/pkg/$TERM_THEME_PKG_DIR/clean-darkmod.sh"
cp COPYING "build/pkg/$TERM_THEME_PKG_DIR/COPYING"
cp darkmod-color-paths.conf "build/pkg/$TERM_THEME_PKG_DIR/darkmod-color-paths.conf"
cp darkmod-copy.sh "build/pkg/$TERM_THEME_PKG_DIR/darkmod-copy.sh"
cp darkmod-fdo-icon-recolor.txt "build/pkg/$TERM_THEME_PKG_DIR/darkmod-fdo-icon-recolor.txt"
cp darkmod-util.sh "build/pkg/$TERM_THEME_PKG_DIR/darkmod-util.sh"
cp README.md "build/pkg/$TERM_THEME_PKG_DIR/README.md"

if [[ -f "artifacts/pkg/$TERM_THEME_PKG_DIR.tar.xz" ]]; then
  rm "artifacts/pkg/$TERM_THEME_PKG_DIR.tar.xz"
fi
pushd "build/pkg/" &> /dev/null
inform "Creating $TERM_THEME_PKG_DIR.tar.xz"
report_on_error tar cfJ "../../artifacts/source/$TERM_THEME_PKG_DIR.tar.xz" $TERM_THEME_PKG_DIR
popd &> /dev/null


# Kill package dir once done
rm -rf "build/pkg/$TERM_THEME_PKG_DIR"

inform "Completed at: " $(date)
