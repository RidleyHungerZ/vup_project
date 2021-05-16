scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
//接触
if action==0 {
	if place_meeting(x, y, obj_player) 
	&& use {
		if global.operate==1 {
			global.operate=0
			global.player_operate=0
			open_xscale=sign(x-obj_player.x)
			with obj_player {
				image_xscale=other.open_xscale
				if jump==0 {
					if sprite_index!=SS_walk
						scr_sprite_change(SS_walk, 0, 0.25)
					walk=0
					hsp=0
				} else {
					scr_sprite_change(SS_jumped, 0, 0.25)
					jump=PYJUMP.fall
					hsp=0
					vsp=0
				}
				dash=0
				can_dbjump=true
				hspeed=2*image_xscale
			}
		}
		action=1
	}
}
//前进中
else if action==1 {
	if (obj_player.x-x)*obj_player.image_xscale>=32 {
		obj_player.speed=0
		scr_view_transition(1, 0)
		action=4
	}
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
		}
		if audio_exists(bgm)
			audio_bgm_change(bgm)
		scr_relife_set_point(aim_x, aim_y, aim_xscale)
		action=5
		global.operate=0.5
		global.player_operate=1
	}
}