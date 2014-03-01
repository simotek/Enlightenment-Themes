#!/bin/bash

source darkmod-color-paths.conf
source darkmod-util.sh

clean-darkmod(){
    # TBD: These should check if the file exists
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-color
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-bgnd
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-color-convd
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-no-change
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-bak
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/edc-sb
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/colorclasses-sb.edc
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/fonts-sb.edc
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/macros-sb.edc
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/default-sb.edc
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/default-sb.edj
}

clean-darkmod