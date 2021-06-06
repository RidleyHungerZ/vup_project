event_inherited();
if(!scr_menu_trem()) exit;
#region 喷射烟雾
image_angle=direction
if global.fps_currmenu mod 5 == 0 {
	var smoke_pos=[x-lengthdir_x(24,image_angle), y-lengthdir_y(24,image_angle)]
	with instance_create_depth(smoke_pos[0], smoke_pos[1], depth, obj_animation_once)
		scr_sprite_change(spr_smoke,0,0.5)
}
if place_meeting(x,y,obj_ground)
|| place_meeting(x,y,obj_sink)
|| hit==1
|| hp<=0 {
	//scr_sprite_change(spr_boom,0,0.5)
	//scr_sound_play(se_boom)
	//speed=0
	//image_angle=0
	//image_xscale=1
	//image_yscale=1
	//action=1
	scr_enemy_boom_number(x, y, 9, 1)
	//with instance_create_depth(x, y, depth, obj_bullet_animation_once) {
	//	attack=other.attack
	//	scr_sprite_change(spr_boom,0,0.5)
	//	scr_sound_play(se_boom)
	//}
	instance_destroy()
}
#endregion
if action==0 {
	if speed>0 friction=0.1
	else {
		speed=0
		aim_dir=dir_player
		dir_diff=angle_difference(direction, aim_dir)
		action=1
		time=30
	}
} else if action==1 {
	direction+=dir_diff/time
	if time==0 {
		gravity=0.3
		gravity_direction=direction
		action=2
	}
} else if action==2 {
	if !scr_in_view(64) instance_destroy()
}

