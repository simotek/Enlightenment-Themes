
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

mv img/glow_lock_locked.png img-color/
mv img/icon_border_close.png img-color/
mv img/digit_2.png img-color/
mv img/diagonal_stripes.png img-color/
mv img/mini_blue_glow_arrow_1.png img-color/
mv img/glow_exclam.png img-color/
mv img/logo_blue_bottom.png img-color/
mv img/icon_system-lock-screen.png img-color/
mv img/digit_4.png img-color/
mv img/wifi_sig_3.png img-color/
mv img/split_h_glow.png img-color/
mv img/cell_sig_1.png img-color/
mv img/icon_system.png img-color/
mv img/icon_border_stack_top.png img-color/
mv img/col_sel_end_left.png img-color/
mv img/home_glow.png img-color/
mv img/cell_sig_3.png img-color/
mv img/bulb_glow.png img-color/
mv img/icon_border_pager.png img-color/
mv img/digit_1.png img-color/
mv img/logo_blue_small.png img-color/
mv img/horizontal_separated_bar_glow.png img-color/
mv img/next.png img-color/
mv img/win_glow.png img-color/
mv img/icon_system-shutdown.png img-color/
mv img/sym_close_dark_selected.png img-color/
mv img/icon_border_pin.png img-color/
mv img/mini_blue_glow_arrow_2.png img-color/
mv img/digit_8.png img-color/
mv img/icon_border_move.png img-color/
mv img/kbd_glow.png img-color/
mv img/icon_border_stack_bot.png img-color/
mv img/digit_9.png img-color/
mv img/icon_border_maximize.png img-color/
mv img/cell_sig_4.png img-color/
mv img/icon_border_sendto.png img-color/
mv img/digit_6.png img-color/
mv img/white_bar_vert_glow.png img-color/
mv img/sym_icon_op_move.png img-color/
mv img/outline_glow.png img-color/
mv img/sym_down_dark_selected.png img-color/
mv img/bt_sig_2.png img-color/
mv img/downlight_glow_left.png img-color/
mv img/bt_sig_1.png img-color/
mv img/ball_small_glow.png img-color/
mv img/wifi_sig_1.png img-color/
mv img/icon_preferences-desktop-signal-bindings.png img-color/
mv img/mini_blue_glow_arrow_3.png img-color/
mv img/icon_border_shaded.png img-color/
mv img/icon_border_border.png img-color/
mv img/downlight_glow_up.png img-color/
mv img/icon_border_lock.png img-color/
mv img/therm_content.png img-color/
mv img/sym_up_dark_selected.png img-color/
mv img/icon_enlightenment.png img-color/
mv img/downlight_glow.png img-color/
mv img/sym_reload_glow_normal.png img-color/
mv img/col_sel_end_bottom.png img-color/
mv img/mini_blue_glow_arrow_0.png img-color/
mv img/icon_preferences-applications-personal.png img-color/
mv img/digit_3.png img-color/
mv img/icon_preferences-variables.png img-color/
mv img/vertical_separated_bar_glow.png img-color/
mv img/horiz_glow_run.png img-color/
mv img/icon_border_minimize.png img-color/
mv img/media_busy_progress.png img-color/
mv img/split_v_glow.png img-color/
mv img/bt_base.png img-color/
mv img/sym_up_light_selected.png img-color/
mv img/mini_box_glow.png img-color/
mv img/icon_preferences-interaction.png img-color/
mv img/col_sel_end_right.png img-color/
mv img/ic_win_move.png img-color/
mv img/wifi_sig_2.png img-color/
mv img/sym_icon_op_copy.png img-color/
mv img/spanner_glow.png img-color/
mv img/digit_7.png img-color/
mv img/sym_heart_glow_normal.png img-color/
mv img/digit_5.png img-color/
mv img/sym_down_glow_normal.png img-color/
mv img/icon_border_more.png img-color/
mv img/icon_border_remember.png img-color/
mv img/downlight_glow_right.png img-color/
mv img/sym_down_light_selected.png img-color/
mv img/cell_base.png img-color/
mv img/icon_preferences-desktop-environments.png img-color/
mv img/sym_right_glow_normal.png img-color/
mv img/icon_border_stack_norm.png img-color/
mv img/glow_round_corners_small.png img-color/
mv img/holes_tiny_glow_vert.png img-color/
mv img/horizontal_separated_bar_small_glow.png img-color/
mv img/icon_border_skip.png img-color/
mv img/icon_border_properties.png img-color/
mv img/ic_win_resize.png img-color/
mv img/sym_up_glow_normal.png img-color/
mv img/digit_pm.png img-color/
mv img/holes_tiny_glow_horiz.png img-color/
mv img/icon_system-suspend-hibernate.png img-color/
mv img/split_none_glow.png img-color/
mv img/icon_border_resize.png img-color/
mv img/ball_small_glow_intense.png img-color/
mv img/digit_am.png img-color/
mv img/glow_lock_unlocked.png img-color/
mv img/icon_system-suspend.png img-color/
mv img/wifi_base.png img-color/
mv img/digit_0.png img-color/
mv img/icon_system-log-out.png img-color/
mv img/sym_left_glow_normal.png img-color/
mv img/icon_border_kill.png img-color/
mv img/vert_glow_run.png img-color/
mv img/glow_lock_double.png img-color/
mv img/col_sel_end_top.png img-color/
mv img/glow_small.png img-color/
mv img/sym_icon_op_ask.png img-color/
mv img/add_glow_small.png img-color/
mv img/logo_blue_small_glow.png img-color/
mv img/pointer_glow.png img-color/
mv img/sym_close_light_selected.png img-color/
mv img/tacho_base.png img-color/
mv img/glow_round_corners.png img-color/
mv img/cell_sig_2.png img-color/
mv img/icon_system-restart.png img-color/
mv img/led_light.png img-color/
mv img/runner_glow_horiz.png img-color/
mv img/runner_glow_vert.png img-color/

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
        #    convert $F -modulate 79,50,32 ../img-color-convd/$F
done
popd

pushd img-bgnd
for F in `find -iname "*.png"`; do
        #modulate blue to be green in all images
        # convert $F -modulate 80,20,120 ../img-color-convd/$F
done
popd

echo "Rewriting .edc..."
rm -rf edc-sb
cp -a edc edc-sb
for F in `find edc-sb -iname "*.edc"`; do
    #replace color blue by green in all edcrr
    #sed -i 's/51 153 255/152 205 87/' $F
    #5e993b was target
    #sed -i 's/#3399ff/#98cd57/' $F
    
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
#sed -i 's/#define BLUE    152 205 87 255/#define BLUE    51 153 255 255/' edc-sb/init.edc

cp -a default.edc default-sb.edc

#sed -i 's/"edc/"edc-sb/' default-sb.edc

rm default-sb.edj
edje_cc -v -id img-no-change -id img-color-convd -id img-manual default-sb.edc  default-sb.edj
echo $PWD
mv -v img-bak img