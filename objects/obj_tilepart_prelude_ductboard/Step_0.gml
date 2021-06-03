scr_menu_stop()
if !scr_menu_trem() exit
if action==0 {
	if collision_rectangle(bbox_right+8, bbox_bottom, bbox_left-8, bbox_top, obj_player, 1, 1) {
		image_index=1
		action=1
		vspeed=-1
		scr_sound_play(se_door_s_open)
	}
}
//开门
else if action==1 {
	image_index=2
	if y<=ystart-openy {
		vspeed=0
		y=ystart-openy
		action=2
	}
}
//无人则关闭
else if action==2 {
	if !collision_rectangle(bbox_right+16, bbox_bottom+openy, bbox_left-16, bbox_top, obj_player, 1, 1) {
		action=3
		vspeed=1
		scr_sound_play(se_door_s_open)
	}
}
else if action==3 {
	if y>=ystart {
		image_index=1
		vspeed=0
		y=ystart
		action=4
	}
}
else if action==4 {
	image_index=0
	action=0
}