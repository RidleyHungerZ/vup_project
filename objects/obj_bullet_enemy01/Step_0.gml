event_inherited();
if !scr_menu_trem() exit
if place_meeting(x, y, obj_ground)
|| place_meeting(x, y, obj_sink)
|| hit==1 {
	with instance_create_depth(x, y, depth, obj_animation_once) {
		scr_sprite_change(spr_smoke, 0, 0.25)
	}
	instance_destroy()
}