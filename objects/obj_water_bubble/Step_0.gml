event_inherited();
if(!scr_menu_trem()) exit;
//离开水域破裂
if(!collision_point(x,bbox_top+vspeed,obj_water, 1, 1)) {
	if scr_in_view(64) {
		with instance_create_depth(x, y, depth, obj_animation_once) {
			scr_sprite_change(spr_water_bubble_break, 0, 0.25)
		}
	}
	instance_destroy()
}
//呼吸泡会拐弯
if(breathe) {
	breathe_time++;
	x=xstart+16*sin(breathe_time/(pi*60));
}