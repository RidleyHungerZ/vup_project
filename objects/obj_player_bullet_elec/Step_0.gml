event_inherited();
if(!scr_menu_trem()) exit;
#region 大蓄力弹
if in(sprite_index, [spr_player_armor_bullet_charge02_st_elec, spr_player_armor_bullet_charge02_elec]) {
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
#region 镭射球
else if sprite_index==spr_player_armor_bullet_elec_laser_ball {
	if action==0 {
		if speed==0 {
			friction=0
			action=1
			time=30
		}
	} else if action==1 && time==0 {
		scr_sprite_change(spr_player_armor_bullet_elec_laser_break, 0, 0.5)
		with instance_create_depth(x, y, depth-1, obj_player_bullet_elec) {
			scr_sprite_change(spr_player_armor_bullet_elec_laser_line, 0, 0.5)
			scr_player_damage_set(6, ELEMENTS.elec, ATK_TYPE.bullet, 0, other.uninjure_up+1, 0.25, 1, 0)
			var target=scr_player_bullet_autofind();
			if instance_exists(target) {
				image_angle=point_direction(x, y, target.x, target.y)
			} else {
				image_angle=90-90*other.image_xscale
			}
			image_xscale=1
			image_yscale=other.image_xscale
			dis_edge=-1
			undm_exclude=[all]
		}
		scr_sound_play(se_player_bullet_laser)
		action=2
	}
}
#endregion
#region 镭射
else if sprite_index==spr_player_armor_bullet_elec_laser_line {
	//随时矫正长度
	image_xscale=1
	var sprw=sprite_get_width(sprite_index),
		shift_endxy,
		endx=x,
		endy=y;
	//while scr_in_view_arg(x, y, 64)
	//&& !scr_in_view_arg(endx, endy, 128) {
	//	image_xscale-=sprw/16
	//	shift_endxy=shift_xy_angle(sprw*image_xscale, 0, image_angle);
	//	endx=x+shift_endxy.x;
	//	endy=y+shift_endxy.y;
	//}
	while scr_in_view_arg(endx, endy, 64) {
		image_xscale+=sprw/16;
		shift_endxy=shift_xy_angle(sprw*image_xscale, 0, image_angle);
		endx=x+shift_endxy.x;
		endy=y+shift_endxy.y;
	}
}
#endregion