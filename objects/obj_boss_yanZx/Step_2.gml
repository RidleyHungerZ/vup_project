event_inherited();
if(!scr_menu_trem()) exit;
if(scr_boss_isget(bs) || hp<=0) exit;
if(!is_war_boss) exit;
var cenx=(_xl+_xr)/2,
	cenrx=(_xr-_xl)/2;
////////////////////////////////
/////////////动作分配/////////////
////////////////////////////////
#region 0-动作分配
if(action_distribution()) {
	if(action==0) time=30;
	else time=10;
	
	var _a=action;
	while(_a=action) {
		var _p=random(400);
		//1-飞燕连踢
		if(_p<100) action=1;
		//2-熔岩连斩
		else if(_p<200) action=2;
		//3-处决弹
		else if(_p<300) action=3;
		//4-旅火蛾
		else action=4;
		
		if(skill_useall([1,2,3,4])) action=_a;
		
		if(action==_a*10)
			action=_a;
		
	}
	
	//5-派对烟火
	if(global.boss_hp<=hp_up/2) {
		if(action_round=0) action=5;
		if(action>=1) action_round=(action_round+1)mod 5;
	}
	
	skill_addary();
}
#endregion
#region 1-飞燕连踢
if(action==1 && time==0) {
	skill_dice([0, 1])
	if skill_dice_over() {
		dice_action=0
		dice_time=0
		action=1.1
	}
}
if action==1.1 {
	scr_sprite_change(spr_boss_yanzx_kick_st, 0, 0.25)
	image_xscale=sign_no0(obj_player.x-x)
	kick_count=0
	action=1.2
	time=10
}
if action=1.2 && time==0 {
	scr_sprite_change(spr_boss_yanzx_kick, 0, 0.5)
	scr_sound_play(se_boss_yanzx_kick)
	with instance_create_depth(x+24*image_xscale, y, depth-1, obj_boss_yanZx_bullet_kickfire) {
		image_xscale=other.image_xscale
		hspeed=8*image_xscale
	}
	kick_count++
	action=1.3
	if scr_mode_Is_hard() time=15
	else time=20
}
if action==1.3 && time==0 {
	if kick_count<3 {
		scr_sprite_change(spr_boss_yanzx_kick_st, 2, 0.25)
		action=1.2
		time=10
	} else {
		action=1.4
		time=30
	}
}
if action==1.4 && time==0 {
	scr_sprite_change(spr_boss_yanzx_kick_ed, 0, 0.25)
	action=1.5
	time=30
}
if action==1.5 && time==0 {
	action=0.1
}
#endregion
#region 2-熔岩连斩
if(action==2 && time==0) {
	skill_dice([3, 6])
	if skill_dice_over() {
		dice_action=0
		dice_time=0
		action=2.1
	}
}
if action==2.1 {
	scr_sprite_change(spr_boss_yanzx_gun_app, 0, 0.25)
	image_xscale=sign_no0(obj_player.x-x)
	action=2.2
	time=30
}
if action==2.2 && time==0 {
	scr_sprite_change(spr_boss_yanzx_chop1, 0, 0.5)
	image_xscale=sign_no0(obj_player.x-x)
	for(var i=0;i<4;i++) {
		var xof=(64+112*i)
		with instance_create_depth(x+xof*image_xscale, bbox_bottom, depth-20, obj_boss_yanzx_bullet_flyfire) {
			image_xscale=other.image_xscale
			waittime=15*i
		}
	}
	scr_sound_play(se_boss_yanzx_chop)
	action=2.3
	time=60
}
if action==2.3 && time==0 {
	scr_sprite_change(spr_boss_yanzx_chop2, 0, 0.5)
	image_xscale=sign_no0(obj_player.x-x)
	for(var i=0;i<5;i++) {
		var xof=(64+80*i)
		if i==1 xof-=32
		else if i==3 xof+=32
		with instance_create_depth(x+xof*image_xscale, bbox_bottom, depth-20, obj_boss_yanzx_bullet_flyfire) {
			image_xscale=other.image_xscale
			waittime=15*i
		}
	}
	scr_sound_play(se_boss_yanzx_chop)
	action=2.4
	time=60
}
if action==2.4 && time==0 {
	scr_sprite_change(spr_boss_yanzx_chop3, 0, 0.5)
	image_xscale=sign_no0(obj_player.x-x)
	for(var i=0;i<5;i++) {
		var xof=(64+64*i)
		with instance_create_depth(x+xof*image_xscale, bbox_bottom, depth-20, obj_boss_yanzx_bullet_flyfire) {
			image_xscale=other.image_xscale
			waittime=15*i
		}
	}
	scr_sound_play(se_boss_yanzx_chop)
	action=2.5
	time=90
}
if action==2.5 && time==0 {
	scr_sprite_change(spr_boss_yanzx_choped, 0, 0.25)
	action=2.6
	time=30
}
if action==2.6 && time==0 {
	action=0.2
}
#endregion
#region 3-处决弹
if(action==3 && time==0) {
	skill_dice([1, 3])
	if skill_dice_over() {
		dice_action=0
		dice_time=0
		action=3.1
	}
}
//位移
if action==3.1 {
	scr_sprite_change(spr_boss_yanzx_dis, 0, 0.25)
	can_dmg=false
	action=3.11
	time=60
}
if action==3.11 && time==0 {
	image_xscale*=-1
	rx=cenrx-240*image_xscale
	scr_sprite_change(spr_boss_yanzx_app, 0, 0.25)
	action=3.12
	time=60
}
if action==3.12 && time==0 {
	scr_sprite_change(spr_boss_yanzx_gun_app, 0, 0.25)
	have_dmg=true
	action=3.2
	time=30
}
//举枪
if action==3.2 && time==0 {
	scr_sprite_change(spr_boss_yanzx_gun_raise, 0, 0.25)
	action=3.3
	time=30
}
if action==3.3 && time==0 {
	gun_boost = instance_create_depth(x+51*image_xscale, y-18*image_yscale, depth-1, obj_boss_yanZx_bullet_boost) 
	with gun_boost {
		image_xscale=VIEW_W/16
		image_yscale=other.image_xscale
		image_angle=90-90*image_yscale
	}
	action=3.4
	time=60
}
//发射
if action==3.4 && time==0 {
	gun_boost.boost()
	action=3.5
	time=180
}
//收枪
if action==3.5 && time==0 {
	scr_sprite_change(spr_boss_yanzx_gun_ed, 0, 0.25)
	gun_boost.over()
	action=3.6
	time=30
}
//丢枪
if action==3.6 && time==0 {
	scr_sprite_change(spr_boss_yanzx_throw_st, 0, 0.25)
	action=3.61
	time=10
}
if action==3.61 && time==0 {
	scr_sprite_change(spr_boss_yanzx_throw, 0, 0.25)
	span_gun=instance_create_depth(x, y, depth-1, obj_boss_yanZx_bullet_gun_spin) 
	with span_gun {
		image_xscale=other.image_xscale
		boss=other.id
		aimx=cenx
		aimy=other._yt+48
		speed=8
		direction=point_direction(x, y, aimx, aimy)
	}
	action=3.7
	time=60
}
//消失
if action==3.7 && time==0 {
	scr_sprite_change(spr_boss_yanzx_dis, 0, 0.25)
	can_dmg=false
	action=3.71
}
if action==3.71 {
	if span_gun.spanGunOver {
		image_xscale*=-1
		rx=cenrx-160*image_xscale
		scr_sprite_change(spr_boss_yanzx_app, 0, 0.25)
		have_dmg=true
		action=3.8
		time=60
	}
}
//枪归位
if action==3.8 && time==0 {
	span_gun.returnPos()
	action=3.81
}
if action==3.81 {
	if !instance_exists(span_gun) {
		scr_sprite_change(spr_boss_yanzx_gun_dis, 0, 0)
		action=3.82
		time=30
	}
}
if action==3.82 && time==0 {
	scr_sprite_change(spr_boss_yanzx_gun_dis, 0, 0.25)
	action=3.9
	time=60
}
if action==3.9 && time==0 {
	action=0.3
}
#endregion
#region 4-旅火蛾
if(action==4 && time==0) {
	skill_dice([9, 6])
	if skill_dice_over() {
		dice_action=0
		dice_time=0
		action=4.1
	}
}
if action==4.1 {
	scr_sprite_change(spr_boss_yanzx_dis, 0, 0.25)
	can_dmg=false
	action=4.2
}
if action==4.2 && time==0 {
	if image_index>=10 {
		var bfnum=3, diroff
		if scr_mode_Is_hard() bfnum=4
		diroff=360/bfnum
		for(var i=0;i<bfnum;i++) {
			with instance_create_depth(x, y, depth, obj_boss_yanZx_bullet_butterfly) {
				image_xscale=other.image_xscale
				action_mode=0
				boss=other.id
				dirspeed=2*other.image_xscale
				direction=i*diroff
			}
		}
		action=4.3
		time=30
	}
}
if action==4.3 && time==0 {
	action=4.4
	time=32
}
if action==4.4 {
	with obj_boss_yanZx_bullet_butterfly {
		surround_rad+=2
	}
	if time==0 {
		action=4.5
		time=30
	}
}
if action==4.5 && time==0 {
	speed=clamp(dis_player/16, 1, 3)
	direction=dir_player
	if dis_player<=4 {
		speed=0
		image_xscale*=-1
		action=4.6
		time=60
	}
}
if action==4.6 && time==0 {
	var aimrx=cenrx-160*image_xscale,
		aimry=(_yb-_yt)-64-GRDY,
		dis=point_distance(rx, ry, aimrx, aimry);
	direction=point_direction(rx, ry, aimrx, aimry)
	speed=4
	if dis<=4 {
		direction=0
		speed=0
		x=aimrx
		y=aimry
		action=4.7
		time=30
	}
}
if action==4.7 {
	with obj_boss_yanZx_bullet_butterfly {
		surround_rad-=2
	}
	if time==0 {
		scr_sprite_change(spr_boss_yanzx_app, 0, 0.25)
		have_dmg=true
		action=4.8
	}
}
if action==4.8 {
	if image_index>=7 {
		instance_destroy(obj_boss_yanZx_bullet_butterfly)
		action=4.9
		time=60
	}
}
if action==4.9 && time==0 {
	action=0.4
}
#endregion
#region 5-派对烟火
if(action==5 && time==0) {
	skill_dice([0, 0])
	if skill_dice_over() {
		dice_action=0
		dice_time=0
		action=5.1
	}
}
if action==5.1 {
	scr_sprite_change(spr_boss_yanzx_float, 0, 0.25)
	vspeed=-1
	action=5.11
	time=30
}
if action==5.11 && time==0 {
	var dir=point_direction(rx, ry, cenrx, 64),
		dis=point_distance(rx, ry, cenrx, 64);
	direction=point_direction(rx, ry, cenrx, 64)
	speed=clamp(dis/16, 1, 4)
	if dis<=4 {
		speed=0
		rx=cenrx
		ry=80
		scr_sprite_change(spr_boss_yanzx_chant, 0, 0.25)
		action=5.2
		time=30
	}
}
if action==5.2 && time==0 {
	//var dicenum=3,dicexof=256
	//if scr_mode_Is_hard() {
	//	dicenum=4 dicexof=160
	//}
	//for(var i=-(dicenum+1)/2;i<=(dicenum+1)/2;i++) {
	//	var dicex=cenx+i*dicexof;
	//	with instance_create_depth(x, y, depth, obj_boss_yanZx_bullet_dice) {
	//		scr_sprite_change(spr_boss_yanzx_bullet_dice_star, 0, 0.5)
	//		index=10
	//		vspeed=-5
	//		gravity=G
	//		var t=abs(vspeed/gravity),
	//			aimdx=dicex;
	//		hspeed=(aimdx-x)/t
	//		aimx=aimdx
	//	}
	//}
	action=5.3
	time=60
}
if action==5.3 && time==0 {
	for(var i=-3;i<=3;i++) {
		with instance_create_depth(cenx+80*i, _yb-32-GRDY, depth-10, obj_boss_yanzx_bullet_chant_fire) {
			waittime=30//+abs(i*15)
			time=abs(i*15)
		}
	}
	action=5.4
	time=120
}
if action==5.4 && time==0 {
	for(var i=-3.5;i<=3.5;i++) {
		with instance_create_depth(cenx+80*i, _yb-32-GRDY, depth-10, obj_boss_yanzx_bullet_chant_fire) {
			waittime=30//+abs(sign(i)*floor(abs(i))*15)
			time=abs(sign(i)*floor(abs(i))*15)
		}
	}
	action=5.5
	time=120
}
if action==5.5 && time==0 {
	var bfnum=15,diroff
	if scr_mode_Is_easy() bfnum=12
	else if scr_mode_Is_hard() bfnum=18
	diroff=360/bfnum
	for(var i=0;i<bfnum;i++) {
		if(i mod 3 == 0) continue
		with instance_create_depth(x, y, depth-10, obj_boss_yanZx_bullet_butterfly) {
			image_xscale=other.image_xscale
			action_mode=0
			boss=other.id
			direction=i*diroff
		}
	}
	action=5.51
	time=180
}
if action==5.51 {
	with obj_boss_yanZx_bullet_butterfly {
		surround_rad+=2
		dirspeed=other.image_xscale*min(3, radtodeg(4/surround_rad))
	}
	if time==0 {
		action=5.52
		time=240
	}
}
if action==5.52 {
	with obj_boss_yanZx_bullet_butterfly {
		surround_rad-=1.5
		dirspeed=other.image_xscale*min(3, radtodeg(4/surround_rad))
	}
	if time==0 {
		instance_destroy(obj_boss_yanZx_bullet_butterfly)
		action=5.8
		time=30
	}
}
if action==5.8 && time==0 {
	//with obj_boss_yanZx_bullet_dice {
	//	fun_selfBoom()
	//}
	scr_sprite_change(spr_boss_yanzx_float, 0, 0.25)
	image_xscale*=-1
	action=5.81
}
if action==5.81 {
	var aimrx=cenrx-160*image_xscale,
		aimry=(_yb-_yt)-64-GRDY,
		dis=point_distance(rx, ry, aimrx, aimry);
	direction=point_direction(rx, ry, aimrx, aimry)
	speed=clamp(dis/16, 1, 4)
	if dis<=4 {
		speed=0
		rx=aimrx
		ry=aimry
		action=5.82
		time=30
	}
}
if action==5.82 && time==0 {
	scr_sprite_change(spr_boss_yanzx_idle, 0, 0.25)
	action=5.9
	time=30
}
if action==5.9 && time==0 {
	action=0.5
}
#endregion