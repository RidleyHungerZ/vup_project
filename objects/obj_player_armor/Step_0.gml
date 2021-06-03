var inx=image_index,
	inxorg=image_index;
glide_close=false;
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
	else if in(jump, [PYJUMP.fall]){
		if sprite_index!=SS_fall_shoot
			scr_sprite_change(SS_fall_shoot,inxorg,0.25)
	}
	else if in(jump, [PYJUMP.glide]){
		if sprite_index!=spr_player_armor_glide_shoot
			scr_sprite_change(spr_player_armor_glide_shoot,inxorg,0.25)
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
	else if jump==PYJUMP.glide
		scr_sprite_change(spr_player_armor_glide,0,0.25)
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
#region 飞行动作中
if jump==0 {}
#region 下踢前摇
else if jump==PYJUMP.kickSt {
	if place_meeting(x,y-image_yscale,obj_ground) 
	|| vsp>0 {
		if kick_type==1 {
			scr_sprite_change(spr_player_armor_kick_below, 0, 0.5)
			vsp=round(vspmaxrate*grav*sin(pi/4));
			//vsp=vspmaxrate*grav;
			hsp=vsp
			w_j=1
			dash=1
			jump=PYJUMP.kick
			//下爆气
			dash_boost_inst=instance_create_depth(x,y,depth-1,obj_animation_once);
			with(dash_boost_inst) {
				scr_sprite_change(spr_player_dash_boost,0,0.5);
				image_angle=270+45*other.image_xscale
				image_yscale=other.image_xscale;
			}
		} else {
			scr_sprite_change(spr_player_armor_kick_down, 0, 0.5)
			kick_type=0
			vsp=vspmaxrate*grav;
			dash=1
			jump=PYJUMP.kick
			//下爆气
			dash_boost_inst=instance_create_depth(x,y,depth-1,obj_animation_once);
			with(dash_boost_inst) {
				scr_sprite_change(spr_player_dash_boost,0,0.5);
				image_angle=270
				image_yscale=other.image_xscale;
			}
		}
		scr_sound_play(se_player_kick)
	}
}
#endregion
#region 下踢
else if jump==PYJUMP.kick {
	//着地
	if scr_player_Is_fallover(0,0,4,3) {
		scr_sprite_change(spr_player_armor_kick_fallover,0,0.5);
		walk=PYWALK.attack;
		jump=0;
		hsp=0;
		vsp=0;
		dash=0;
		//scr_player_se_step();
		scr_player_fallover_adjust();
		scr_view_shock(1)
		scr_sound_play(se_player_kick_fallover)
	}
	//撞墙
	else if place_meeting(x+sign(hsp*image_xscale), y+sign(vsp*image_yscale), obj_ground) 
	&& kick_type==1 {
		//var xof=hsp*image_xscale, yof=vsp*image_yscale;
		//while !place_meeting(x+sign(xof), y+sign(yof), obj_ground) {
		//	x+=sign(xof) 
		//	y+=sign(yof)
		//}
		scr_sprite_change(spr_player_armor_kick_craw_jump, 0, 0.5)
		jump=PYJUMP.kickJump
		hsp=-dashspd*hspd
		vsp=-vspd;
		can_dbjump=true
		scr_player_fallover_adjust();
		//scr_view_shock(1)
		scr_sound_play(se_player_kick_fallover)
	}
	//撞怪
	else {
		var xof=hsp*image_xscale, yof=vsp*image_yscale,
			enemy=instance_place(x+xof, y+yof, obj_enemy),
			bullet=instance_place(x+xof, y+yof, obj_bullet),
			kickinst=noone;
		if(enemy && enemy.can_dmg && enemy.hp>0) 
		||(bullet && bullet.undm==1) {
			if enemy kickinst=enemy
			else if bullet kickinst=bullet
			while !place_meeting(x+sign(xof), y+sign(yof), kickinst) {
				x+=sign(xof) 
				y+=sign(yof)
			}
			with instance_create_depth(kickinst.x, kickinst.y, depth, obj_player_bullet) {
				scr_sprite_change(spr_white, 0, 0)
				visible=false
				scr_player_damage_set(4, ELEMENTS.none, ATK_TYPE.bullet,3,20,0,20,0)
				death_time=5
			}
			uninjure_temp=1;
			jump=PYJUMP.kickJump
			hsp=dashspd*hspd
			vsp=-vspd;
			can_dbjump=true
			if kick_type==0 {
				scr_sprite_change(spr_player_armor_kick_squat_jump, 0, 0.5)
				if keystate_check(global.left_state) {
					image_xscale=-1
					w_j=1
				} else if keystate_check(global.right_state) {
					image_xscale=1
					w_j=1
				}
			} else if kick_type==1 {
				scr_sprite_change(spr_player_armor_kick_jump, 0, 0.5)
				w_j=1
			}
			scr_sound_play(se_player_kick_catch)
			global.player_mp+=2
			//scr_player_support_add(kick_support)
			//清空半透板记录
			scr_player_floordown_clear()
		}
	}
}
#endregion
#region 踢到怪
if jump==PYJUMP.kickJump {
	if vsp>=0
	|| place_meeting(x,y-image_yscale,obj_ground){
		scr_sprite_change(SS_jumped, 0, 0.25)
		vsp=0
		jump=PYJUMP.fall
		uninjure_temp=0;
	} else {
		if kick_type==0 {
			if keystate_check(global.left_state) {
				image_xscale=-1
				w_j=1
			} else if keystate_check(global.right_state) {
				image_xscale=1
				w_j=1
			}
		}
	}
}
#endregion
#region 空中冲刺
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
#endregion
#region 空中滑翔
else if jump==PYJUMP.glide {
	if keystate_check_pressed(global.jump_state)
	|| !scr_itemb_isopen(ITEMB.glide) {
		if sprite_index==spr_player_armor_glide
			scr_sprite_change(SS_fall, 0, 0.25)
		jump=PYJUMP.fall
		glide_close=true
	}
}
#endregion
#endregion
#region 发动飞行动作
//下踢
if jump==PYJUMP.fall {
	if keystate_check(global.down_state) 
	&& keystate_check_pressed(global.jump_state) 
	&& !floordown 
	&& scr_player_mp_have(2) {
		if keystate_check(global.left_state) 
		|| keystate_check(global.right_state) {
			kick_type=1
			if keystate_check(global.left_state) image_xscale=-1
			else image_xscale=1
		} else kick_type=0
		scr_sprite_change(spr_player_armor_kick_down_st, 0, 0.25)
		hsp=0
		vsp=-5
		jump=PYJUMP.kickSt
		scr_player_mp_subtract(2)
	}
}
//二段跳
if in(jump, [PYJUMP.fall, PYJUMP.kick]) {
	if scr_itemb_isopen(ITEMB.dbjump)
	&& can_dbjump {
		if keystate_check_pressed(global.jump_state) 
		&& !floordown {
			if in(sprite_index, [SS_jumped, SS_fall])
			|| jump==PYJUMP.kick
				scr_sprite_change(spr_player_armor_jump_double, 0, 0.25)
			scr_sound_play(se_player_jump)
			jump=PYJUMP.jump
			vsp=-vspd
			if dash==1 hsp=dashspd*hspd
			else hsp=walkspd*hspd
			can_dbjump=false;
			//清空半透板记录
			scr_player_floordown_clear();
			//上爆气
			dash_boost_inst=instance_create_depth(x,y,depth-1,obj_animation_once);
			with(dash_boost_inst) {
				scr_sprite_change(spr_player_dash_boost,0,0.5);
				image_angle=90
				image_yscale=other.image_xscale;
			}
		}
	}
}
//空中冲刺
if in(jump, [PYJUMP.fall, PYJUMP.kick]) {
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
}
//滑翔，如果装备了二段跳，则先使用二段跳
if jump==PYJUMP.fall {
	if scr_itemb_isopen(ITEMB.glide) 
	&& jump==PYJUMP.fall 
	&&!glide_close
	&& ((scr_itemb_isopen(ITEMB.dbjump) && !can_dbjump) || !scr_itemb_isopen(ITEMB.dbjump)){
		if keystate_check_pressed(global.jump_state) {
			if in(sprite_index, [SS_jumped, SS_fall])
				scr_sprite_change(spr_player_armor_glide, 0, 0.25)
			jump=PYJUMP.glide
			hsp=walkspd*hspd
			vsp=1.5
			dash=0
		}
	}
} 
#endregion
//清除二段跳记录
if jump==0 || jump==PYJUMP.crawjump {
	can_dbjump=true;
}
#endregion
#region 剑斩动作
#region 升龙斩空中
if jump==PYJUMP.flyChop {
	if vsp>=0
	|| place_meeting(x,y-image_yscale,obj_ground){
		scr_sprite_change(spr_player_armor_fly_choped,0,0.5)
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
					element=ELEMENTS.none
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
		if in(jump, [PYJUMP.jump, PYJUMP.fall, PYJUMP.crawjump, PYJUMP.glide]) {
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
			element=ELEMENTS.none
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
	} else if in(jump, [PYJUMP.jump, PYJUMP.fall, PYJUMP.crawjump, PYJUMP.glide, PYJUMP.airdash]) 
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
			element=ELEMENTS.none
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
&&(scr_player_sub_chargebreak(0)>0 || canShootBullets())
&& global.player_saber.sprite_index==spr_none {
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
	else if jump==PYJUMP.jump {
		scr_sprite_change(SS_jump_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[2],shoot_y[2])
		//if jump==4 jump=1
	}
	else if jump==PYJUMP.crawjump {
		scr_sprite_change(SS_jump_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[2],shoot_y[2])
		//if jump==4 jump=1
	}
	else if jump==PYJUMP.fall {
		scr_sprite_change(SS_fall_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[2],shoot_y[2])
	}
	else if jump==PYJUMP.glide {
		scr_sprite_change(spr_player_armor_glide_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[2],shoot_y[2])
	}
	else if jump==PYJUMP.airdash {
		scr_sprite_change(SS_dash_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[3],shoot_y[3])
	}
}
#endregion