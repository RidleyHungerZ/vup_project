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
		//1-导弹
		if(_p<100) action=1;
		//2-大导弹
		else if(_p<200) action=2;
		//3-丢爆破
		else if(_p<300) action=3;
		//4-抓人
		else action=4;
			
		//抓箱臂爆了则不再执行抓箱技能
		if action==3
		&& !instance_exists(arm_block.forearm) {
			action=0.3
		}
		//抓人臂爆了则不再执行抓人技能
		else if action==4 
		&& !instance_exists(arm_catch.forearm) {
			action=0.4
		}
		else if(skill_useall([1,2,3,4])) action=_a;
		
		if(action==_a*10)
			action=_a;
		
	}
	
	//5-飞撞
	if(global.boss_hp<=hp_up/2) {
		if(action_round=0) action=5;
		if(action>=1) action_round=(action_round+1)mod 5;
	}
	
	//skill_addary();
}
#endregion
#region 1-导弹
if(action==1 && time==0) {
	lanuch[0].open(1)
	action=1.1
	time=30
}
if action==1.1 && time==0 {
	lanuch[0].lanuch()
	action=1.2
	time=120
}
if action==1.2 && time==0 {
	lanuch[0].close()
	action=1.3
	time=30
}
if action==1.3 && time==0 {
	action=0.1
}
#endregion
#region 2-大导弹
if(action==2 && time==0) {
	lanuch[0].open(2)
	action=2.1
	time=60
}
if action==2.1 && time==0 {
	lanuch[0].lanuch()
	action=2.2
	time=120
}
if action==2.2 && time==0 {
	lanuch[0].close()
	action=2.3
	time=60
}
if action==2.3 {
	if time==0 
	|| !instance_exists(obj_boss_cjc_bullet_missile_b) {
		action=2.4
	}
}
if action==2.4 {
	action=0.2
}
#endregion
#region 3-丢爆破
//手臂被爆破的处理方式
if !instance_exists(arm_block.forearm) {
	
}
if(action==3 && time==0) {
	float=false
	craw_block=0
	gravity=0.1
	gravity_direction=90
	scr_sound_play(se_boss_cjc_airplane_lanuch)
	action=3.1
}
if action==3.1 {
	if ry<=-160 {
		vspeed=0
		gravity=0
		gravity_direction=270
		ry=-160
		arm_block.arm_angle=90
		if(global.boss_hp<=hp_up/2) 
			arm_block.forearm.craw.blockReady(obj_boss_cjc_block_bomb01)
		else
			arm_block.forearm.craw.blockReady(obj_boss_cjc_block_bomb02)
		vspeed=2
		action=3.2
	}
}
if action==3.2 {
	vspeed=max(0.5, 2*(-ry/128))
	if ry>=0 {
		ry=0
		speed=0
		action=3.3
		time=30
	}
}
if action==3.3 && time==0 {
	action=3.4
	time=180
}
if action==3.4 {
	var blockx=(x+56*image_xscale),
		dir=sign_no0(obj_player.x-blockx),
		dis=abs(obj_player.x-blockx)
	hspeed=dir*min(4, ceil(dis/16))
	if craw_block==1 
	|| time==0 {
		hspeed=0
		action=3.5
		time=30
	}
}
if action==3.5 && time==0 {
	arm_block.forearm.craw.blockRelease()
	action=3.6
	time=60
}
if action==3.6 && time==0 {
	arm_block.forearm.craw.blockTurned()
	vspeed=-2
	action=3.7
}
if action==3.7 {
	if ry<=-160 {
		ry=-160
		rx=cenrx-128*image_xscale
		arm_block.arm_angle=0
		vspeed=2
		action=3.8
	}
}
if action==3.8 {
	vspeed=max(0.5, 2*(1-ry/96))
	if ry>=96 {
		ry=96
		speed=0
		float=true
		action=3.9
		time=30
	}
}
if action==3.9 && time==0 {
	action=0.3
}
#endregion
#region 4-抓人
//手臂被爆破的处理方式
if !instance_exists(arm_catch.forearm) {
	if between(action, 4.3, true, 4.5, true)
	|| between(action, 4.7, true, 4.8, false) {
		speed=0
		action=4.61
		time=30
	}
}
if(action==4 && time==0) {
	float=false
	vspeed=2
	action=4.1
}
if action==4.1 {
	vspeed=max(0.5, 2*(1-ry/(112-96)))
	if ry>=112 {
		ry=112
		speed=0
		action=4.2
		time=30
	}
}
if action==4.2 && time==0 {
	scr_sound_play(se_boss_cjc_arm_turn)
	action=4.3
}
if action==4.3 {
	arm_catch.arm_angle+=2
	if arm_catch.arm_angle>=60 {
		arm_catch.arm_angle=60
		arm_catch.forearm.craw.catchReady()
		action=4.4
		time=60
	}
}
if action==4.4 && time==0 {
	arm_catch.forearm.craw.catchExtend()
	craw_catch_result=0
	action=4.5
}
if action==4.5 {
	if craw_catch_result==1 {
		action=4.6
		time=30
	} else if craw_catch_result==2 {
		action=4.7
		time=30
	}
}
//没抓到，起飞
if action==4.6 && time==0 {
	arm_catch.forearm.craw.catchTurned()
	action=4.61
	time=60
}
if action==4.61 && time==0 {
	scr_sound_play(se_boss_cjc_arm_turn)
	action=4.62
}
if action==4.62 {
	arm_catch.arm_angle-=3
	if arm_catch.arm_angle<=0 {
		arm_catch.arm_angle=0
		action=4.63
		time=30
	}
}
if action==4.63 {
	action=4.64
}
if action==4.64 {
	vspeed=sign(96-ry)*max(0.5, 2*((ry-96)/(112-96)))
	if abs(ry-96)<abs(vspeed) {
		ry=96
		speed=0
		float=true
		action=4.9
		time=30
	}
}
//抓到了，飞起丢下
if action==4.7 && time==0 {
	vspeed=-2
	action=4.71
}
if action==4.71 {
	vspeed=-max(0.5, 2*(ry/112))
	if ry<=0 {
		ry=0
		speed=0
		action=4.72
		time=30
	}
}
if action==4.72 && time==0 {
	scr_sound_play(se_boss_cjc_airplane_sparkthru)
	vspeed=4
	action=4.73
}
if action==4.73 {
	if ry>=112 {
		vspeed=0
		arm_catch.forearm.craw.catchRelease()
		obj_player.image_xscale=-image_xscale
		with instance_create_depth(obj_player.x-4*image_xscale, obj_player.y, obj_player.depth, obj_bullet_animation_once) {
			scr_sprite_change(spr_white, 0, 0.25)
			image_alpha=0
			attack=6
			attack_type=ATK_TYPE.push
		}
		action=4.74
		time=60
	}
}
if action==4.74 && time==0 {
	action=4.6
}
//结束
if action==4.9 && time==0 {
	action=0.4
}
#endregion
#region 5-飞撞
if(action==5 && time==0) {
	float=false
	action=5.1
	time=30
}
if action==5.1 && time==0 {
	gravity=0.1
	gravity_direction=90-60*image_xscale
	action=5.2
	scr_sound_play(se_boss_cjc_airplane_lanuch)
}
if action==5.2 {
	if speed>=6 gravity=0
	if ry<=-96 {
		gravity=0
		gravity_direction=270
		firedir=2
		speed=0
		image_xscale*=-1
		rx=cenrx-VIEW_W*image_xscale
		ry=128
		action=5.3
		time=60
		scr_tip_thread(0, 3)
	}
}
//侧面冲出气流
if action==5.3 {
	sparkthre_airflow()
	if time==0 {
		hspeed=6*image_xscale
		if scr_mode_Is_easy()
			hspeed=3*image_xscale
		gravity=0.1
		gravity_direction=direction
		scr_sound_play(se_boss_cjc_airplane_sparkthru)
		action=5.4
	}
}
if action==5.4 {
	sparkthre_airflow()
	if image_xscale*(rx-cenrx)>=VIEW_W*3/2 {
		gravity=0
		gravity_direction=270
		speed=0
		image_xscale*=-1
		rx=cenrx-VIEW_W*image_xscale
		ry=176
		action=5.5
		time=60
	}
}
//底面冲出气流
if action==5.5 {
	sparkthre_airflow()
	if time==0 {
		hspeed=6*image_xscale
		if scr_mode_Is_easy()
			hspeed=3*image_xscale
		gravity=0.1
		gravity_direction=direction
		scr_sound_play(se_boss_cjc_airplane_sparkthru)
		action=5.6
	}
}
if action==5.6 {
	sparkthre_airflow()
	if image_xscale*(rx-cenrx)>=VIEW_W*3/2 {
		gravity=0
		gravity_direction=270
		speed=0
		image_xscale*=-1
		rx=cenrx-128*image_xscale
		ry=-128
		action=5.7
		time=60
	}
}
//降下来
if action==5.7 && time==0 {
	firedir=1
	vspeed=2
	action=5.8
}
if action==5.8 {
	vspeed=max(0.5, 2*(1-ry/96))
	if ry>=96 {
		ry=96
		speed=0
		float=true
		action=5.9
		time=30
	}
}
if action==5.9 && time==0 {
	action=0.5
}
#endregion