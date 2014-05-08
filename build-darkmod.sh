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
    sed -i "s/51 153 255/$HIGH_RGB/g" $F
    sed -i "s/#3399ff/$HIGH_HTML/g" $F
    sed -i "s/r = 51, g = 153, b = 255/r = $HIGH_RED, g = $HIGH_GREEN, b = $HIGH_BLUE/g" $F
    
    # File manager background
    sed -i "s/64 64 64/$FILEMGR_BKND_RGB/g" $F
    sed -i "s/#404040/$FILEMGR_BKND_HTML/g" $F
    
    # file manager alt
    sed -i "s/56 56 56/$FILEMGR_ALT_BKND_RGB/g" $F
    sed -i "s/#383838/$FILEMGR_ALT_BKND_HTML/g" $F
    
    # File manager image background
    sed -i "s/48 48 48/$FILEMGR_IMG_BKND_RGB/g" $F
    sed -i "s/#303030/$FILEMGR_IMG_BKND_HTML/g" $F
    
    # Grey boxes in pager
    sed -i "s/50 50 50/$FILEMGR_MID_GREY_RGB/g" $F
    sed -i "s/#323232/$FILEMGR_MID_GREY_HTML/g" $F
    
    # modify html versions of text for textblock
    sed -i "s/#ffffff/$FNT_DEFAULT_HTML/gI" $F
    sed -i "s/#ffff/$FNT_DEFAULT_HTML/gI" $F
    
    sed -i "s/#00000080/$FNT_DEFAULT_SHADOW_HTML/gI" $F
    
    # Disabled text
    sed -i "s/#151515/$FNT_DISABLED_HTML/g" $F
    
    sed -i "s/#FFFFFF19/$FNT_DISABLED_SHADOW_HTML/gI" $F
  
done

# replace text colors / yes this probably doesn't need a for loop
for F in `find fonts-dm.edc -iname "*.edc"`; do
    # default text
    sed -i "s/255 255 255/$FNT_DEFAULT_RGB/g" $F
    sed -i "s/#ffffff/$FNT_DEFAULT_HTML/gI" $F
    sed -i "s/#ffff/$FNT_DEFAULT_HTML/gI" $F
    
    sed -i "s/0 0 0 128/$FNT_DEFAULT_SHADOW_RGB/g" $F
    sed -i "s/#00000080/$FNT_DEFAULT_SHADOW_HTML/gI" $F
    
    # Highlight color
    sed -i "s/51 153 255/$HIGH_RGB/g" $F
    sed -i "s/#3399ff/$HIGH_HTML/g" $F
    
    # Disabled text
    sed -i "s/21 21 21/$FNT_DISABLED_RGB/g" $F
    sed -i "s/16 16 16 16/16 $FNT_DISABLED_RGB/g" $F
    sed -i "s/#151515/$FNT_DISABLED_HTML/g" $F
    
    sed -i "s/255 255 255 25/$FNT_DISABLED_SHADOW_RGB/g" $F
    sed -i "s/#FFFFFF19/$FNT_DISABLED_SHADOW_HTML/gI" $F
    
    # Various Grey text need 4 colors so it doesn't overwrite the name instead
    sed -i "s/192 192 192 192/192 $FNT_GREY_192_RGB/g" $F
    sed -i "s/172 172 172 172/172 $FNT_GREY_172_RGB/g" $F
    sed -i "s/152 152 152 152/152 $FNT_GREY_152_RGB/g" $F
    
done

# #repair the definition of blue - used in startup leds
report_on_error sed -i 's/#define BLUE    152 205 87 255/#define BLUE    51 153 255 255/' edc-dm/init.edc

report_on_error cp -a default.edc default-dm.edc

report_on_error sed -i 's/"edc/"edc-dm/' default-dm.edc
report_on_error sed -i 's/"colorclasses/"colorclasses-dm/' default-dm.edc
report_on_error sed -i 's/"fonts/"fonts-dm/' default-dm.edc
report_on_error sed -i 's/"macros/"macros-dm/' default-dm.edc
success "    Finished Writing .edc"


inform "Creating theme"
edje_cc -v -id img-no-change -id img-color-convd -id $MANUAL_IMAGE_DIR -fd fnt -sd snd default-dm.edc darkmod.edj

report_on_error mv -v img-bak img

report_on_error cp darkmod.edj ~/.elementary/themes
popd

# TBD: copy back to current dir, and to .e file