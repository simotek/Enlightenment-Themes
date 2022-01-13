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
        # check if its a manual image
        if [ -f $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_CONVD_DIR/$1 ]; then
            report_on_error mv $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_CONVD_DIR/$1 $ELM_ENLIGHT_THEME_PATH/img-color/
        else
            report_on_error mv $ELM_ENLIGHT_THEME_PATH/img/$1 $ELM_ENLIGHT_THEME_PATH/img-color/
        fi
    fi
}

moveBackgroundImage(){
    # if file is in img-manual don't copy
    if [ ! -f $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_DIR/$1 ]; then
        # check if its a manual image
        if [ -f $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_CONVD_DIR/$1 ]; then
            echo "bkgnd $1"
            report_on_error mv $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_CONVD_DIR/$1 $ELM_ENLIGHT_THEME_PATH/img-bgnd/
        else
            report_on_error mv $ELM_ENLIGHT_THEME_PATH/img/$1 $ELM_ENLIGHT_THEME_PATH/img-bgnd/
        fi
    fi
}

moveShadowImage(){
    # if file is in img-manual don't copy
    if [ ! -f $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_DIR/$1 ]; then
        # check if its a manual image
        echo "cvd: $MANUAL_IMAGE_CONVD_DIR"
        echo "$ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_CONVD_DIR/$1"
        if [ -f $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_CONVD_DIR/$1 ]; then
            echo "Shadow $1"
            report_on_error mv $ELM_ENLIGHT_THEME_PATH/$MANUAL_IMAGE_CONVD_DIR/$1 $ELM_ENLIGHT_THEME_PATH/img-shadow/
        else
            report_on_error mv $ELM_ENLIGHT_THEME_PATH/img/$1 $ELM_ENLIGHT_THEME_PATH/img-shadow/
        fi
    fi
}

