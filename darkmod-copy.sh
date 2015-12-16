#####################################################################
#                                                                   #
# This file is not intended to be used on its own it is             #
# Intended to be sourced in build-darkmod.sh and clean-darkmod.sh   #
#                                                                   #
##################################################################### 
#####################################################################
#                                                                   #
# This file is not intended to be used on its own it is             #
# Intended to be sourced in build-darkmod.sh and clean-darkmod.sh   #
#                                                                   #
#####################################################################

moveHighlightImage(){
    # if file is in img-manual don't copy
    if [ ! -f $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_DIR/$1 ]; then
        report_on_error mv $ELM_ENLIGHT_THEME_PATH/img/$1 $ELM_ENLIGHT_THEME_PATH/img-color/
    fi
}

moveBackgroundImage(){
    # if file is in img-manual don't copy
    if [ ! -f $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_DIR/$1 ]; then
        report_on_error mv $ELM_ENLIGHT_THEME_PATH/img/$1 $ELM_ENLIGHT_THEME_PATH/img-bgnd/
    fi
}

moveShadowImage(){
    # if file is in img-manual don't copy
    if [ ! -f $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_DIR/$1 ]; then
        report_on_error mv $ELM_ENLIGHT_THEME_PATH/img/$1 $ELM_ENLIGHT_THEME_PATH/img-shadow/
    fi
}

