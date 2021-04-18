function scr_player_armor_shoot(shx, shy) {
	with instance_create_depth(x+shx*image_xscale,y+shy*image_yscale,depth-1,obj_player_bullet_armor) {
		charge_break=scr_player_sub_chargebreak(0)
		//小子弹
		if charge_break==0{
			scr_sprite_change(spr_player_armor_bullet01,0,0.5)
			image_xscale=other.image_xscale
			image_yscale=other.image_yscale
			hspeed=8*image_xscale
			scr_player_damage_set(2,ELEMENTS.none,ATK_TYPE.bullet,0,1,0,1,0)
			scr_sound_play(se_player_armor_bullet01)
		} 
		//小蓄力弹
		else if charge_break==1{
			scr_sprite_change(spr_player_armor_bullet_charge01_st,0,0.5)
			image_xscale=other.image_xscale
			image_yscale=other.image_yscale
			hspeed=(obj_player.x-obj_player.x_last)*(obj_player.imx_last*image_xscale)
			scr_player_damage_set(6,ELEMENTS.none,ATK_TYPE.bullet,0,1,0,1,0)
			scr_sound_play(se_player_armor_bullet_charge01)
			scr_sound_play(se_player_armor_bullet_charge01_cv)
		} 
		//大蓄力弹
		else if charge_break==2{
			//燕逐晓
			if global.model==PLAYER_MODEL.YANZX 
			&& scr_player_mp_have(4){
				image_xscale=other.image_xscale
				image_yscale=other.image_yscale
				with instance_create_depth(x,y,depth,obj_player_bullet_fire) {
					charge_break=scr_player_sub_chargebreak(0)
					scr_sprite_change(spr_player_armor_bullet_charge02_fire,0,0.5)
					image_xscale=other.image_xscale
					image_yscale=other.image_yscale
					hspeed=12*image_xscale
					scr_player_damage_set(12,ELEMENTS.fire,ATK_TYPE.through,0,1,0,1,0)
					scr_sound_play(se_player_armor_bullet_charge02)
					scr_sound_play(se_player_armor_bullet_charge02_cv)
					scr_player_mp_subtract(4)
				}
				instance_destroy()
			} 
			//普通子弹
			else {
				scr_sprite_change(spr_player_armor_bullet_charge02_st,0,0.5)
				image_xscale=other.image_xscale
				image_yscale=other.image_yscale
				hspeed=(obj_player.x-obj_player.x_last)*(obj_player.imx_last*image_xscale)
				scr_player_damage_set(12,ELEMENTS.none,ATK_TYPE.through,0,1,0,1,0)
				scr_sound_play(se_player_armor_bullet_charge02)
				scr_sound_play(se_player_armor_bullet_charge02_cv)
			}
		}
	}
	bullet_time=bullet_set
}
