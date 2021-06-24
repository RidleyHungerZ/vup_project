attack=4
if scr_mode_Is_hard() hp=192
else hp=96
event_inherited();
bs=0
enemy_type=1
enemy_ground=1

_xl=2000
_xr=2512
_yt=0
_yb=288

float=false //漂浮
//body=instance_create_depth(x, y, depth+1, obj_boss_caoJc_airplane)
//body.enemy=id
//body.boss=id
SS_window=spr_boss_cjc_window

firedir=0 //0不喷射，1向下喷，2向后喷

drawSelf = function() {
	draw_self();
	if sprite_index!=spr_none {
		//向下喷射火焰
		if firedir==1 {
			var shiftxy=shift_xy_angle(76*image_xscale, 31*image_yscale, image_angle)
			draw_sprite_ext(spr_boss_cjc_airplane_vfire, scr_image_index_fpscurr(true, 0.5, 3),
							x+shiftxy.x, y+shiftxy.y, image_xscale, image_yscale, 
							image_angle, image_blend, image_alpha)
		}
		var shiftxy;
		//草剪葱
		//shiftxy = shift_xy_angle(64*image_xscale, -32*image_yscale, image_angle)
		//draw_sprite_ext(spr_boss_cjc_person, 0, x+shiftxy.x, y+shiftxy.y, 
		//				image_xscale, image_yscale, image_angle, image_blend, image_alpha)
		//玻璃
		shiftxy = shift_xy_angle(79*image_xscale, 7*image_yscale, image_angle)
		draw_sprite_ext(SS_window, 0, x+shiftxy.x, y+shiftxy.y, 
						image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	}
}
//开始爆炸发生事件
boss_hp0_trigger=function() {
	action=0
	speed=0
	gravity=0
	gravity_direction=270
	float=false
	//消灭子弹
	with obj_boss_caoJc_bullet_missile_s {
		final_selfBoom()
	}
	with obj_boss_caoJc_bullet_missile_b {
		final_selfBoom()
	}
	with obj_ground_block_bullet {
		self_boom()
	}
	//抓人爪子爆炸
	if arm_catch.arm_angle>0 {
		arm_catch.forearm.final_selfBoom()
	}
}
//消失时一并带走零件
boom_trigger = function() {
	//消灭箱子
	
	//创建残骸
	with instance_create_layer(2368, 232, obj_room.layerInst[4], obj_animation) {
		scr_sprite_change(spr_boss_cjc_body_ruins, 0, 0)
		image_xscale=-1
	}
	firedir=0
}
//向下喷射火焰时地面灰尘
vfire=function(fx, fy) {
	if global.fps_currmenu mod 6 == 0 {
		//获得地面位置
		fy=(fy div 16)*16
		while !place_meeting(fx, fy, obj_ground) && fy<global.room_yb
			fy+=16
		with instance_create_layer(fx+random_range(-32, 32), fy+16, obj_room.layerInst[1], obj_animation_once) {
			scr_sprite_change(spr_smoke, 0, 0.5)
			vspeed=-4
		}
	}
}
//冲撞气流
sparkthre_airflow=function() {
	var cenx=(_xl+_xr)/2;
	with instance_create_layer(random_range(_xl, _xr), irandom_range(y-48, y+32), obj_room.layerInst[1], obj_animation_once) {
		scr_sprite_change(spr_smoke, 0, 0.5)
		hspeed=other.image_xscale*random_range(4, 8)
	}
}
craw_catch_result=0
//抓人未抓到结束
craw_catch_empty=function() {
	craw_catch_result=1
}
//抓人抓到了
craw_catch_player=function() {
	craw_catch_result=2
}
craw_block=0
//箱子没了
craw_block_boom=function() {
	craw_block=1
}

#region 马达
motor[0]=instance_create_depth(x, y, depth-10, obj_boss_caoJc_motor);
with motor[0] {
	scr_sprite_change(spr_boss_cjc_motor_frt, 0, 0)
	enemy=other.id
	shift_x=-112
	shift_y=6
}
motor[1]=instance_create_depth(x, y, depth+200, obj_boss_caoJc_motor);
with motor[1] {
	scr_sprite_change(spr_boss_cjc_motor_back, 0, 0)
	enemy=other.id
	shift_x=-13
	shift_y=-27
}
#endregion
#region 机械臂肩膀
shoulder[0]=instance_create_depth(x, y, depth+10, obj_boss_caoJc_shoulder)
with shoulder[0] {
	scr_sprite_change(spr_boss_cjc_shoulder_frt, 0, 0)
	enemy=other.id
	shift_x=-45
	shift_y=45
	inside=instance_create_depth(x, y, other.depth+90, obj_boss_caoJc_shoulder) 
	with inside{
		scr_sprite_change(other.sprite_index, 1, 0)
		enemy=other.id
	}
}
shoulder[1]=instance_create_depth(x, y, depth+110, obj_boss_caoJc_shoulder)
with shoulder[1] {
	scr_sprite_change(spr_boss_cjc_shoulder_back, 0, 0)
	enemy=other.id
	shift_x=-5
	shift_y=23
	inside=instance_create_depth(x, y, other.depth+190, obj_boss_caoJc_shoulder) 
	with inside{
		scr_sprite_change(other.sprite_index, 1, 0)
		enemy=other.id
	}
}
#endregion
#region 机械臂
arm[0]=instance_create_depth(x, y, depth+50, obj_boss_caoJc_arm)
with arm[0] {
	scr_sprite_change(spr_boss_cjc_arm_frt, 0, 0)
	enemy=other.id
	shift_x=-45
	shift_y=45
}
arm_catch=arm[0]

arm[1]=instance_create_depth(x, y, depth+150, obj_boss_caoJc_arm)
with arm[1] {
	scr_sprite_change(spr_boss_cjc_arm_back, 0, 0)
	enemy=other.id
	shift_x=-5
	shift_y=23
}
arm_block=arm[1]
#endregion
#region 导弹发射
lanuch[0]=instance_create_depth(x, y, depth-10, obj_boss_caoJc_lanuch)
with lanuch[0] {
	scr_sprite_change(spr_boss_cjc_lanuch_closing, 0, 0)
	enemy=other.id
	shift_x=-16
	shift_y=0
}
#endregion