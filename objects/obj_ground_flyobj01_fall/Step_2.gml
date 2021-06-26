event_inherited()
if !scr_menu_trem() exit
if smoke_time>0 smoke_time--
else if smoke_time==0 {
	smoke_time=smoke_t
	with instance_create_depth(random_range(bbox_left, bbox_right), y, depth-10, obj_animation_once) {
		scr_sprite_change(spr_smoke, 0, 0.5)
		vspeed=-random_range(3, 6)
	}
}