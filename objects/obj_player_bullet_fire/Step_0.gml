event_inherited();
if(!scr_menu_trem()) exit;
#region 大蓄力弹
if in(sprite_index, [spr_player_armor_bullet_charge02_st_fire, spr_player_armor_bullet_charge02_fire]) {
	//尾光
	//if image_index mod 2 == 0 {
	//	with instance_create_depth(x, random_range(bbox_top, bbox_bottom), depth+1, obj_animation_once) {
	//		scr_sprite_change(spr_player_armor_bullet_charge02_after, 0, 0.5)
	//		image_xscale=other.image_xscale
	//		image_yscale=other.image_yscale
	//		image_angle=other.image_angle
	//	}
	//}
	if collision_rectangle(x+16, y+8, x-16, y-8, obj_ground, 1, 1) 
	|| collision_rectangle(x+16, y+8, x-16, y-8, obj_sink, 1, 1) {
		hit_ground(x, y, true)
	} else if hit==1 {
		instance_destroy()
	} else if hit==-1 {
		hit_invalid(x, y, true)
	}
}
#endregion