moveAllHighlightImages(){
    mkdir $ELM_ENLIGHT_THEME_PATH/img-color

    moveHighlightImage glow_lock_locked.png
    moveHighlightImage icon_border_close.png
    moveHighlightImage digit_2.png
    moveHighlightImage diagonal_stripes.png
    moveHighlightImage mini_blue_glow_arrow_1.png
    moveHighlightImage glow_exclam.png
    moveHighlightImage logo_blue_bottom.png
    moveHighlightImage icon_system-lock-screen.png
    moveHighlightImage digit_4.png
    moveHighlightImage wifi_sig_3.png
    moveHighlightImage split_h_glow.png
    moveHighlightImage cell_sig_1.png
    moveHighlightImage icon_system.png
    moveHighlightImage icon_border_stack_top.png
    moveHighlightImage col_sel_end_left.png
    moveHighlightImage home_glow.png
    moveHighlightImage cell_sig_3.png
    moveHighlightImage bulb_glow.png
    moveHighlightImage icon_border_pager.png
    moveHighlightImage digit_1.png
    moveHighlightImage logo_blue_small.png
    moveHighlightImage horizontal_separated_bar_glow.png
    moveHighlightImage win_glow.png
    moveHighlightImage icon_system-shutdown.png
    moveHighlightImage sym_close_dark_selected.png
    moveHighlightImage icon_border_pin.png
    moveHighlightImage mini_blue_glow_arrow_2.png
    moveHighlightImage digit_8.png
    moveHighlightImage icon_border_move.png
    moveHighlightImage kbd_glow.png
    moveHighlightImage icon_border_stack_bot.png
    moveHighlightImage digit_9.png
    moveHighlightImage icon_border_maximize.png
    moveHighlightImage cell_sig_4.png
    moveHighlightImage icon_border_sendto.png
    moveHighlightImage digit_6.png
    moveHighlightImage white_bar_vert_glow.png
    moveHighlightImage sym_icon_op_move.png
    moveHighlightImage outline_glow.png
    moveHighlightImage sym_down_dark_selected.png
    moveHighlightImage bt_sig_2.png
    moveHighlightImage downlight_glow_left.png
    moveHighlightImage bt_sig_1.png
    moveHighlightImage ball_small_glow.png
    moveHighlightImage wifi_sig_1.png
    moveHighlightImage icon_preferences-desktop-signal-bindings.png
    moveHighlightImage mini_blue_glow_arrow_3.png
    moveHighlightImage icon_border_shaded.png
    moveHighlightImage icon_border_border.png
    moveHighlightImage downlight_glow_up.png
    moveHighlightImage icon_border_lock.png
    moveHighlightImage therm_content.png
    moveHighlightImage sym_up_dark_selected.png
    moveHighlightImage icon_enlightenment.png
    moveHighlightImage downlight_glow.png
    moveHighlightImage sym_reload_glow_normal.png
    moveHighlightImage col_sel_end_bottom.png
    moveHighlightImage mini_blue_glow_arrow_0.png
    moveHighlightImage icon_preferences-applications-personal.png
    moveHighlightImage digit_3.png
    moveHighlightImage icon_preferences-variables.png
    moveHighlightImage vertical_separated_bar_glow.png
    moveHighlightImage horiz_glow_run.png
    moveHighlightImage icon_border_minimize.png
    moveHighlightImage media_busy_progress.png
    moveHighlightImage split_v_glow.png
    moveHighlightImage bt_base.png
    moveHighlightImage sym_up_light_selected.png
    moveHighlightImage mini_box_glow.png
    moveHighlightImage icon_preferences-interaction.png
    moveHighlightImage col_sel_end_right.png
    moveHighlightImage ic_win_move.png
    moveHighlightImage wifi_sig_2.png
    moveHighlightImage sym_icon_op_copy.png
    moveHighlightImage spanner_glow.png
    moveHighlightImage digit_7.png
    moveHighlightImage sym_heart_glow_normal.png
    moveHighlightImage digit_5.png
    moveHighlightImage sym_down_glow_normal.png
    moveHighlightImage icon_border_more.png
    moveHighlightImage icon_border_remember.png
    moveHighlightImage downlight_glow_right.png
    moveHighlightImage sym_down_light_selected.png
    moveHighlightImage cell_base.png
    moveHighlightImage icon_preferences-desktop-environments.png
    moveHighlightImage sym_right_glow_normal.png
    moveHighlightImage icon_border_stack_norm.png
    moveHighlightImage glow_round_corners_small.png
    moveHighlightImage holes_tiny_glow_vert.png
    moveHighlightImage horizontal_separated_bar_small_glow.png
    moveHighlightImage icon_border_skip.png
    moveHighlightImage icon_border_properties.png
    moveHighlightImage ic_win_resize.png
    moveHighlightImage sym_up_glow_normal.png
    moveHighlightImage digit_pm.png
    moveHighlightImage holes_tiny_glow_horiz.png
    moveHighlightImage icon_system-suspend-hibernate.png
    moveHighlightImage split_none_glow.png
    moveHighlightImage icon_border_resize.png
    moveHighlightImage ball_small_glow_intense.png
    moveHighlightImage digit_am.png
    moveHighlightImage glow_lock_unlocked.png
    moveHighlightImage icon_system-suspend.png
    moveHighlightImage wifi_base.png
    moveHighlightImage digit_0.png
    moveHighlightImage icon_system-log-out.png
    moveHighlightImage sym_left_glow_normal.png
    moveHighlightImage icon_border_kill.png
    moveHighlightImage vert_glow_run.png
    moveHighlightImage glow_lock_double.png
    moveHighlightImage col_sel_end_top.png
    moveHighlightImage glow_small.png
    moveHighlightImage sym_icon_op_ask.png
    moveHighlightImage add_glow_small.png
    moveHighlightImage logo_blue_small_glow.png
    moveHighlightImage pointer_glow.png
    moveHighlightImage sym_close_light_selected.png
    moveHighlightImage tacho_base.png
    moveHighlightImage glow_round_corners.png
    moveHighlightImage cell_sig_2.png
    moveHighlightImage icon_system-restart.png
    moveHighlightImage led_light.png
    moveHighlightImage runner_glow_horiz.png
    moveHighlightImage runner_glow_vert.png
    moveHighlightImage bg_glow_in.png
    moveHighlightImage box_glow.png
    moveHighlightImage day_left_press.png
    moveHighlightImage day_left_selected.png
    moveHighlightImage day_middle_press.png
    moveHighlightImage day_middle_selected.png
    moveHighlightImage day_right_press.png
    moveHighlightImage day_right_selected.png
    moveHighlightImage day_single_press.png
    moveHighlightImage day_single_selected.png
    moveHighlightImage emo-angry.png
    moveHighlightImage emo-angry-shout.png
    moveHighlightImage emo-crazy-laugh.png
    moveHighlightImage emo-evil-laugh.png
    moveHighlightImage emo-evil.png
    moveHighlightImage emo-goggle-smile.png
    moveHighlightImage emo-grumpy.png
    moveHighlightImage emo-grumpy-smile.png
    moveHighlightImage emo-guilty.png
    moveHighlightImage emo-guilty-smile.png
    moveHighlightImage emo-haha.png
    moveHighlightImage emo-half-smile.png
    moveHighlightImage emo-happy-panting.png
    moveHighlightImage emo-happy.png
    moveHighlightImage emo-indifferent.png
    moveHighlightImage emo-kiss.png
    moveHighlightImage emo-knowing-grin.png
    moveHighlightImage emo-laugh.png
    moveHighlightImage emo-little-bit-sorry.png
    moveHighlightImage emo-love-lots.png
    moveHighlightImage emo-love.png
    moveHighlightImage emo-minimal-smile.png
    moveHighlightImage emo-not-happy.png
    moveHighlightImage emo-not-impressed.png
    moveHighlightImage emo-omg.png
    moveHighlightImage emo-opensmile.png
    moveHighlightImage emo-smile.png
    moveHighlightImage emo-sorry.png
    moveHighlightImage emo-squint-laugh.png
    moveHighlightImage emo-surprised.png
    moveHighlightImage emo-suspicious.png
    moveHighlightImage emo-tongue-dangling.png
    moveHighlightImage emo-tongue-poke.png
    moveHighlightImage emo-uh.png
    moveHighlightImage emo-unhappy.png
    moveHighlightImage emo-very-sorry.png
    moveHighlightImage emo-what.png
    moveHighlightImage emo-wink.png
    moveHighlightImage emo-worried.png
    moveHighlightImage emo-wtf.png
    moveHighlightImage efm_generic_icon_over.png
    moveHighlightImage efm_generic_icon_over_empty.png
    moveHighlightImage eth.png
    moveHighlightImage handle_pick_up_left.png
    moveHighlightImage handle_pick_up_right.png
    moveHighlightImage horiz_glow_run_big.png
    moveHighlightImage horiz_glow_run_rev.png
    moveHighlightImage icon_apps.png
    moveHighlightImage icon_arrow_down_left.png
    moveHighlightImage icon_arrow_down.png
    moveHighlightImage icon_arrow_down_right.png
    moveHighlightImage icon_arrow_left.png
    moveHighlightImage icon_arrow_right.png
    moveHighlightImage icon_arrow_up_left.png
    moveHighlightImage icon_arrow_up.png
    moveHighlightImage icon_arrow_up_right.png
    moveHighlightImage icon_chat.png
    moveHighlightImage icon_clock.png
    moveHighlightImage icon_close.png
    moveHighlightImage icon_delete.png
    moveHighlightImage icon_edit.png
    moveHighlightImage icon_eject.png
    moveHighlightImage icon_file.png
    moveHighlightImage icon_folder.png
    moveHighlightImage icon_forward.png
    moveHighlightImage icon_head.png
    moveHighlightImage icon_home.png
    moveHighlightImage icon_info.png
    moveHighlightImage icon_mute.png
    moveHighlightImage icon_next.png
    moveHighlightImage icon_pause.png
    moveHighlightImage icon_play.png
    moveHighlightImage icon_prev.png
    moveHighlightImage icon_refresh.png
    moveHighlightImage icon_rewind.png
    moveHighlightImage icon_spanner.png
    moveHighlightImage icon_splat.png
    moveHighlightImage icon_splat_half.png
    moveHighlightImage icon_stop.png
    moveHighlightImage icon_volume.png
    moveHighlightImage icon_warning.png
    moveHighlightImage inset_bar_horiz_glow_base.png
    moveHighlightImage inset_bar_horiz_glow_inv_base.png
    moveHighlightImage inset_bar_horiz_glow_mid_base.png
    moveHighlightImage inset_bar_vert_glow_base.png
    moveHighlightImage inset_bar_vert_glow_inv_base.png
    moveHighlightImage inset_bar_vert_glow_mid_base.png
    moveHighlightImage led_tiny_blue.png
    moveHighlightImage ring_white_blue_glow.png
    moveHighlightImage packagekit_base.png
    moveHighlightImage vert_glow_run_rev.png
}

