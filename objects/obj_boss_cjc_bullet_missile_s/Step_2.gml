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
	scr_enemy_boom_number(x, y, 1, 0)
	instance_destroy()
}
#endregion