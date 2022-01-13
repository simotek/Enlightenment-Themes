#!/bin/bash

source darkmod-color-paths.conf
source darkmod-util.sh

clean-darkmod(){
    # TBD: These should check if the file exists
    clean_dir $ELM_ENLIGHT_THEME_PATH/img-color
    clean_dir $ELM_ENLIGHT_THEME_PATH/img-bgnd
    clean_dir $ELM_ENLIGHT_THEME_PATH/img-shadow
    clean_dir $ELM_ENLIGHT_THEME_PATH/img-color-convd
    clean_dir $ELM_ENLIGHT_THEME_PATH/img-no-change
    clean_dir $ELM_ENLIGHT_THEME_PATH/img-bak
    clean_dir $ELM_ENLIGHT_THEME_PATH/img-manual-bak
    clean_dir $ELM_ENLIGHT_THEME_PATH/edc-dm
    clean_file $ELM_ENLIGHT_THEME_PATH/colorclasses-dm.edc
    clean_file $ELM_ENLIGHT_THEME_PATH/fonts-dm.edc
    clean_file $ELM_ENLIGHT_THEME_PATH/macros-dm.edc
    clean_file $ELM_ENLIGHT_THEME_PATH/default-dm.edc
    if [ -z "$1" ]; then
      clean_file build/e/*.edj
      clean_file build/icons/*-icons
      clean_file build/pkg/*tar.xz
    else
      clean_file "build/e/$1.edj"
      clean_file "build/icons/$1-icons"
      clean_file build/pkg/enlightenment-theme-$1-*.tar.xz
    fi

    if [ -n "$TERMINOLOGY_THEME_PATH" ]; then
        clean_dir $TERMINOLOGY_THEME_PATH/img-color
        clean_dir $TERMINOLOGY_THEME_PATH/img-bgnd
        clean_dir $TERMINOLOGY_THEME_PATH/img-shadow
        clean_dir $TERMINOLOGY_THEME_PATH/img-color-convd
        clean_dir $TERMINOLOGY_THEME_PATH/img-no-change
        clean_dir $TERMINOLOGY_THEME_PATH/img-bak
        clean_file $TERMINOLOGY_THEME_PATH/default-dm.edc
        clean_dir $TERMINOLOGY_THEME_PATH/default-dm
        if [ -z "$1" ]; then
          clean_file  build/term/*.edj
        else
          clean_file "build/term/$1.edj"

        fi
    fi

}

clean-darkmod