moveAllBackgroundImages(){
# move background images
    mkdir $ELM_ENLIGHT_THEME_PATH/img-bgnd
    
    moveBackgroundImage home_inset.png 
    moveBackgroundImage bevel_out.png 
    moveBackgroundImage slider_run_base_light_vert.png 
    moveBackgroundImage horiz_bar_inset.png 
    moveBackgroundImage holes_vert.png 
    moveBackgroundImage runner_vert.png 
    moveBackgroundImage split_v_hilight.png 
    moveBackgroundImage hole_pixel.png 
    moveBackgroundImage vgrad_med_dark.png 
    moveBackgroundImage mini_box_bevel_shadow.png 
    moveBackgroundImage vgrad_med_darker.png 
    moveBackgroundImage holes_tiny_vert.png 
    moveBackgroundImage vgrad_tall.png 
    moveBackgroundImage inset_round_shadow.png 
    moveBackgroundImage slider_run_bevel_vert.png 
    moveBackgroundImage led_square_shading.png 
    moveBackgroundImage spanner_hilight.png 
    moveBackgroundImage holes_horiz.png 
    moveBackgroundImage bevel_dark_out.png 
    moveBackgroundImage runner_horiz.png 
    moveBackgroundImage spanner_inset.png 
    moveBackgroundImage split_none_hilight.png 
    moveBackgroundImage split_v_inset.png 
    moveBackgroundImage hole_tiny.png 
    moveBackgroundImage bg_radgrad.png 
    moveBackgroundImage slider_run_base_vert.png 
    moveBackgroundImage vgrad_med_curved.png 
    moveBackgroundImage button_clicked.png 
    moveBackgroundImage slot_horiz_bottom.png 
    moveBackgroundImage bevel_horiz_out.png 
    moveBackgroundImage vert_bar_inset.png 
    moveBackgroundImage slider_run_base_light_horiz.png 
    moveBackgroundImage inset_shadow_tiny.png 
    moveBackgroundImage slider_run_bevel_horiz.png 
    moveBackgroundImage button_normal.png 
    moveBackgroundImage inset_shadow_circle_tiny.png 
    moveBackgroundImage split_h_inset.png 
    moveBackgroundImage bevel_in.png 
    moveBackgroundImage kbd_inset.png 
    moveBackgroundImage separator_horiz.png 
    moveBackgroundImage inset_shadow.png 
    moveBackgroundImage kbd_hilight.png 
    moveBackgroundImage split_h_hilight.png 
    moveBackgroundImage inset_round_shading.png 
    moveBackgroundImage vgrad_med_lighter.png 
    moveBackgroundImage vgrad_med.png 
    moveBackgroundImage dot_pattern.png 
    moveBackgroundImage inset_circle_tiny.png 
    moveBackgroundImage slider_run_base_horiz.png 
    moveBackgroundImage split_none_inset.png 
    moveBackgroundImage inset_round_hilight.png 
    moveBackgroundImage home_hilight.png 
    moveBackgroundImage slot_horiz_top.png 
    moveBackgroundImage holes_tiny_horiz.png 
    moveBackgroundImage bub_base_b0.png 
    moveBackgroundImage bub_base_b1.png 
    moveBackgroundImage bub_base_b2.png 
    moveBackgroundImage bub_base_bl.png 
    moveBackgroundImage bub_base_br.png 
    moveBackgroundImage bub_base_tl.png 
    moveBackgroundImage bub_base_tr.png 
    moveBackgroundImage day_left_normal.png 
    moveBackgroundImage day_middle_normal.png 
    moveBackgroundImage day_right_normal.png 
    moveBackgroundImage day_single_normal.png 
    moveBackgroundImage inset_bar_horiz_base.png 
    moveBackgroundImage inset_bar_vert_base.png 
    moveBackgroundImage tooltip-base.png 
    moveBackgroundImage tooltip-corner-bottom-left-tip.png 
    moveBackgroundImage tooltip-corner-bottom-right-tip.png 
    moveBackgroundImage tooltip-corner-top-left-tip.png 
    moveBackgroundImage tooltip-corner-top-right-tip.png 
    moveBackgroundImage tooltip-edge-bottom-tip.png 
    moveBackgroundImage tooltip-edge-left-tip.png 
    moveBackgroundImage tooltip-edge-right-tip.png 
    moveBackgroundImage tooltip-edge-top-tip.png 
}

