#!/bin/bash
#####################################################################
#                                                                   #
# darkmod - Enlightenment Dark theme modifier                       #
#                                                                   #
#   You should not modify this file directly all colors and paths   #
#   can be modified in darkmod-colors-paths.sh images that you      #
#   wish to modify manually can be placed in the img-manual         #
#   directory and they will be included over the existing images    #
#                                                                   #
#####################################################################
if [[ $1 == '--epkg' ]]; then
    DKMD_EPKG=1
else
    DKMD_EPKG=0
fi

if [[ $1 == '--termpkg' ]]; then
    DKMD_TERMPKG=1
else
    DKMD_TERMPKG=0
fi

hash edje_cc 2>/dev/null || { echo >&2 "I require edje_cc but it's not installed.  Aborting."; exit 1; }
hash convert 2>/dev/null || { echo >&2 "I require the convert binary from imagemagick but it's not installed.  Aborting."; exit 1; }

# load libraries
source darkmod-color-paths.conf
source darkmod-util.sh
source darkmod-copy.sh
source clean-darkmod.sh


# Other modifications
# battery.edc
# about-theme.edc
# dark rounded rect needs to be light
# filemanager icons
# menu text
# load from param
# everything shadows

inform "Cleaning Repository"
clean-darkmod
success "    Finished Cleaning Repository"

