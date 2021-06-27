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
#region 燕逐晓本体
if sprite_index==spr_boss_yanzx_chant_ing {
	if action==0 {
		action=1
		time=320
	} else if action==1 {
		if (time mod 10) == 5 {
			var inx=(time div 10),
				cenx=(yanzx_view[0]+yanzx_view[2])/2,
				ceny=(yanzx_view[1]+yanzx_view[3])/2,
				vw=(yanzx_view[2]-yanzx_view[0]),
				vh=(yanzx_view[3]-yanzx_view[1]);
			for(var i=-1;i<=1;i+=2) {
				with instance_create_depth(cenx+i*image_xscale*(vw/2-16*inx), ceny+i*vh/2, depth-1, obj_player_bullet_fire) {
					scr_sprite_change(spr_boss_yanzx_bullet_fire_st, 0, 0.25)
					direction=90*i
					image_angle=direction
					scr_player_damage_set(4,ELEMENTS.fire,ATK_TYPE.bullet,0,10,1,0,0)
					yanzx_view=other.yanzx_view
					can_combo=false
					dis_edge=-1
				}
				scr_sound_play(se_boss_yanzx_kick)
			}
		}
		if time==0 {
			action=2
			time=60
		}
	} else if action==2 && time==0 {
		scr_sprite_change(spr_boss_yanzx_dis, 0, 0.25)
		scr_sound_play(se_boss_yanzx_dis)
		action=3
	}
}
#endregion
#region 燕逐晓召唤子弹
if sprite_index==spr_boss_yanzx_bullet_fire {
	if hit!=0 {
		with instance_create_depth(x, y, depth, obj_animation_once) {
			scr_sprite_change(spr_boss_yanzx_bullet_fire_ed, 0, 0.5)
		}
		instance_destroy()
	} else if !point_in_rectangle(x, y, yanzx_view[0], yanzx_view[1], yanzx_view[2], yanzx_view[3]) {
		scr_sprite_change(spr_boss_yanzx_bullet_fire_ed, 0, 0.25)
		speed=0
	}
}
#endregion