moveAllShadowImages(){
    mkdir $ELM_ENLIGHT_THEME_PATH/img-shadow
    moveShadowImage darken_rounded_square.png
    moveShadowImage darken_rounded_square_half.png
    moveShadowImage darken_rounded_square_half_h.png
    moveShadowImage digit_na.png
    moveShadowImage digit_nm.png
    moveShadowImage rounded_square.png
    moveShadowImage shadow_inset_bevels.png
    moveShadowImage shadow_angled_in_sides.png
}

moveTerminologyHighlightImage(){
    # if file is in img-manual don't copy
    if [ ! -f $TERMINOLOGY_THEME_PATH/$MANUAL_IMAGE_DIR/$1 ]; then
        report_on_error mv $TERMINOLOGY_THEME_PATH/images/$1 $TERMINOLOGY_THEME_PATH/img-color/
    fi
}

moveTerminologyBackgroundImage(){
    # if file is in img-manual don't copy
    if [ ! -f $TERMINOLOGY_THEME_PATH/$MANUAL_IMAGE_DIR/$1 ]; then
        report_on_error mv $TERMINOLOGY_THEME_PATH/images/$1 $TERMINOLOGY_THEME_PATH/img-bgnd/
    fi
}

moveTerminologyShadowImage(){
    # if file is in img-manual don't copy
    if [ ! -f $TERMINOLOGY_THEME_PATH/$MANUAL_IMAGE_DIR/$1 ]; then
        report_on_error mv $TERMINOLOGY_THEME_PATH/images/$1 $TERMINOLOGY_THEME_PATH/img-shadow/
    fi
}

moveAllTerminologyHighlightImages(){
    mkdir $TERMINOLOGY_THEME_PATH/img-color
    moveTerminologyHighlightImage icon_about.png
    moveTerminologyHighlightImage icon_close.png
    moveTerminologyHighlightImage icon_copy.png
    moveTerminologyHighlightImage icon_new.png
    moveTerminologyHighlightImage icon_paste.png
    moveTerminologyHighlightImage icon_split_h.png
    moveTerminologyHighlightImage icon_split_v.png

    # Move in the color thats used for script generation 
    moveTerminologyHighlightImage bg_glow_in.png
}

moveAllTerminologyBackgroundImages(){
    mkdir $TERMINOLOGY_THEME_PATH/img-bgnd
    moveTerminologyBackgroundImage bg_shadow.png
    moveTerminologyBackgroundImage bg_shadow2.png
    moveTerminologyBackgroundImage bg_shadow3.png
}

moveAllTerminologyShadowImages(){
    mkdir $TERMINOLOGY_THEME_PATH/img-shadow
    moveTerminologyShadowImage inset_shadow.png
    moveTerminologyShadowImage pm_overlay.png
}
