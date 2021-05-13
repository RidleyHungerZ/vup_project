event_inherited();
if !scr_menu_trem() exit
#region 判定恢复
	if(injure_unrepeat!=0 
	|| injure_unrepeat_undm!=0){
		var damage=instance_place(x, y, obj_player_attack),
			noplace=false;
		if(damage) {
			if(damage.attack<=0) {
				noplace=true;
			}
		} else{
			noplace=true;
		}
		if(noplace) {
			injure_unrepeat=0;
			injure_unrepeat_undm=0;
		}
	}
#endregion
#region 无敌时间
	crash=0;
	if(uninjure!=_uninjure) {
		crash=1;
		untime=untime_set;
	}
	_uninjure=uninjure;
	if(hp<=0) 
		attack=0;
	if(untime>0) 
		untime-=1;
	else{
		untime=0;
		uninjure=0;
	}
#endregion
#region 移动
if(use_speed_system==1) {
	#region 自主运动系统
	if(hp>0) {
		scr_enemy_move_system();
	}
	#endregion
	#region 击飞运动系统
	#endregion
}
#endregion
#region 爆炸
if(canboom && hp<=0) {
	//for(var i=1;i<=8;i+=1){
	//	with(instance_create_depth(x,y,depth-1,obj_enemy_part)){
	//		scr_sprite_change(spr_enemy_through_part,i-1,0);
	//		gravity=G;
	//		direction=random_range(0,180);
	//		speed=random_range(4,8);
	//		dspeed=random(6)*-image_xscale*image_yscale;
	//	}
	//}
	repeat(boom){
		with(instance_create_depth(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),depth-1,obj_animation_once))
			scr_sprite_change(spr_boom,0,0.5);
	}
	instance_destroy();
	scr_sound_play(se_boom);
}
#endregion