moveAllHighlightImages(){
    mkdir $ELM_ENLIGHT_THEME_PATH/img-color

    moveHighlightImage add_glow_small.png
    moveHighlightImage ball_small_glow_intense.png
    moveHighlightImage ball_small_glow.png
    moveHighlightImage bg_glow_in.png
    moveHighlightImage box_glow.png
    moveHighlightImage bt_base.png
    moveHighlightImage bt_sig_1.png
    moveHighlightImage bt_sig_2.png
    moveHighlightImage btn_round_1.png
    moveHighlightImage btn_round_2.png
    moveHighlightImage bulb_glow.png
    moveHighlightImage cell_base.png
    moveHighlightImage cell_sig_1.png
    moveHighlightImage cell_sig_2.png
    moveHighlightImage cell_sig_3.png
    moveHighlightImage cell_sig_4.png
    moveHighlightImage col_sel_end_bottom.png
    moveHighlightImage col_sel_end_left.png
    moveHighlightImage col_sel_end_right.png
    moveHighlightImage col_sel_end_top.png
    moveHighlightImage day_left_press.png
    moveHighlightImage day_left_selected.png
    moveHighlightImage day_middle_press.png
    moveHighlightImage day_middle_selected.png
    moveHighlightImage day_right_press.png
    moveHighlightImage day_right_selected.png
    moveHighlightImage day_single_press.png
    moveHighlightImage day_single_selected.png
    moveHighlightImage diagonal_stripes.png
    moveHighlightImage downlight_glow_left.png
    moveHighlightImage downlight_glow.png
    moveHighlightImage downlight_glow_right.png
    moveHighlightImage downlight_glow_up.png
    moveHighlightImage efm_generic_icon_over_empty.png
    moveHighlightImage efm_generic_icon_over.png
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
    moveHighlightImage eth.png
    moveHighlightImage glow_exclam.png
    moveHighlightImage glow_lock_double.png
    moveHighlightImage glow_lock_locked.png
    moveHighlightImage glow_lock_unlocked.png
    moveHighlightImage glow_round_corners.png
    moveHighlightImage glow_round_corners_small.png
    moveHighlightImage glow_small.png
    moveHighlightImage handle_pick_up_left.png
    moveHighlightImage handle_pick_up_right.png
    moveHighlightImage holes_tiny_glow_horiz.png
    moveHighlightImage holes_tiny_glow_vert.png
    moveHighlightImage home_glow.png
    moveHighlightImage horiz_glow_range.png
    moveHighlightImage horiz_glow_run_big.png
    moveHighlightImage horiz_glow_run.png
    moveHighlightImage horiz_glow_run_rev.png
    moveHighlightImage horizontal_separated_bar_glow.png
    moveHighlightImage horizontal_separated_bar_small_glow.png
    moveHighlightImage icon_apps.png
    moveHighlightImage icon_arrow_down_left.png
    moveHighlightImage icon_arrow_down.png
    moveHighlightImage icon_arrow_down_right.png
    moveHighlightImage icon_arrow_left.png
    moveHighlightImage icon_arrow_right.png
    moveHighlightImage icon_arrow_up_left.png
    moveHighlightImage icon_arrow_up.png
    moveHighlightImage icon_arrow_up_right.png
    moveHighlightImage icon_border_border.png
    moveHighlightImage icon_border_close.png
    moveHighlightImage icon_border_kill.png
    moveHighlightImage icon_border_lock.png
    moveHighlightImage icon_border_maximize.png
    moveHighlightImage icon_border_minimize.png
    moveHighlightImage icon_border_more.png
    moveHighlightImage icon_border_move.png
    moveHighlightImage icon_border_pager.png
    moveHighlightImage icon_border_pin.png
    moveHighlightImage icon_border_properties.png
    moveHighlightImage icon_border_remember.png
    moveHighlightImage icon_border_resize.png
    moveHighlightImage icon_border_sendto.png
    moveHighlightImage icon_border_shaded.png
    moveHighlightImage icon_border_skip.png
    moveHighlightImage icon_border_stack_bot.png
    moveHighlightImage icon_border_stack_norm.png
    moveHighlightImage icon_border_stack_top.png
    moveHighlightImage icon_chat.png
    moveHighlightImage icon_clock.png
    moveHighlightImage icon_close.png
    moveHighlightImage icon_delete.png
    moveHighlightImage icon_edit.png
    moveHighlightImage icon_eject.png
    moveHighlightImage icon_enlightenment.png
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
    moveHighlightImage icon_preferences-applications-personal.png
    moveHighlightImage icon_preferences-desktop-environments.png
    moveHighlightImage icon_preferences-desktop-signal-bindings.png
    moveHighlightImage icon_preferences-interaction.png
    moveHighlightImage icon_preferences-variables.png
    moveHighlightImage icon_prev.png
    moveHighlightImage icon_refresh.png
    moveHighlightImage icon_rewind.png
    moveHighlightImage icon_search.png
    moveHighlightImage icon_spanner.png
    moveHighlightImage icon_splat_half.png
    moveHighlightImage icon_splat.png
    moveHighlightImage icon_stop.png
    moveHighlightImage icon_system-lock-screen.png
    moveHighlightImage icon_system-log-out.png
    moveHighlightImage icon_system.png
    moveHighlightImage icon_system-restart.png
    moveHighlightImage icon_system-shutdown.png
    moveHighlightImage icon_system-suspend-hibernate.png
    moveHighlightImage icon_system-suspend.png
    moveHighlightImage icon_volume.png
    moveHighlightImage icon_warning.png
    moveHighlightImage ic_win_move.png
    moveHighlightImage ic_win_resize.png
    moveHighlightImage inset_bar_horiz_glow_base.png
    moveHighlightImage inset_bar_horiz_glow_inv_base.png
    moveHighlightImage inset_bar_horiz_glow_mid_base.png
    moveHighlightImage inset_bar_vert_glow_base.png
    moveHighlightImage inset_bar_vert_glow_inv_base.png
    moveHighlightImage inset_bar_vert_glow_mid_base.png
    moveHighlightImage kbd_glow.png
    moveHighlightImage led_light.png
    moveHighlightImage led_tiny_blue.png
    moveHighlightImage logo_blue_bottom.png
    moveHighlightImage lock_insecure.png
    moveHighlightImage lock_locked.png
    moveHighlightImage logo_blue_small_glow.png
    moveHighlightImage logo_blue_small.png
    moveHighlightImage media_busy_progress.png
    moveHighlightImage mem_bar.png
    moveHighlightImage mem_bar_vert.png
    moveHighlightImage mem_on.png
    moveHighlightImage mem_on_vert.png
    moveHighlightImage mini_blue_glow_arrow_0.png
    moveHighlightImage mini_blue_glow_arrow_1.png
    moveHighlightImage mini_blue_glow_arrow_2.png
    moveHighlightImage mini_blue_glow_arrow_3.png
    moveHighlightImage mini_box_glow.png
    moveHighlightImage netstatus_rx.png
    moveHighlightImage netstatus_tx.png
    moveHighlightImage outline_glow.png
    moveHighlightImage packagekit_base.png
    moveHighlightImage pointer_glow.png
    moveHighlightImage ring_white_blue_glow.png
    moveHighlightImage runner_glow_horiz.png
    moveHighlightImage runner_glow_vert.png
    moveHighlightImage spanner_glow.png
    moveHighlightImage split_h_glow.png
    moveHighlightImage split_none_glow.png
    moveHighlightImage split_v_glow.png
    moveHighlightImage sym_close_dark_selected.png
    moveHighlightImage sym_close_light_selected.png
    moveHighlightImage sym_down_dark_selected.png
    moveHighlightImage sym_down_glow_normal.png
    moveHighlightImage sym_down_light_selected.png
    moveHighlightImage sym_heart_glow_normal.png
    moveHighlightImage sym_icon_op_ask.png
    moveHighlightImage sym_icon_op_copy.png
    moveHighlightImage sym_icon_op_move.png
    moveHighlightImage sym_left_glow_normal.png
    moveHighlightImage sym_reload_glow_normal.png
    moveHighlightImage sym_right_glow_normal.png
    moveHighlightImage sym_up_dark_selected.png
    moveHighlightImage sym_up_glow_normal.png
    moveHighlightImage sym_up_light_selected.png
    moveHighlightImage tacho_base.png
    moveHighlightImage therm_content.png
    moveHighlightImage vert_glow_range.png
    moveHighlightImage vert_glow_run.png
    moveHighlightImage vert_glow_run_rev.png
    moveHighlightImage vertical_separated_bar_glow.png
    moveHighlightImage white_bar_vert_glow.png
    moveHighlightImage wifi_base.png
    moveHighlightImage wifi_sig_1.png
    moveHighlightImage wifi_sig_2.png
    moveHighlightImage wifi_sig_3.png
    moveHighlightImage win_glow.png
}

