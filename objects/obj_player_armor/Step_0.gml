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
		else if walk==1{
			var spd=sprite_get_speed(sprite_index)*image_speed
			if bullet_time>bullet_set-(1/spd)*1
				scr_sprite_change(SS_walk_shoot,-2,0.25)
			else if bullet_time>bullet_set-(1/spd)*2
				scr_sprite_change(SS_walk_shoot1,-2,0.25)
			else
				scr_sprite_change(SS_walk_shoot2,-2,0.25)
		}
		else if walk==2{
			if sprite_index!=SS_dash_shoot
				scr_sprite_change(SS_dash_shoot,inxorg,0.25)
		}
	}
	else if jump==1 || jump==23{
		if sprite_index!=SS_jump_shoot
			scr_sprite_change(SS_jump_shoot,inxorg,0.25)
	}
	else if jump==2{
		if sprite_index!=SS_fall_shoot
			scr_sprite_change(SS_fall_shoot,inxorg,0.25)
	}
}
else if bullet_time==0{
	bullet_time=-1
	if jump==0{
		if walk==0
			scr_sprite_change(SS_idle,0,0.25)
		else if walk==1
			scr_sprite_change(SS_walk,-2,0.25)
		else if walk==2
			scr_sprite_change(SS_dash,-2,0.25)
	}
	else if jump==1 || jump==23 || jump==4
		scr_sprite_change(SS_jumping,0,0.25)
	else if jump==2
		scr_sprite_change(SS_fall,0,0.25)
}
#endregion
#region 剑斩动作
if(scr_player_mainuse(0,0)
&& scr_player_main_chargebreak(0)!=2) {
	if jump==0 {
		if walk==0 {
			scr_sprite_change(spr_player_armor_idle_chop1, 0, 0.5)
			scr_sound_play(se_player_armor_chop)
			scr_sound_play(se_player_armor_chop_cv1)
			walk=4
		} else if walk==1 {
				
		} else if walk==2 {
				
		} else if walk==4 {
			if sprite_index == spr_player_armor_idle_chop1 {
				saber_combo++
			} else if sprite_index == spr_player_armor_idle_chop2 {
				saber_combo++
			}
		}
	} else {
			
	}
}
//连斩指令积攒
if saber_combo>0 {
	if walk==4 {
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
	if jump==0 {
		print "地面蓄力斩"
	} else {
		print "空中蓄力斩"
	}
}
#endregion
#region 发动射击
if scr_player_subuse(0,0)
&&(scr_player_sub_chargebreak(0)>0 || canShootBullets()) {
	if jump=0{
		if walk==0{
			scr_sprite_change(SS_idle_shoot,0,0.25)
			scr_player_armor_shoot(shoot_x[0],shoot_y[0])
		}
		else if walk==1{
			scr_sprite_change(SS_walk_shoot,-2,0.25)
			scr_player_armor_shoot(shoot_x[1],shoot_y[1])
		}
		else if walk==2{
			scr_sprite_change(SS_dash_shoot,0,0.25)
			scr_player_armor_shoot(shoot_x[3],shoot_y[3])
		}
	}
	else if jump==1 || jump==23 || jump==4{
		scr_sprite_change(SS_jump_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[2],shoot_y[2])
		//if jump==4 jump=1
	}
	else if jump==2{
		scr_sprite_change(SS_fall_shoot,0,0.25)
		scr_player_armor_shoot(shoot_x[2],shoot_y[2])
	}
}
#endregion