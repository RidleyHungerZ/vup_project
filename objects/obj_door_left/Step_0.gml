scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
//旧版过门
//crossDoorOld()
//新版过门
//触发开门
if action==0 {
	if can_open {
		if collision_rectangle(bbox_left-1, bbox_bottom, bbox_right+1, bbox_top, obj_player, 1, 1)
		&& obj_player.bbox_top>=bbox_top
		&& obj_player.y>=y
		&& obj_player.bbox_bottom<=bbox_bottom 
		&& sprite_index==SS_closing {
			scr_sprite_change(SS_open, 0, 0.25)
			scr_sound_play(SE_open)
			global.operate=0
			global.player_operate=0
			open_xscale=sign(x-obj_player.x)
			with obj_player {
				image_xscale=other.open_xscale
				if jump==0 {
					walk=0
					scr_sprite_change(SS_walk, 0, 0.25)
					hsp=0
				} else {
					jump=PYJUMP.fall
					scr_sprite_change(SS_jumped, 0, 0.25)
					hsp=0
					vsp=0
				}
				dash=0
				can_dbjump=true
			}
			action=1
		}
	}
} 
//开门走入
else if action==1 {
	scr_view_freedom(obj_player, true, true)
	if sprite_index==SS_opening {
		with obj_player {
			hspeed=walkspd*hspd*image_xscale
		}
		action=2
	}
}
else if action==2 {
	if(obj_player.x-x)*open_xscale>0 
	&& !room_change{
		action=3
	}
}
//镜头移动
else if action==3 {
	scr_view_freedom(obj_player, true, true)
	//到达位置
	if(obj_player.x-x)*open_xscale>=64 {
		with obj_player {
			hspeed=0
			if jump==0 scr_sprite_change(SS_idle, 0, 0.25)
		}
		scr_sprite_change(SS_close, 0, 0.25)
		scr_sound_play(SE_close)
		action=4
	}
}
else if action==4 {
	scr_view_freedom(obj_player, true, true)
	if sprite_index==SS_closing {
		with obj_player {
			if jump!=0 {
				scr_sprite_change(SS_jumped, 0, 0.25)
			}
		}
		global.operate=0.8
		global.player_operate=1
		action=0
	}
}