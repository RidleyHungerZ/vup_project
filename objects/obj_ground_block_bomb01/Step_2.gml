event_inherited();
if !scr_menu_trem() exit
if action==0 {
	if collision_rectangle(bbox_right+1, bbox_bottom, bbox_left-1, bbox_top-GRDY, obj_player, 1, 1)
	|| collision_rectangle(bbox_right, bbox_bottom+1, bbox_left, bbox_top-GRDY-1, obj_player, 1, 1) {
		action=1
	}
}
if action==1 {
	action=2
	time=120
}
if action==2 {
	if time mod 60 == 0 {
		scr_sound_play(se_bomb_countdown)
		scr_sprite_change(-2, 0, 0.25)
	}
	if time==0 {
		action=3
		time=60
	}
}
if action==3 {
	if time mod (image_number/0.5) == 0 {
		scr_sprite_change(-2, 0, 0.5)
	}
	if time==0 {
		hp=0
		action=3
	}
}