if [[ $DKMD_TERMPKG != 1 ]]; then
inform "Creating a backup of all images"
mkdir $ELM_ENLIGHT_THEME_PATH/img-bak
report_on_error cp -vr $ELM_ENLIGHT_THEME_PATH/img/* $ELM_ENLIGHT_THEME_PATH/img-bak
success "    Finished Cleaning Repository"


inform "Moving images to be converted"
moveAllHighlightImages
moveAllBackgroundImages
moveAllShadowImages
success "    Finished Moving images that need converting"


inform "Moving images that need no conversion"
mv $ELM_ENLIGHT_THEME_PATH/img $ELM_ENLIGHT_THEME_PATH/img-no-change
success "    Finished Moving images that don't need converting"

mkdir $ELM_ENLIGHT_THEME_PATH/img-color-convd

inform "Converting images"
pushd $ELM_ENLIGHT_THEME_PATH/img-color
for F in `find -iname "*.png"`; do
        convert $F -modulate $HIGH_BRIGHTNESS,$HIGH_SATURATION,$HIGH_HUE ../img-color-convd/$F
done
popd

HIGH_RAW=$(convert $ELM_ENLIGHT_THEME_PATH/img-color-convd/bg_glow_in.png -crop "1x1+0+0" txt:-)
#HIGH_HTML=$HIGH_RAW | sed -n 's/.*\(*#[0-9][0-9][0-9][0-9][0-9][0-9]*\).*/\1/p'
#remove most of the variable content
TMP_MID=$(echo "$HIGH_RAW"| cut -d "#" -f2)
#remove the remaining fixed content
TMP_EXTRACTED=${TMP_MID#${TMP_MID:0:46}}
#form the html number
HIGH_HTML="#${TMP_EXTRACTED:0:6}"
#form the rgb number

HIGH_HTML=$(convert enlightenment-elementary/img-color-convd/bg_glow_in.png -crop "1x1+0+0" txt:- | awk 'match($0, /#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]/) {print substr($0, RSTART, RLENGTH)}')
TMP_RGB=${TMP_EXTRACTED#${TMP_EXTRACTED:0:14}}
TMP_RGB2=${TMP_RGB%")"}
TMP_RGB3=${TMP_RGB2//,/ }
HIGH_RGB=$(echo "$TMP_RGB3"| rev | cut -c 2- | rev)

set $HIGH_RGB
HIGH_RED=$1
HIGH_GREEN=$2
HIGH_BLUE=$3
#if we don't have a valid color error
if [ -z "$HIGH_HTML" ]; then
    error "Highlight Color could not be determined"
    # Move images back before exit
    report_on_error mv -v img-bak img
    exit 1
fi
if [ -z "$HIGH_RGB" ]; then
    error "Highlight Color could not be determined"
    # Move images back before exit
    report_on_error mv -v img-bak img
    exit 1
fi

if [ -d "$ELM_ENLIGHT_THEME_PATH/img-color-manual" ]; then
    pushd $ELM_ENLIGHT_THEME_PATH/img-color-manual
    for F in `find -iname "*.png"`; do
            convert $F -modulate $HIGH_BRIGHTNESS,$HIGH_SATURATION,$HIGH_HUE ../img-color-convd/$F
    done
    popd
fi

# Converting background images
pushd $ELM_ENLIGHT_THEME_PATH/img-bgnd
for F in `find -iname "*.png"`; do
    convert $F -brightness-contrast $BGND_BRIGHTNESS,$BGND_SATURATION ../img-color-convd/$F
done
popd

#converting shadows
pushd $ELM_ENLIGHT_THEME_PATH/img-shadow
for F in `find -iname "*.png"`; do
    convert $F -channel A -evaluate Multiply $SHADOW_MULT ../img-color-convd/$F
done
popd

success "    Finished Converting Images"

inform "Rewriting .edc"
pushd $ELM_ENLIGHT_THEME_PATH
report_on_error cp -a edc edc-dm

report_on_error cp -a colorclasses.edc colorclasses-dm.edc
report_on_error cp -a fonts.edc fonts-dm.edc
report_on_error cp -a macros.edc macros-dm.edc

# Replace background and highlights in edc
for F in `find edc-dm colorclasses-dm.edc macros-dm.edc -iname "*.edc"`; do
    # Highlight color
    if [[ "$HIGH_RGB" != "51 153 255" ]]; then
        sed -i "s/51 153 255/$HIGH_RGB/g" $F
        sed -i "s/#3399ff/$HIGH_HTML/g" $F
        # for battery
        sed -i "s/r = 51, g = 153, b = 255/r = $HIGH_RED, g = $HIGH_GREEN, b = $HIGH_BLUE/g" $F
    fi

    # File manager background
    if [[ "$FILEMGR_BKND_RGB" != "64 64 64" ]]; then
        sed -i "s/64 64 64/$FILEMGR_BKND_RGB/g" $F
        sed -i "s/#404040/$FILEMGR_BKND_HTML/g" $F
    fi

    # file manager alt
    if [[ "$FILEMGR_ALT_BKND_RGB" != "56 56 56" ]]; then
        sed -i "s/56 56 56/$FILEMGR_ALT_BKND_RGB/g" $F
        sed -i "s/#383838/$FILEMGR_ALT_BKND_HTML/g" $F
    fi

    # File manager image background
    if [[ "$FILEMGR_IMG_BKND_RGB" != "48 48 48" ]]; then
        sed -i "s/48 48 48/$FILEMGR_IMG_BKND_RGB/g" $F
        sed -i "s/#303030/$FILEMGR_IMG_BKND_HTML/g" $F
    fi

    # Grey boxes in pager
    if [[ "$FILEMGR_MID_GREY_RGB" != "50 50 50" ]]; then
        sed -i "s/50 50 50/$FILEMGR_MID_GREY_RGB/g" $F
        sed -i "s/#323232/$FILEMGR_MID_GREY_HTML/g" $F
    fi

    # modify html versions of text for textblock
    if [[ "$FNT_DEFAULT_HTML" != "#FFFFFF" ]]; then
        sed -i "s/#ffffff/$FNT_DEFAULT_HTML/gI" $F
        sed -i "s/#ffff/$FNT_DEFAULT_HTML/gI" $F
    fi

    if [[ "$FNT_DEFAULT_SHADOW_HTML" != "#00000080" ]]; then
        sed -i "s/#00000080/$FNT_DEFAULT_SHADOW_HTML/gI" $F
    fi

    # Disabled text
    if [[ "$FNT_DISABLED_HTML" != "#151515" ]]; then
        sed -i "s/#151515/$FNT_DISABLED_HTML/g" $F
    fi

    if [[ "$FNT_DISABLED_SHADOW_HTML" != "#FFFFFF19" ]]; then
        sed -i "s/#FFFFFF19/$FNT_DISABLED_SHADOW_HTML/gI" $F
    fi
done

# replace text colors / yes this probably doesn't need a for loop
for F in `find fonts-dm.edc -iname "*.edc"`; do
    # default text
    if [[ "$FNT_DEFAULT_RGB" != "255 255 255" ]]; then
        sed -i "s/255 255 255/$FNT_DEFAULT_RGB/g" $F
        sed -i "s/#ffffff/$FNT_DEFAULT_HTML/gI" $F
        sed -i "s/#ffff/$FNT_DEFAULT_HTML/gI" $F
    fi

    if [[ "$FNT_DEFAULT_SHADOW_RGB" != "0 0 0 128" ]]; then
        sed -i "s/0 0 0 128/$FNT_DEFAULT_SHADOW_RGB/g" $F
        sed -i "s/#00000080/$FNT_DEFAULT_SHADOW_HTML/gI" $F
    fi

    # Highlight color
    if [[ "$HIGH_RGB" != "51 153 255" ]]; then
        sed -i "s/51 153 255/$HIGH_RGB/g" $F
        sed -i "s/#3399ff/$HIGH_HTML/g" $F
    fi

    # Disabled text
    if [[ "$FNT_DISABLED_HTM" != "#151515" ]]; then
        sed -i "s/21 21 21/$FNT_DISABLED_RGB/g" $F
        sed -i "s/16 16 16 16/16 $FNT_DISABLED_RGB/g" $F
        sed -i "s/#151515/$FNT_DISABLED_HTML/g" $F
    fi

    if [[ "$FNT_DISABLED_SHADOW_RG" != "255 255 255 25" ]]; then
        sed -i "s/255 255 255 25\ns/$FNT_DISABLED_SHADOW_RGB\n/g " $F
        sed -i "s/#FFFFFF19/$FNT_DISABLED_SHADOW_HTML/gI" $F
    fi

    # Various Grey text need 4 colors so it doesn't overwrite the name instead
    sed -i "s/192 192 192 192/192 $FNT_GREY_192_RGB/g" $F
    sed -i "s/172 172 172 172/172 $FNT_GREY_172_RGB/g" $F
    sed -i "s/152 152 152 152/152 $FNT_GREY_152_RGB/g" $F

done

sed -i "s/Dark/$THEME_NAME/g" edc-dm/about-theme.edc
sed -i "s/The default theme for Enlightenment/$THEME_DESC/g" edc-dm/about-theme.edc


# #repair the definition of blue - used in startup leds
report_on_error sed -i 's/#define BLUE    152 205 87 255/#define BLUE    51 153 255 255/' edc-dm/init.edc

report_on_error cp -a default.edc default-dm.edc

report_on_error sed -i 's/"edc/"edc-dm/' default-dm.edc
report_on_error sed -i 's/"colorclasses/"colorclasses-dm/' default-dm.edc
report_on_error sed -i 's/"fonts/"fonts-dm/' default-dm.edc
report_on_error sed -i 's/"macros/"macros-dm/' default-dm.edc
success "    Finished Writing .edc"


inform "Creating theme"
edje_cc -v -id $MANUAL_IMAGE_DIR -id img-color-convd -id img-no-change -fd fnt -sd snd default-dm.edc $ELM_ENLIGHT_AUTHORS $ELM_ENLIGHT_LICENSE $THEME_NAME.edj

report_on_error mv -v img-bak img
if [[ $DKMD_EPKG != 1 && $DKMD_TERMPKG != 1 ]]; then
 report_on_error cp $THEME_NAME.edj ~/.elementary/themes
fi
popd

fi

##############################################################################################################################

if [ -n "$TERMINOLOGY_THEME_PATH" ];then
if [ $DKMD_EPKG != 1 ]; then

    mkdir $TERMINOLOGY_THEME_PATH/img-bak
    report_on_error cp -vr $TERMINOLOGY_THEME_PATH/images/* $TERMINOLOGY_THEME_PATH/img-bak

    moveAllTerminologyHighlightImages
    moveAllTerminologyBackgroundImages
    moveAllTerminologyShadowImages

    mv $TERMINOLOGY_THEME_PATH/images $TERMINOLOGY_THEME_PATH/img-no-change
    success "    Finished moving terminology images"

    mkdir $TERMINOLOGY_THEME_PATH/img-color-convd

    pushd $TERMINOLOGY_THEME_PATH/img-color
    for F in `find -iname "*.png"`; do
            convert $F -modulate $HIGH_BRIGHTNESS,$HIGH_SATURATION,$HIGH_HUE ../img-color-convd/$F
    done
    popd

    if [ -d "$TERMINOLOGY_THEME_PATH/img-color-manual" ]; then
        pushd $TERMINOLOGY_THEME_PATH/img-color-manual
            for F in `find -iname "*.png"`; do
                    convert $F -modulate $HIGH_BRIGHTNESS,$HIGH_SATURATION,$HIGH_HUE ../img-color-convd/$F
            done
        popd
    fi

    # Converting background images
    pushd $TERMINOLOGY_THEME_PATH/img-bgnd
    for F in `find -iname "*.png"`; do
        convert $F -brightness-contrast $BGND_BRIGHTNESS,$BGND_SATURATION ../img-color-convd/$F
    done
    popd

    #converting shadows
    pushd $TERMINOLOGY_THEME_PATH/img-shadow
    for F in `find -iname "*.png"`; do
        convert $F -channel A -evaluate Multiply $SHADOW_MULT ../img-color-convd/$F
    done
    popd

  if [ $DKMD_TERMPKG == 1 ]; then
	HIGH_RAW=$(convert $TERMINOLOGY_THEME_PATH/img-color-convd/bg_glow_in.png -crop "1x1+0+0" txt:-)
	#HIGH_HTML=$HIGH_RAW | sed -n 's/.*\(*#[0-9][0-9][0-9][0-9][0-9][0-9]*\).*/\1/p'
	#remove most of the variable content
	TMP_MID=$(echo "$HIGH_RAW"| cut -d "#" -f2)
	#remove the remaining fixed content
	TMP_EXTRACTED=${TMP_MID#${TMP_MID:0:46}}
	#form the html number
	HIGH_HTML="#${TMP_EXTRACTED:0:6}"

  HIGH_HTML=$(convert enlightenment-elementary/img-color-convd/bg_glow_in.png -crop "1x1+0+0" txt:- | awk 'match($0, /#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]/) {print substr($0, RSTART, RLENGTH)}')
	#form the rgb number
	TMP_RGB=${TMP_EXTRACTED#${TMP_EXTRACTED:0:14}}
	TMP_RGB2=${TMP_RGB%")"}
	TMP_RGB3=${TMP_RGB2//,/ }
	HIGH_RGB=$(echo "$TMP_RGB3"| rev | cut -c 2- | rev)


    pushd $TERMINOLOGY_THEME_PATH
    report_on_error cp -a default.edc default-dm.edc
    report_on_error cp -a default_colors.in.edc default-dm_colors.in.edc

    sed -i "s/default_colors.in.edc/default-dm_colors.in.edc/g" default-dm.edc

    # Replace background and highlights in edc
    for F in `find default-dm.edc default-dm_colors.in.edc -iname "*.edc"`; do
        # Highlight color
        if [[ "$HIGH_RGB" != "51 153 255" ]]; then
            sed -i "s/51 153 255/$HIGH_RGB/g" $F
            sed -i "s/#3399ff/$HIGH_HTML/g" $F
            sed -i "s/r = 51, g = 153, b = 255/r = $HIGH_RED, g = $HIGH_GREEN, b = $HIGH_BLUE/g" $F
        fi


        # File manager background
        if [[ "$FILEMGR_BKND_RGB" != "64 64 64" ]]; then
            sed -i "s/64 64 64/$FILEMGR_BKND_RGB/g" $F
            sed -i "s/#404040/$FILEMGR_BKND_HTML/g" $F
        fi

        # file manager alt
        if [[ "$FILEMGR_ALT_BKND_RGB" != "56 56 56" ]]; then
            sed -i "s/56 56 56/$FILEMGR_ALT_BKND_RGB/g" $F
            sed -i "s/#383838/$FILEMGR_ALT_BKND_HTML/g" $F
        fi

        # File manager image background
        if [[ "$FILEMGR_IMG_BKND_RGB" != "48 48 48" ]]; then
            sed -i "s/48 48 48/$FILEMGR_IMG_BKND_RGB/g" $F
            sed -i "s/#303030/$FILEMGR_IMG_BKND_HTML/g" $F
        fi

        # Grey boxes in pager
        if [[ "$FILEMGR_MID_GREY_RGB" != "50 50 50" ]]; then
            sed -i "s/50 50 50/$FILEMGR_MID_GREY_RGB/g" $F
            sed -i "s/#323232/$FILEMGR_MID_GREY_HTML/g" $F
        fi

        # modify html versions of text for textblock
        if [[ "$FNT_DEFAULT_HTML" != "#ffffff" ]]; then
            sed -i "s/#ffffff/$FNT_DEFAULT_HTML/gI" $F
            sed -i "s/#ffff/$FNT_DEFAULT_HTML/gI" $F
        fi

        if [[ "$FNT_DEFAULT_SHADOW_HTML" != "#00000080" ]]; then
            sed -i "s/#00000080/$FNT_DEFAULT_SHADOW_HTML/gI" $F
        fi

        # Disabled text
        if [[ "$FNT_DISABLED_HTML" != "#151515" ]]; then
            sed -i "s/#151515/$FNT_DISABLED_HTML/g" $F
        fi

        if [[ "$FNT_DISABLED_SHADOW_HTML" != "#FFFFFF19" ]]; then
            sed -i "s/#FFFFFF19/$FNT_DISABLED_SHADOW_HTML/gI" $F
        fi

        #terminology background
        if [[ "$TERMINOLOGY_BACKGROUND" != "32 32 32" ]]; then
            sed -i "s/32 32 32/$TERMINOLOGY_BACKGROUND/g" $F
        fi

    done
    edje_cc -v -id $MANUAL_IMAGE_DIR -id img-color-convd -id img-no-change -sd sounds default-dm.edc $TERMINOLOGY_LICENSE $TERMINOLOGY_AUTHORS $THEME_NAME.edj

    report_on_error mv -v img-bak images

    if [ $DKMD_TERMPKG != 1 ]; then
	report_on_error cp $THEME_NAME.edj ~/.config/terminology/themes
    fi
popd
fi
fi
fi

# TBD: copy back to current dir, and to .e file
