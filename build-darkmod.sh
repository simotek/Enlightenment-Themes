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
# fileman 1093 -> removed border

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
success "    Finished Moving images that need converting"


inform "Moving images that need no conversion"
mv $ELM_ENLIGHT_THEME_PATH/img $ELM_ENLIGHT_THEME_PATH/img-no-change
success "    Finished Moving images that don't need converting"

mkdir $ELM_ENLIGHT_THEME_PATH/img-color-convd

inform "Converting images"
pushd $ELM_ENLIGHT_THEME_PATH/img-color
for F in `find -iname "*.png"`; do
        #modulate blue to be green in all images
        #100  60 80 84 75 79 84
        #80   61 58 85 75 80 74
        # 210 97 87 106 93 84 84
        #    convert $F -modulate 80,74,42 ../img-color-convd/$F
        #    convert $F -modulate 78,60,35 ../img-color-convd/$F
        #    convert $F -modulate 79,66,30 ../img-color-convd/$F
        convert $F -modulate $HIGH_BRIGHTNESS,$HIGH_SATURATION,$HIGH_HUE ../img-color-convd/$F
done
popd

HIGH_RAW=$(convert $ELM_ENLIGHT_THEME_PATH/img-color-convd/bg_glow_in.png -crop "1x1+0+0" txt:-)
echo $HIGH_RAW
#HIGH_HTML=$HIGH_RAW | sed -n 's/.*\(*#[0-9][0-9][0-9][0-9][0-9][0-9]*\).*/\1/p'
#remove most of the variable content
TMP_MID=$(echo "$HIGH_RAW"| cut -d "#" -f2)
echo $TMP_MID
#remove the remaining fixed content
TMP_EXTRACTED=${TMP_MID#${TMP_MID:0:46}}
#form the html number
HIGH_HTML="#${TMP_EXTRACTED:0:6}"
#form the rgb number
TMP_RGB=${TMP_EXTRACTED#${TMP_EXTRACTED:0:14}}
TMP_RGB2=${TMP_RGB%")"}
TMP_RGB3=${TMP_RGB2//,/ }
HIGH_RGB=$(echo "$TMP_RGB3"| rev | cut -c 2- | rev)
warn $HIGH_RGB 
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
 
pushd $ELM_ENLIGHT_THEME_PATH/img-bgnd
for F in `find -iname "*.png"`; do
        #modulate blue to be green in all images
        convert $F -modulate 80,20,120 ../img-color-convd/$F
done
popd
success "    Finished Converting Images"

inform "Rewriting .edc"
pushd $ELM_ENLIGHT_THEME_PATH
report_on_error cp -a edc edc-dm

report_on_error cp -a colorclasses.edc colorclasses-dm.edc
report_on_error cp -a fonts.edc fonts-dm.edc
report_on_error cp -a macros.edc macros-dm.edc


for F in `find edc-dm colorclasses-dm.edc fonts-dm.edc macros-dm.edc -iname "*.edc"`; do
    #replace color blue by green in all edc
    sed -i "s/51 153 255/$HIGH_RGB/g" $F
    #5e993b was target
    sed -i "s/#3399ff/$HIGH_HTML/g" $F
    
    # File manager background
    #sed -i 's/64 64 64/14 18 19/' $F
    
    #sed -i 's/#404040/#0e1213/' $F
    
    # file manager alt
    #next is 56 56 56 -> 34 39 42
    #    #383838 -> #22272a
    #sed -i 's/56 56 56/34 39 42/' $F
    #sed -i 's/#383838/#22272a/' $F
    
    # File manager image background
    # 303030, 48 48 48 -> 172526 23 37 38
    #sed -i 's/48 48 48/23 37 38/' $F
    #sed -i 's/#303030/#172526/' $F
    
    # text in alt bars
    # 101010 16 16 16
    #sed -i 's/21 21 21/152 205 87/' $F
    #sed -i 's/#151515/#98cd57/' $F
    
    # Grey boxes in pager
    # 333333 51 51 51
    # sed -i 's/50 50 50/23 37 38/' $F
    # sed -i 's/#323232/#172526/' $F
    
    # other images in gimp colorize 201 12 -47

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