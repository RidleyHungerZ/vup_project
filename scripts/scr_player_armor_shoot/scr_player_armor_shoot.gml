function scr_player_armor_shoot(shx, shy) {
	with instance_create_depth(x+shx*image_xscale,y+shy*image_yscale,depth-1,obj_player_bullet_armor) {
		charge_break=scr_player_sub_chargebreak(0)
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
		//蓄力弹跟随速度
		var chargexsc=(obj_player.x-obj_player.x_last)*(obj_player.imx_last*image_xscale);
		//小子弹
		if charge_break==0{
			scr_sprite_change(spr_player_armor_bullet01,0,0.5)
			hspeed=8*image_xscale
			scr_player_damage_set(2,ELEMENTS.none,ATK_TYPE.bullet,0,1,0,1,0)
			scr_sound_play(se_player_armor_bullet01)
		} 
		//小蓄力弹
		else if charge_break==1{
			//镭射球
			if global.model==PLAYER_MODEL.TAILS 
			&& scr_player_mp_have(2){
				scr_player_armor_shoot_lasor(90-90*image_xscale)
				scr_player_mp_subtract(2)
				instance_destroy()
			} 
			//普通小蓄力弹
			else {
				scr_sprite_change(spr_player_armor_bullet_charge01_st,0,0.5)
				hspeed=chargexsc
				scr_player_damage_set(6,ELEMENTS.none,ATK_TYPE.bullet,0,2,0,2,0)
				scr_sound_play(se_player_armor_bullet_charge01)
				scr_sound_play(se_player_armor_bullet_charge01_cv)
			}
		} 
		//大蓄力弹
		else if charge_break==2{
			//火蓄力弹
			if global.model==PLAYER_MODEL.YANZX 
			&& scr_player_mp_have(4){
				with instance_create_depth(x,y,depth,obj_player_bullet_fire) {
					scr_sprite_change(spr_player_armor_bullet_charge02_st_fire,0,0.5)
					image_xscale=other.image_xscale
					image_yscale=other.image_yscale
					hspeed=chargexsc
					scr_player_damage_set(12,ELEMENTS.fire,ATK_TYPE.through,0,3,0,3,0)
					scr_sound_play(se_player_armor_bullet_charge02)
					scr_sound_play(se_player_armor_bullet_charge02_cv)
					scr_player_mp_subtract(4)
				}
				instance_destroy()
			} 
			//冰蓄力弹
			else if global.model==PLAYER_MODEL.ice1 
			&& scr_player_mp_have(4){
				with instance_create_depth(x,y,depth,obj_player_bullet_ice) {
					scr_sprite_change(spr_player_armor_bullet_charge02_st_ice,0,0.5)
					image_xscale=other.image_xscale
					image_yscale=other.image_yscale
					hspeed=chargexsc
					scr_player_damage_set(12,ELEMENTS.ice,ATK_TYPE.through,0,3,0,3,0)
					scr_sound_play(se_player_armor_bullet_charge02)
					scr_sound_play(se_player_armor_bullet_charge02_cv)
					scr_player_mp_subtract(4)
				}
				instance_destroy()
			} 
			//雷蓄力弹
			else if global.model==PLAYER_MODEL.elec 
			&& scr_player_mp_have(4){
				with instance_create_depth(x,y,depth,obj_player_bullet_elec) {
					scr_sprite_change(spr_player_armor_bullet_charge02_st_elec,0,0.5)
					image_xscale=other.image_xscale
					image_yscale=other.image_yscale
					hspeed=chargexsc
					scr_player_damage_set(12,ELEMENTS.elec,ATK_TYPE.through,0,3,0,3,0)
					scr_sound_play(se_player_armor_bullet_charge02)
					scr_sound_play(se_player_armor_bullet_charge02_cv)
					scr_player_mp_subtract(4)
				}
				instance_destroy()
			} 
			//火EX弹
			if global.model==PLAYER_MODEL.fire2 
			&& scr_player_mp_have(4){
				
				instance_destroy()
			} 
			//环身冰锥
			if global.model==PLAYER_MODEL.ICE 
			&& scr_player_mp_have(1){
				with obj_player_bullet_ice {
					if sprite_index==spr_player_armor_bullet_ice_cone {
						action=10
					}
				}
				var icenum=min(6, floor(global.player_mp)), dirdiff=360/icenum
				for(var i=0;i<icenum;i++) {
					with instance_create_depth(obj_player.x, obj_player.y, obj_player.depth-10, obj_player_bullet_ice) {
						scr_sprite_change(spr_player_armor_bullet_ice_cone, 0, 0.25)
						direction=dirdiff*i
						dspeed=6*other.image_xscale
						scr_player_damage_set(8,ELEMENTS.ice,ATK_TYPE.bullet,0,3,1,1/3,0)
						dis_edge=-1
					}
				}
				scr_sound_play(se_player_bullet_icecone)
				scr_player_mp_subtract(6)
				instance_destroy()
			} 
			//镭射球
			if global.model==PLAYER_MODEL.TAILS 
			&& scr_player_mp_have(2){
				//正向电球
				scr_player_armor_shoot_lasor(90-90*image_xscale)
				scr_player_mp_subtract(2)
				//两枚侧方
				for(var i=-1;i<=1;i+=2) {
					if !scr_player_mp_have(2) break;
					scr_player_armor_shoot_lasor(90-(90+60*i)*image_xscale)
					scr_player_mp_subtract(2)
				}
				instance_destroy()
			} 
			//普通蓄力弹
			else {
				scr_sprite_change(spr_player_armor_bullet_charge02_st,0,0.5)
				hspeed=(obj_player.x-obj_player.x_last)*(obj_player.imx_last*image_xscale)
				scr_player_damage_set(12,ELEMENTS.none,ATK_TYPE.through,0,3,0,3,0)
				scr_sound_play(se_player_armor_bullet_charge02)
				scr_sound_play(se_player_armor_bullet_charge02_cv)
			}
		}
	}
	bullet_time=bullet_set
}
function scr_player_armor_shoot_lasor(dir) {
	with instance_create_depth(x,y,depth,obj_player_bullet_elec) {
		scr_sprite_change(spr_player_armor_bullet_elec_laser_ball,0,0.5)
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
		speed=6
		friction=0.4
		direction=dir
		scr_player_damage_set(8,ELEMENTS.elec,ATK_TYPE.bullet,0,3,0,3,0)
		dis_edge=-1
		scr_sound_play(se_player_armor_bullet_charge02)
		scr_sound_play(se_player_armor_bullet_charge02_cv)
	}
}