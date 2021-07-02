event_inherited();
if(!scr_menu_trem()) exit;
#region 大蓄力弹
if in(sprite_index, [spr_player_armor_bullet_charge02_st_ice, spr_player_armor_bullet_charge02_ice]) {
	//尾光
	//if image_index mod 2 == 0 {
	//	with instance_create_depth(x, random_range(bbox_top, bbox_bottom), depth+1, obj_animation_once) {
	//		scr_sprite_change(spr_player_armor_bullet_charge02_after, 0, 0.5)
	//		image_xscale=other.image_xscale
	//		image_yscale=other.image_yscale
	//		image_angle=other.image_angle
	//	}
	//}
	if collision_rectangle(x+16, y+4, x-16, y-4, obj_ground, 1, 1) 
	|| collision_rectangle(x+16, y+4, x-16, y-4, obj_sink, 1, 1) {
		hit_ground(x, y, true)
	} else if hit==1 {
		instance_destroy()
	} else if hit==-1 {
		hit_invalid(x, y, true)
	}
}
#endregion
#region 冰锥弹
else if sprite_index==spr_player_armor_bullet_ice_cone {
	//环绕
	if action==0 {
		direction+=dspeed
		if iceconelen<48 iceconelen+=2
		else iceconelen=48
	} 
	//发射出去
	else if action==10 {
		speed=8
		direction=180+dir_player
		afterimage=true
		afimg_count=8; 
		afimg_step=4;
		afteralpha=0.5;
		dis_edge=96;
		action=11
	}
	//飞出中
	else if action==11 {
		if place_meeting(x, y, obj_ground) {
			scr_ice_boompart_ext(spr_ice_part, 3, x, y)
			instance_destroy()
		}
	}
	image_angle=direction
	if hit==1 
	|| hit==2
	|| global.player_hp<=0 {
		scr_ice_boompart_ext(spr_ice_part, 3, x, y)
		instance_destroy()
	}
}
#endregion