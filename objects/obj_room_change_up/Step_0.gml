scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
//接触
if action==0 {
	if place_meeting(x, y, obj_player) 
	&& global.operate==1 {
		if obj_player.jump==0
		&& obj_player.walk==0 {
			ready_open=true
		} else {
			ready_open=false
		}
		if ready_open
		&& keystate_check_pressed(global.up_state) {
			if can_open {
				ready_open=false
				global.operate=0
				global.player_operate=0
				scr_player_debuff_clear()
				with obj_player {
					scr_sprite_change(SS_doorup, 0, 0.25)
					uninjure_temp=1
				}
				action=1
				time=30
			} else {
				scr_sound_play(se_menu_error)
			}
		}
	}
}
//开门
else if action==1 && time==0 {
	if sprite_index==spr_room_change_up {
		action=3
	} else {
		scr_sprite_change(SS_open, 0, 0.25)
		scr_sound_play(SE_open)
		action=2
	}
}
//门开了
else if action==2 {
	if sprite_index==SS_opening {
		action=3
		time=30
	}
}
if action==3 && time==0 {
	scr_view_transition(1, 0)
	action=4
}
//黑屏
else if action==4 {
	if scr_view_transition_Isover(1) {
		if room_exists(aim_room) 
			scr_room_goto(aim_room)
		obj_player.x=aim_x
		obj_player.y=aim_y-GRDY
		obj_player.image_xscale=aim_xscale
		with obj_player {
			scr_sprite_change(SS_idle, 0, 0.25)
			uninjure_temp=0
		}
		if audio_exists(bgm)
			audio_bgm_change(bgm)
		scr_relife_set_point(aim_x, aim_y, aim_xscale)
		global.operate=0.5
		global.player_operate=1
		action=5
	}
}