#!/bin/bash

source darkmod-color-paths.conf
source darkmod-util.sh

clean-darkmod(){
    # TBD: These should check if the file exists
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-color
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-bgnd
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-shadow
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-color-convd
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-no-change
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/img-bak
    report_on_error rm -rf $ELM_ENLIGHT_THEME_PATH/edc-dm
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/colorclasses-dm.edc
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/fonts-dm.edc
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/macros-dm.edc
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/default-dm.edc
    report_on_error rm $ELM_ENLIGHT_THEME_PATH/$THEME_NAME.edj
    report_on_error rm -r $ELM_ENLIGHT_THEME_PATH/$THEME_NAME-icons

    if [ -n "$TERMINOLOGY_THEME_PATH" ]; then
        report_on_error rm -rf $TERMINOLOGY_THEME_PATH/img-color
        report_on_error rm -rf $TERMINOLOGY_THEME_PATH/img-bgnd
        report_on_error rm -rf $TERMINOLOGY_THEME_PATH/img-shadow
        report_on_error rm -rf $TERMINOLOGY_THEME_PATH/img-color-convd
        report_on_error rm -rf $TERMINOLOGY_THEME_PATH/img-no-change
        report_on_error rm -rf $TERMINOLOGY_THEME_PATH/img-bak
        report_on_error rm -rf $TERMINOLOGY_THEME_PATH/default-dm.edc
                report_on_error rm -rf $TERMINOLOGY_THEME_PATH/default-dm_colors.in.edc
    fi

}

clean-darkmod
