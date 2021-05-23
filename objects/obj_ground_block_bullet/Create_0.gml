event_inherited();
attack=0;
event_perform_object(obj_enemy,ev_create,ev_create);
enemy_type=1; //0地上1浮空
enemy_ground=0; //0无视墙壁，1接触墙壁
enemy_prick=1; //0碰触墙壁，1无视墙壁
death_xscale=0; //是否使用受伤对准的死亡方向,0使用
push_fly=2; //是否被击飞，0为击中即飞，1为空血即飞，2为不飞
injure_back=0; //受伤是否被击退
injure_elementback=0; //属性是否被击退
injure_elementfall=0; //飞行属性被属性击中是否下落
death_boom=1; //贯穿是否立刻爆炸
enemy_or_bullet=1; //是子弹还是敌人
undm_push=1; //无敌情况下能被打死
trans_spd=0; //传送带速度
boom=1; //爆炸数量
use_move_sys=true; //是否使用移动系统
canboom=true; //延迟爆炸使用

//绘制自己
drawSelf = function() {
	draw_sprite_ext(sprite_index,floor(image_index),round(x),round(y),
					image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
scr_block_fall = function() {
	if !collision_rectangle(bbox_right,bbox_bottom+1,bbox_left,bbox_bottom,obj_ground,1,1)
	&& !collision_rectangle(bbox_right,bbox_bottom+1,bbox_left,bbox_bottom,obj_floor,1,1){
		gravity=grav
		if place_meeting(x,y,obj_water)
			gravity=grav/2
	}
	else{
		vspeed=0
		gravity=0
		while collision_rectangle(bbox_right,bbox_bottom,bbox_left,bbox_bottom-8,obj_ground,1,1)
		|| collision_rectangle(bbox_right,bbox_bottom,bbox_left,bbox_bottom-8,obj_floor,1,1){
			y-=image_yscale
			if collision_rectangle(bbox_right,bbox_top+1,bbox_left,bbox_top,obj_player,1,1)
				obj_player.y-=image_yscale
		}
	}
	var trans=collision_rectangle(bbox_right,bbox_bottom,bbox_left,bbox_top,obj_trans,1,1)
	if trans 
	&& collision_rectangle(bbox_right,bbox_bottom+1,bbox_left,bbox_top,obj_ground,1,1)
	&& vsp>=0{
		trans_spd=trans.trans_hsp
		hspeed=trans_spd
		if collision_rectangle(bbox_right+sign(hspeed),bbox_bottom,bbox_left+sign(hspeed),bbox_top,obj_ground,1,1){
			while collision_rectangle(bbox_right,bbox_bottom,bbox_left,bbox_top,obj_ground,1,1) 
				x-=sign(hspeed)
			hspeed=0
		}
	}
	else{
		if trans_spd!=0{
			hspeed=0
			trans_spd=0
		}
	}
}
