event_inherited();
if(!scr_menu_trem()) exit;
#region 喷射烟雾
image_angle=direction
if speed!=0
&& image_speed!=0
&& global.fps_currmenu mod 5 == 0 {
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
	scr_enemy_boom_number(x, y, 1, 0)
	//with instance_create_depth(x, y, depth, obj_bullet_animation_once) {
	//	attack=other.attack
	//	scr_sprite_change(spr_boom,0,0.5)
	//	scr_sound_play(se_boom)
	//}
	instance_destroy()
}
#endregion