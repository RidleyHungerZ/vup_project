attack=6
hp=192
event_inherited();
bs=0
enemy_type=1
enemy_ground=1

_xl=2000
_xr=2512
_yt=0
_yb=288

//body=instance_create_depth(x, y, depth+1, obj_boss_cjc_airplane)
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
boom_start_trigger=function() {
	//消灭子弹
	with obj_boss_cjc_bullet_missile_s {
		final_selfBoom()
	}
	with obj_boss_cjc_bullet_missile_b {
		final_selfBoom()
	}
}
//消失时一并带走零件
boom_trigger = function() {
	//消灭箱子
	
	//创建残骸
	with instance_create_layer(2368, 240, obj_room.layerInst[4], obj_animation) {
		scr_sprite_change(spr_boss_cjc_body_ruins, 0, 0)
		image_xscale=-1
	}
}
//向下喷射火焰时地面灰尘
vfire=function(fx, fy) {
	if global.fps_currmenu mod 6 == 0 {
		//获得地面位置
		fy=(fy div 16)*16
		while !place_meeting(fx, fy, obj_ground) fy+=16
		with instance_create_layer(fx+random_range(-32, 32), fy+16, obj_room.layerInst[1], obj_animation_once) {
			scr_sprite_change(spr_smoke, 0, 0.5)
			vspeed=-4
		}
	}
}

#region 马达
motor[0]=instance_create_depth(x, y, depth-10, obj_boss_cjc_motor);
with motor[0] {
	scr_sprite_change(spr_boss_cjc_motor_frt, 0, 0)
	enemy=other.id
	shift_x=-112
	shift_y=6
}
motor[1]=instance_create_depth(x, y, depth+200, obj_boss_cjc_motor);
with motor[1] {
	scr_sprite_change(spr_boss_cjc_motor_back, 0, 0)
	enemy=other.id
	shift_x=-13
	shift_y=-27
}
#endregion
#region 机械臂肩膀
shoulder[0]=instance_create_depth(x, y, depth+10, obj_boss_cjc_shoulder)
with shoulder[0] {
	scr_sprite_change(spr_boss_cjc_shoulder_frt, 0, 0)
	enemy=other.id
	shift_x=-45
	shift_y=45
	inside=instance_create_depth(x, y, other.depth+90, obj_boss_cjc_shoulder) 
	with inside{
		scr_sprite_change(other.sprite_index, 1, 0)
		enemy=other.id
	}
}
shoulder[1]=instance_create_depth(x, y, depth+110, obj_boss_cjc_shoulder)
with shoulder[1] {
	scr_sprite_change(spr_boss_cjc_shoulder_back, 0, 0)
	enemy=other.id
	shift_x=-5
	shift_y=23
	inside=instance_create_depth(x, y, other.depth+190, obj_boss_cjc_shoulder) 
	with inside{
		scr_sprite_change(other.sprite_index, 1, 0)
		enemy=other.id
	}
}
#endregion
#region 机械臂
arm[0]=instance_create_depth(x, y, depth+50, obj_boss_cjc_arm)
with arm[0] {
	scr_sprite_change(spr_boss_cjc_arm_frt, 0, 0)
	enemy=other.id
	shift_x=-45
	shift_y=45
}
arm[1]=instance_create_depth(x, y, depth+150, obj_boss_cjc_arm)
with arm[1] {
	scr_sprite_change(spr_boss_cjc_arm_back, 0, 0)
	enemy=other.id
	shift_x=-5
	shift_y=23
}
#endregion
#region 导弹发射
lanuch[0]=instance_create_depth(x, y, depth-10, obj_boss_cjc_lanuch)
with lanuch[0] {
	scr_sprite_change(spr_boss_cjc_lanuch_closing, 0, 0)
	enemy=other.id
	shift_x=-16
	shift_y=0
}
#endregion