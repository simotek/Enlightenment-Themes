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

inform "Creating a backup of all images"
mkdir $ELM_ENLIGHT_THEME_PATH/img-bak
report_on_error cp -vr $ELM_ENLIGHT_THEME_PATH/img/* $ELM_ENLIGHT_THEME_PATH/img-bak

inform "Moving images to be converted"
moveAllHighlightImages
moveAllBackgroundImages

inform "Moving images that need no conversion"
mv $ELM_ENLIGHT_THEME_PATH/img $ELM_ENLIGHT_THEME_PATH/img-no-change

mkdir $ELM_ENLIGHT_THEME_PATH/img-color-convd

echo "Converting images..."
pushd $ELM_ENLIGHT_THEME_PATH/img-color
for F in `find -iname "*.png"`; do
        #modulate blue to be green in all images
        #100  60 80 84 75 79 84
        #80   61 58 85 75 80 74
        # 210 97 87 106 93 84 84
        #    convert $F -modulate 80,74,42 ../img-color-convd/$F
        #    convert $F -modulate 78,60,35 ../img-color-convd/$F
        #    convert $F -modulate 79,66,30 ../img-color-convd/$F
        convert $F -modulate 79,50,32 ../img-color-convd/$F
done
popd

pushd $ELM_ENLIGHT_THEME_PATH/img-bgnd
for F in `find -iname "*.png"`; do
        #modulate blue to be green in all images
        convert $F -modulate 80,20,120 ../img-color-convd/$F
done
popd

inform "Rewriting .edc..."
pushd $ELM_ENLIGHT_THEME_PATH
report_on_error cp -a edc edc-sb

report_on_error cp -a colorclasses.edc colorclasses-sb.edc
report_on_error cp -a fonts.edc fonts-sb.edc
report_on_error cp -a macros.edc macros-sb.edc

for F in `find edc-sb colorclasses-sb.edc fonts-sb.edc macros-sb.edc -iname "*.edc"`; do
    echo $F
    #replace color blue by green in all edcrr
    sed -i 's/51 153 255/255 0 0/' $F
    #5e993b was target
    sed -i 's/#3399ff/#FF0000/' $F
    
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

#repair the definition of blue
sed -i 's/#define BLUE    152 205 87 255/#define BLUE    51 153 255 255/' edc-sb/init.edc

report_on_error cp -a default.edc default-sb.edc

report_on_error sed -i 's/"edc/"edc-sb/' default-sb.edc
report_on_error sed -i 's/"colorclasses/"colorclasses-sb/' default-sb.edc
report_on_error sed -i 's/"fonts/"fonts-sb/' default-sb.edc
report_on_error sed -i 's/"macros/"macros-sb/' default-sb.edc

echo $PWD
edje_cc -v -id img-no-change -id img-color-convd -id $MANUAL_IMAGE_DIR -fd fnt -sd snd default-sb.edc default-sb.edj
echo $PWD
report_on_error mv -v img-bak img

popd

# TBD: copy back to current dir, and to .e file