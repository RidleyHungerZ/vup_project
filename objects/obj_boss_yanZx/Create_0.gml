attack=6
if scr_mode_Is_hard() hp=288
else hp=192
event_inherited();
bs=1
element=ELEMENTS.fire
enemy_type=1
enemy_ground=1

SS_injure=spr_boss_yanzx_injure
SS_death=spr_boss_yanzx_death

_xl=512
_xr=1024
_yt=0
_yb=288

saber=instance_create_depth(x, y, depth-10 , obj_boss_yanZx_saber)
saber.boss=id

dice_action=0
dice_time=0

kick_count=0

gun_boost=noone //处决炮
span_gun=noone //旋转枪

//精灵帧数调整
sprspd_adjust=function() {
	////一段斩
	//scr_sprite_imspd(spr_boss_yanzx_chop1,0.5,0,1)
	//scr_sprite_imspd(spr_boss_yanzx_chop1,1,1,3)
	//scr_sprite_imspd(spr_boss_yanzx_chop1,0.5,3,4) //不写最后帧数，因为释放完毕后会定住
	////二段斩
	//scr_sprite_imspd(spr_boss_yanzx_chop2,0.5,0,3)
	//scr_sprite_imspd(spr_boss_yanzx_chop2,1,3,4)
	//scr_sprite_imspd(spr_boss_yanzx_chop2,0.5,4,9)
	//scr_sprite_imspd(spr_boss_yanzx_chop2,0.25,9,10)
	////三段斩
	//scr_sprite_imspd(spr_boss_yanzx_chop3,0.5,0,3)
	//scr_sprite_imspd(spr_boss_yanzx_chop3,1,3,4)
	//scr_sprite_imspd(spr_boss_yanzx_chop3,0.5,4,9)
	//scr_sprite_imspd(spr_boss_yanzx_chop3,0.25,9,10)
}
//开始爆炸发生事件
boss_hp0_trigger=function() {
	action=0
	speed=0
	gravity=0
	gravity_direction=270
	with obj_boss_yanZx_bullet_dice {
		fun_selfBoom()
	}
	with obj_boss_yanZx_bullet_boost {
		over()
	}
	with obj_boss_yanZx_bullet_kickfire {
		hit=1
	}
	instance_destroy(obj_boss_yanZx_anima_groundfire)
	instance_destroy(obj_boss_yanzx_bullet_chant_fire)
	instance_destroy(obj_boss_yanZx_bullet_butterfly)
	instance_destroy(obj_boss_yanZx_bullet_gun_spin)
}
//消失时一并带走零件
boom_trigger = function() {
	
}
//投掷骰子统一动作
skill_dice = function(dice) {
	var cenx=(_xl+_xr)/2
	if dice_time>0 dice_time--
	else dice_time=0
	if dice_action==0 {
		scr_sprite_change(spr_boss_yanzx_throw_st, 0, 0.25)
		image_xscale=sign_no0(cenx-x)
		dice_action=1
		dice_time=15
	} else if dice_action==1 && dice_time==0 {
		scr_sprite_change(spr_boss_yanzx_throw, 0, 0.25)
		scr_sound_play(se_boss_yanzx_throw)
		for(var i=0;i<2;i++) {
			with instance_create_depth(x, y, depth, obj_boss_yanZx_bullet_dice) {
				scr_sprite_change(spr_boss_yanzx_bullet_dice_star, 0, 0.5)
				index=dice[i]
				vspeed=-12
				gravity=G
				var t=abs(vspeed/gravity),
					aimx=cenx+80*(i==0 ? -1 : 1);
				hspeed=(aimx-x)/t
				self.aimx=aimx
			}
		}
		dice_action=2
		dice_time=120
	} else if dice_action==2 && dice_time==0 {
		dice_action=3
	}
}
skill_dice_over = function() {
	return dice_action==3
}