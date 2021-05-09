scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
//接触
if action==0 {
	if place_meeting(x, y, obj_player) {
		if global.operate==1 {
			global.player_operate=0
			with obj_player {
				hsp=0
				uninjure_temp=1
			}
			action=1
		} else {
			action=3
		}
	}
}
//落地
else if action==1 {
	if obj_player.jump==0 {
		obj_player.image_xscale=sign(x-obj_player.x)
		action=2
		time=30
	}
}
//前进
else if action==2 && time==0 {
	global.operate=0
	with obj_player {
		scr_sprite_change(SS_walk, 0, 0.25)
		hspeed=walkspd*hspd*image_xscale
	}
	action=3
}
//前进中
else if action==3 {
	if (obj_player.x-x)*obj_player.image_xscale>=32 {
		with obj_player {
			scr_sprite_change(SS_idle, 0, 0.25)
			hspeed=0
		}
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
		if audio_exists(bgm)
			audio_bgm_change(bgm)
		global.re_x=obj_player.x
		global.re_y=obj_player.y
		global.re_xscale=obj_player.image_xscale
		action=5
		global.operate=0.5
		global.player_operate=1
	}
}