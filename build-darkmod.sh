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
source darkmod-colors-paths.sh
source darkmod-util.sh
source darkmod-copy.sh

# Other modifications
# battery.edc
# about-theme.edc
# fileman 1093 -> removed border

echo "moving images..."
rm -rf img-color
rm -rf img-bgnd
rm -rf img-color-convd
rm -rf img-no-change

mkdir img-bak

cp -vr img/* img-bak
mkdir img-color
mkdir img-bgnd

moveAllHighlightImages


# move background images
mv img/home_inset.png img-bgnd/
mv img/bevel_out.png img-bgnd/
mv img/slider_run_base_light_vert.png img-bgnd/
mv img/horiz_bar_inset.png img-bgnd/
mv img/holes_vert.png img-bgnd/
mv img/runner_vert.png img-bgnd/
mv img/split_v_hilight.png img-bgnd/
mv img/hole_pixel.png img-bgnd/
mv img/vgrad_med_dark.png img-bgnd/
mv img/mini_box_bevel_shadow.png img-bgnd/
mv img/vgrad_med_darker.png img-bgnd/
mv img/holes_tiny_vert.png img-bgnd/
mv img/vgrad_tall.png img-bgnd/
mv img/inset_round_shadow.png img-bgnd/
mv img/slider_run_bevel_vert.png img-bgnd/
mv img/led_square_shading.png img-bgnd/
mv img/spanner_hilight.png img-bgnd/
mv img/holes_horiz.png img-bgnd/
mv img/bevel_dark_out.png img-bgnd/
mv img/runner_horiz.png img-bgnd/
mv img/spanner_inset.png img-bgnd/
mv img/split_none_hilight.png img-bgnd/
mv img/split_v_inset.png img-bgnd/
mv img/hole_tiny.png img-bgnd/
mv img/bg_radgrad.png img-bgnd/
mv img/slider_run_base_vert.png img-bgnd/
mv img/vgrad_med_curved.png img-bgnd/
mv img/button_clicked.png img-bgnd/
mv img/slot_horiz_bottom.png img-bgnd/
mv img/bevel_horiz_out.png img-bgnd/
mv img/vert_bar_inset.png img-bgnd/
mv img/slider_run_base_light_horiz.png img-bgnd/
mv img/inset_shadow_tiny.png img-bgnd/
mv img/slider_run_bevel_horiz.png img-bgnd/
mv img/button_normal.png img-bgnd/
mv img/inset_shadow_circle_tiny.png img-bgnd/
mv img/split_h_inset.png img-bgnd/
mv img/bevel_in.png img-bgnd/
mv img/kbd_inset.png img-bgnd/
mv img/separator_horiz.png img-bgnd/
mv img/inset_shadow.png img-bgnd/
mv img/kbd_hilight.png img-bgnd/
mv img/split_h_hilight.png img-bgnd/
mv img/inset_round_shading.png img-bgnd/
mv img/vgrad_med_lighter.png img-bgnd/
mv img/vgrad_med.png img-bgnd/
mv img/dot_pattern.png img-bgnd/
mv img/inset_circle_tiny.png img-bgnd/
mv img/slider_run_base_horiz.png img-bgnd/
mv img/split_none_inset.png img-bgnd/
mv img/inset_round_hilight.png img-bgnd/
mv img/home_hilight.png img-bgnd/
mv img/slot_horiz_top.png img-bgnd/
mv img/holes_tiny_horiz.png img-bgnd/
mv img/bub_base_b0.png img-bgnd/
mv img/bub_base_b1.png img-bgnd/
mv img/bub_base_b2.png img-bgnd/
mv img/bub_base_bl.png img-bgnd/
mv img/bub_base_br.png img-bgnd/
mv img/bub_base_tl.png img-bgnd/
mv img/bub_base_tr.png img-bgnd/
mv img/day_left_normal.png img-bgnd/
mv img/day_middle_normal.png img-bgnd/
mv img/day_right_normal.png img-bgnd/
mv img/day_single_normal.png img-bgnd/
mv img/inset_bar_horiz_base.png img-bgnd/
mv img/inset_bar_vert_base.png img-bgnd/
mv img/tooltip-base.png img-bgnd/
mv img/tooltip-corner-bottom-left-tip.png img-bgnd/
mv img/tooltip-corner-bottom-right-tip.png img-bgnd/
mv img/tooltip-corner-top-left-tip.png img-bgnd/
mv img/tooltip-corner-top-right-tip.png img-bgnd/
mv img/tooltip-edge-bottom-tip.png img-bgnd/
mv img/tooltip-edge-left-tip.png img-bgnd/
mv img/tooltip-edge-right-tip.png img-bgnd/
mv img/tooltip-edge-top-tip.png img-bgnd/

mv img img-no-change

mkdir img-color-convd

echo "Converting images..."
pushd img-color
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

pushd img-bgnd
for F in `find -iname "*.png"`; do
        #modulate blue to be green in all images
        convert $F -modulate 80,20,120 ../img-color-convd/$F
done
popd

echo "Rewriting .edc..."
rm -rf edc-sb
cp -a edc edc-sb

#clean up
rm colorclasses-sb.edc
rm fonts-sb.edc
rm macros-sb.edc

cp -a colorclasses.edc colorclasses-sb.edc
cp -a fonts.edc fonts-sb.edc
cp -a macros.edc macros-sb.edc
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

rm default-sb.edc
cp -a default.edc default-sb.edc

sed -i 's/"edc/"edc-sb/' default-sb.edc
sed -i 's/"colorclasses/"colorclasses-sb/' default-sb.edc
sed -i 's/"fonts/"fonts-sb/' default-sb.edc
sed -i 's/"macros/"macros-sb/' default-sb.edc

rm default-sb.edj
edje_cc -v -id img-no-change -id img-color-convd -id img-manual -fd fnt default-sb.edc default-sb.edj
echo $PWD
mv -v img-bak img