moveAllBackgroundImages(){
# move background images
    mkdir $ELM_ENLIGHT_THEME_PATH/img-bgnd
    moveBackgroundImage bevel_dark_out.png
    moveBackgroundImage bevel_horiz_out.png
    moveBackgroundImage bevel_in.png
    moveBackgroundImage bevel_out.png
    moveBackgroundImage bg_radgrad.png
    moveBackgroundImage bub_base_b0.png
    moveBackgroundImage bub_base_b1.png
    moveBackgroundImage bub_base_b2.png
    moveBackgroundImage bub_base_bl.png
    moveBackgroundImage bub_base_br.png
    moveBackgroundImage bub_base_tl.png
    moveBackgroundImage bub_base_tr.png
    moveBackgroundImage button_clicked.png
    moveBackgroundImage button_normal.png
    moveBackgroundImage darken_square.png
    moveBackgroundImage day_left_normal.png
    moveBackgroundImage day_middle_normal.png
    moveBackgroundImage day_right_normal.png
    moveBackgroundImage day_single_normal.png
    moveBackgroundImage dot_pattern.png
    moveBackgroundImage hole_pixel.png
    moveBackgroundImage holes_horiz.png
    moveBackgroundImage holes_tiny_horiz.png
    moveBackgroundImage holes_tiny_vert.png
    moveBackgroundImage holes_vert.png
    moveBackgroundImage hole_tiny.png
    moveBackgroundImage home_hilight.png
    moveBackgroundImage home_inset.png
    moveBackgroundImage inset_bar_horiz_base.png
    moveBackgroundImage inset_bar_vert_base.png
    moveBackgroundImage inset_circle_tiny.png
    moveBackgroundImage inset_round_hilight.png
    moveBackgroundImage inset_round_shading.png
    moveBackgroundImage inset_round_shadow.png
    moveBackgroundImage kbd_hilight.png
    moveBackgroundImage kbd_inset.png
    moveBackgroundImage led_square_shading.png
    moveBackgroundImage mini_box_bevel_shadow.png
    moveBackgroundImage rounded_square.png
    moveBackgroundImage runner_horiz.png
    moveBackgroundImage runner_vert.png
    moveBackgroundImage separator_horiz.png
    moveBackgroundImage slider_run_base_horiz.png
    moveBackgroundImage slider_run_base_light_horiz.png
    moveBackgroundImage slider_run_base_light_vert.png
    moveBackgroundImage slider_run_base_vert.png
    moveBackgroundImage slider_run_bevel_horiz.png
    moveBackgroundImage slider_run_bevel_vert.png
    moveBackgroundImage slot_horiz_bottom.png
    moveBackgroundImage slot_horiz_top.png
    moveBackgroundImage spanner_hilight.png
    moveBackgroundImage spanner_inset.png
    moveBackgroundImage split_h_hilight.png
    moveBackgroundImage split_h_inset.png
    moveBackgroundImage split_none_hilight.png
    moveBackgroundImage split_none_inset.png
    moveBackgroundImage split_v_hilight.png
    moveBackgroundImage split_v_inset.png
    moveBackgroundImage tooltip-base.png
    moveBackgroundImage tooltip-corner-bottom-left-tip.png
    moveBackgroundImage tooltip-corner-bottom-right-tip.png
    moveBackgroundImage tooltip-corner-top-left-tip.png
    moveBackgroundImage tooltip-corner-top-right-tip.png
    moveBackgroundImage tooltip-edge-bottom-tip.png
    moveBackgroundImage tooltip-edge-left-tip.png
    moveBackgroundImage tooltip-edge-right-tip.png
    moveBackgroundImage tooltip-edge-top-tip.png
    moveBackgroundImage vgrad_med_curved.png
    moveBackgroundImage vgrad_med_darker.png
    moveBackgroundImage vgrad_med_dark.png
    moveBackgroundImage vgrad_med_lighter.png
    moveBackgroundImage vgrad_med.png
    moveBackgroundImage vgrad_tall.png
}

