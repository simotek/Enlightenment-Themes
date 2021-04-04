#!/bin/bash

export DARK_LOCATION=~/src/Themes/dark
cp -r $DARK_LOCATION/edc $PWD/enlightenment-elementary
cp -r $DARK_LOCATION/fdo $PWD/enlightenment-elementary
cp -r $DARK_LOCATION/img $PWD/enlightenment-elementary
cp -r $DARK_LOCATION/licenses $PWD/enlightenment-elementary
cp -r $DARK_LOCATION/orig $PWD/enlightenment-elementary
cp -r $DARK_LOCATION/snd $PWD/enlightenment-elementary
cp    $DARK_LOCATION/colorclasses.edc $PWD/enlightenment-elementary
cp    $DARK_LOCATION/fonts.edc $PWD/enlightenment-elementary
cp    $DARK_LOCATION/macros.edc $PWD/enlightenment-elementary
cp    $DARK_LOCATION/dark.edc $PWD/enlightenment-elementary/default.edc

