var inx=image_index,
	inxorg=image_index;
event_inherited()
if !scr_player_stop_trem() exit
#region 动画纠错
if bullet_time>0{
	inx=inx mod 3
	bullet_time-=1
	if jump==0{
		if walk==0{
			if sprite_index!=SS_idle_shoot
				scr_sprite_change(SS_idle_shoot,inx,0.25)
		}
		else if walk==PYWALK.walk {
			var spd=sprite_get_speed(sprite_index)*image_speed
			if bullet_time>bullet_set-(1/spd)*1
				scr_sprite_change(SS_walk_shoot,-2,0.25)
			else if bullet_time>bullet_set-(1/spd)*2
				scr_sprite_change(SS_walk_shoot1,-2,0.25)
			else
				scr_sprite_change(SS_walk_shoot2,-2,0.25)
		}
		else if walk==PYWALK.dash {
			if sprite_index!=SS_dash_shoot
				scr_sprite_change(SS_dash_shoot,inxorg,0.25)
		}
	}
	else if in(jump, [PYJUMP.jump, PYJUMP.crawjump]) {
		if sprite_index!=SS_jump_shoot
			scr_sprite_change(SS_jump_shoot,inxorg,0.25)
	}
	else if in(jump, [PYJUMP.fall, PYJUMP.guild]){
		if sprite_index!=SS_fall_shoot
			scr_sprite_change(SS_fall_shoot,inxorg,0.25)
	}
	else if jump==PYJUMP.airdash{
		if sprite_index!=SS_dash_shoot
			scr_sprite_change(SS_dash_shoot,inxorg,0.25)
	}
} else if bullet_time==0{
	bullet_time=-1
	if jump==0 {
		if walk==0
			scr_sprite_change(SS_idle,0,0.25)
		else if walk==PYWALK.walk
			scr_sprite_change(SS_walk,-2,0.25)
		else if walk==PYWALK.dash
			scr_sprite_change(SS_dash,5,0.25)
	}
	else if in(jump, [PYJUMP.jump, PYJUMP.crawjump])
		scr_sprite_change(SS_jumping,0,0.25)
	else if jump==PYJUMP.fall
		scr_sprite_change(SS_fall,0,0.25)
	else if jump==PYJUMP.guild
		scr_sprite_change(spr_player_armor_guild,0,0.25)
	else if jump==PYJUMP.airdash
		scr_sprite_change(SS_dash,5,0.25)
}
//走路斩
if walk_saber_time>0 {
	walk_saber_time-=1
	if walk==PYWALK.walk {
		if walk_saber_set-walk_saber_time<2 
			scr_sprite_change(spr_player_armor_walk_chop0, -2, -2)
		else 
			scr_sprite_change(spr_player_armor_walk_chop1, -2, -2)
	} else {
		walk_saber_time=-1
	}
} else if walk_saber_time==0 {
	walk_saber_time=-1
	if walk==PYWALK.walk
		scr_sprite_change(SS_walk, -2, -2)
}
#endregion
#region 专属动作
#region 飞行动作
if jump==PYJUMP.fall {
	//二段跳
	if scr_itemb_isopen(ITEMB.dbjump)
	&& can_dbjump {
		if keystate_check_pressed(global.jump_state) 
		&& !floordown {
			if sprite_index==SS_fall 
				scr_sprite_change(spr_player_armor_jump_double, 0, 0.25)
			scr_sound_play(se_player_jump)
			jump=PYJUMP.jump
			vsp=-vspd
			can_dbjump=false;
			//清空半透板记录
			scr_player_floordown_clear();
		}
	}
	//空中冲刺
	if scr_itemb_isopen(ITEMB.airdash)
	&& can_dbjump 
	&& !place_meeting(x+image_xscale, y, obj_ground){
		if dash_order_time_H>0
		|| scr_player_dash_cor() {
			scr_sprite_change(spr_player_armor_dash, 0, 0.25)
			scr_sound_play(se_player_dash)
			jump=PYJUMP.airdash
			hsp=dashspd*hspd
			vsp=0
			dash=1;
			w_j=1;
			can_dbjump=false;
			if(dash_order_time_H>0) dash_order_time_H=-1;
			//清空半透板记录
			scr_player_floordown_clear();
			//发射爆圈
			dash_boost_inst=instance_create_depth(x,y,depth-1,obj_animation_once);
			with(dash_boost_inst) {
				scr_sprite_change(spr_player_dash_boost,0,0.5);
				image_xscale=other.image_xscale;
				image_yscale=other.image_yscale;
			}
		}
	}
	//缓落
	if scr_itemb_isopen(ITEMB.glide) 
	&& jump==PYJUMP.fall {
		if keystate_check_pressed(global.jump_state) {
			if sprite_index==SS_fall
				scr_sprite_change(spr_player_armor_guild, 0, 0.25)
			jump=PYJUMP.guild
			hsp=walkspd*hspd
			vsp=1.5
			dash=0
		}
	}
} 
//空中冲刺结束
else if jump==PYJUMP.airdash {
	if(keystate_check(global.left_state)) 
		image_xscale=-1;
	else if(keystate_check(global.right_state)) 
		image_xscale=1;
	if l_dash>=5
	&&((dash_order_time_H>=0 && !keystate_check(global.dash_state))
	|| (dash_order_time_H=-1 && !keystate_check(global.left_state) && !keystate_check(global.right_state))
	|| (l_dash>=l_dashup)
	|| place_meeting(x+image_xscale, y, obj_ground)) {
		scr_sprite_change(SS_jumped,0,0.25);
		jump=PYJUMP.fall
		w_j=0;
		dash_time_l=0;
		dash_time_r=0;
		dash_order_time_H=0;
	}
	if(l_dash<l_dashup) 
		l_dash+=1;
}
//空中滑翔
else if jump==PYJUMP.guild {
	if keystate_check_pressed(global.jump_state)
	|| !scr_itemb_isopen(ITEMB.glide) {
		if sprite_index==spr_player_armor_guild
			scr_sprite_change(SS_fall, 0, 0.25)
		jump=PYJUMP.fall
	}
}
//清除二段跳记录
if jump==0 || jump==PYJUMP.crawjump {
	can_dbjump=true;
}
#endregion
#endregion
#region 剑斩动作
#region 升龙斩空中
if jump==PYJUMP.flyChop {
	if vsp>=0
	|| place_meeting(x,y-image_yscale,obj_ground){
		scr_sprite_change(spr_player_armor_fly_choped,0,0.25)
		hsp=walkspd*hspd
		vsp=0
		jump=PYJUMP.fall
		with global.player_saber {
			if sprite_index==spr_player_armor_fly_choping_saber_fire
				scr_sprite_change(spr_player_armor_fly_choped_saber_fire, 0, 0.25)
			else scr_sprite_change(spr_player_armor_fly_choped_saber, 0, 0.25)
			sprite_no_change=2
		}
	}
}
#endregion
#region 发动剑斩
if(scr_player_mainuse(0,0)
&& scr_player_main_chargebreak(0)!=2)
&& bullet_time<=bullet_set/2{
	if jump==0 {
		if walk==0 {
			if scr_player_exskill_isget(PLAYER_SKILL.flyChop) 
			&& keystate_check(global.up_state) {
				scr_sprite_change(spr_player_armor_fly_chop, 0, 0.5)
				scr_sound_play(se_player_armor_chop)
				scr_sound_play(se_player_armor_chop_cv3)
				walk=PYWALK.attack
				with global.player_saber {
					if scr_player_mp_have(4) {
						var change=false
						if global.model==PLAYER_MODEL.YANZX {
							element=ELEMENTS.fire
							change=true
						} 
						if change scr_player_mp_subtract(4)
					}
				}
			} else {
				scr_sprite_change(spr_player_armor_idle_chop1, 0, 0.5)
				scr_sound_play(se_player_armor_chop)
				scr_sound_play(se_player_armor_chop_cv1)
				walk=PYWALK.attack
			}
		} else if walk==PYWALK.walk {
			if walk_saber_time==-1 {
				scr_sprite_change(spr_player_armor_walk_chop0, -2, -2)
				scr_sound_play(se_player_armor_chop)
				scr_sound_play(se_player_armor_chop_cv1)
				walk_saber_time=walk_saber_set
				bullet_time=-1
				with global.player_saber {
					scr_sprite_change(spr_player_armor_walk_chop_saber, 0, 0.5)
				}
			}
		} else if walk==PYWALK.dash {
			scr_sprite_change(spr_player_armor_dash_chop, 0, 0.5)
			scr_sound_play(se_player_armor_chop)
			scr_sound_play(se_player_armor_chop_cv1)
			walk=PYWALK.dashChop
			hsp=dashspd*(2/3)*hspd;
		} else if walk=PYWALK.attack {
			if sprite_index == spr_player_armor_idle_chop1 {
				saber_combo++
			} else if sprite_index == spr_player_armor_idle_chop2 {
				saber_combo++
			} else saber_combo=0
		}
	} else {
		if in(jump, [PYJUMP.jump, PYJUMP.fall, PYJUMP.crawjump, PYJUMP.guild]) {
			if sprite_index!=spr_player_armor_fall_chop
			&& sprite_index!=spr_player_armor_fall_spin_chop
			&& sprite_index!=spr_player_armor_fall_spin_choped {
				scr_sprite_change(spr_player_armor_fall_chop, 0, 0.5)
				scr_sound_play(se_player_armor_chop)
				scr_sound_play(se_player_armor_chop_cv1)
			}
		} else if jump==PYJUMP.airdash {
			if sprite_index!=spr_player_armor_dash_chop {
				scr_sprite_change(spr_player_armor_dash_chop, 0, 0.5)
				scr_sound_play(se_player_armor_chop)
				scr_sound_play(se_player_armor_chop_cv1)
				jump=PYJUMP.airDashChop
				hsp=dashspd*(2/3)*hspd;
			}
		}
	}
}
//连斩指令积攒
if saber_combo>0 {
	if walk==PYWALK.attack {
		if sprite_index == spr_player_armor_idle_chop1 && image_index>=5 {
			saber_combo--
			scr_sprite_change(spr_player_armor_idle_chop2, 0, 0.5)
			scr_sound_play(se_player_armor_chop)
			scr_sound_play(se_player_armor_chop_cv2)
		} else if sprite_index == spr_player_armor_idle_chop2 && image_index>=5 {
			saber_combo--
			scr_sprite_change(spr_player_armor_idle_chop3, 0, 0.5)
			scr_sound_play(se_player_armor_chop)
			scr_sound_play(se_player_armor_chop_cv3)
		}
	}
}
//蓄力斩
if(scr_player_mainuse(0,0)
&& scr_player_main_chargebreak(0)==2) {
	if jump==0 && in(walk, [0, PYWALK.walk, PYWALK.dash])
	&& sprite_index!=spr_player_armor_idle_chop_charge {
		scr_sprite_change(spr_player_armor_idle_chop_charge, 0, 0.5)
		scr_sound_play(se_player_armor_chop)
		scr_sound_play(se_player_armor_chop_cv3)
		walk=PYWALK.attack
		hsp=0
		dash=0
		with global.player_saber {
			if scr_player_mp_have(4) {
				var change=false
				if global.model=PLAYER_MODEL.YANZX || global.model=PLAYER_MODEL.fire2 {
					element=ELEMENTS.fire
					change=true
				} else if global.model=PLAYER_MODEL.ice || global.model=PLAYER_MODEL.ice2 {
					element=ELEMENTS.ice
					change=true
				} else if global.model=PLAYER_MODEL.elec || global.model=PLAYER_MODEL.elec2 {
					element=ELEMENTS.elec
					change=true
				} 
				if change scr_player_mp_subtract(4)
			}
		}
	} else if in(jump, [PYJUMP.jump, PYJUMP.fall, PYJUMP.crawjump, PYJUMP.guild, PYJUMP.airdash]) 
	&& sprite_index!=spr_player_armor_fall_spin_chop {
		scr_sprite_change(spr_player_armor_fall_spin_chop, 0, 1)
		scr_sound_play(se_player_armor_chop)
		scr_sound_play(se_player_armor_chop_cv3)
		if (jump==PYJUMP.airdash) {
			jump=PYJUMP.fall
			w_j=0;
			dash_time_l=0;
			dash_time_r=0;
			dash_order_time_H=0;
		}
		with global.player_saber {
			if scr_player_mp_have(4) {
				var change=false
				if global.model=PLAYER_MODEL.YANZX || global.model=PLAYER_MODEL.fire2 {
					element=ELEMENTS.fire
					change=true
				} else if global.model=PLAYER_MODEL.ice || global.model=PLAYER_MODEL.ice2 {
					element=ELEMENTS.ice
					change=true
				} else if global.model=PLAYER_MODEL.elec || global.model=PLAYER_MODEL.elec2 {
					element=ELEMENTS.elec
					change=true
				} 
				if change scr_player_mp_subtract(4)
			}
		}
	}
}
#endregion
#endregion
#region 发动射击
if scr_player_subuse(0,0)
&&(scr_player_sub_chargebreak(0)>0 || canShootBullets()) {
	if jump=0 {
		if walk==0 {
			scr_sprite_change(SS_idle_shoot,0,0.25)
			scr_player_armor_shoot(shoot_x[0],shoot_y[0])
		}
		else if walk==PYWALK.walk {
			scr_sprite_change(SS_walk_shoot,-2,0.25)
			scr_player_armor_shoot(shoot_x[1],shoot_y[1])
		}
		else if walk==PYWALK.dash {
			scr_sprite_change(SS_dash_shoot,0,0.25)
			scr_player_armor_shoot(shoot_x[3],shoot_y[3])
		}
	}
	else if jump==PYJUMP.jump || jump==PYJUMP.crawjump {
		scr_sprite_change(SS_jump_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[2],shoot_y[2])
		//if jump==4 jump=1
	}
	else if jump==PYJUMP.fall {
		scr_sprite_change(SS_fall_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[2],shoot_y[2])
	}
	//else if jump==PYJUMP.guild {
	//	scr_sprite_change(SS_fall_shoot,0,0.25)
	//	scr_player_armor_shoot(shoot_x[2],shoot_y[2])
	//}
	else if jump==PYJUMP.airdash {
		scr_sprite_change(SS_dash_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[3],shoot_y[3])
	}
}
#endregion