moveAllShadowImages(){
    mkdir $ELM_ENLIGHT_THEME_PATH/img-shadow
    moveShadowImage darken_rounded_square.png
    moveShadowImage darken_rounded_square_half.png
    moveShadowImage darken_rounded_square_half_h.png
    moveShadowImage digit_na.png
    moveShadowImage digit_nm.png
    moveShadowImage flip_base_shad.png
    moveShadowImage flip_shad.png
    moveShadowImage horiz_bar_inset.png
    moveShadowImage inset_shadow.png
    moveShadowImage inset_shadow_tiny.png
    moveShadowImage inset_shadow_circle_tiny.png
    moveShadowImage shadow_angled_in_sides.png
    moveShadowImage shadow_inset_bevels.png
    moveShadowImage shadow_rounded_horiz.png
    moveShadowImage shadow_rounded_vert.png
    moveShadowImage vert_bar_inset.png
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
    moveTerminologyHighlightImage bg_glow_in.png
    moveTerminologyHighlightImage icon_about.png
    moveTerminologyHighlightImage icon_close.png
    moveTerminologyHighlightImage icon_copy.png
    moveTerminologyHighlightImage icon_miniview.png
    moveTerminologyHighlightImage icon_new.png
    moveTerminologyHighlightImage icon_paste.png
    moveTerminologyHighlightImage icon_split_h.png
    moveTerminologyHighlightImage icon_split_v.png
    moveTerminologyHighlightImage sl_stripe.png
    moveTerminologyHighlightImage icon_about.svg
    moveTerminologyHighlightImage icon_close.svg
    moveTerminologyHighlightImage icon_copy.svg
    moveTerminologyHighlightImage icon_paste.svg
    moveTerminologyHighlightImage icon_split_h.svg
    moveTerminologyHighlightImage icon_split_v.svg
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
