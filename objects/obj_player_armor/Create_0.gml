model=PLAYER_MODEL.ARMOR
event_inherited();
uncharge[1]=false
uncharge[2]=false
sub_unuse=false

kick_type=0 //0下踢1斜下
kick_support=2 //飞踢恢复羁绊
glide_close=false //关闭滑翔的一帧

saber_combo=0 //记录按键combo

bullet_time=-1
bullet_set=30
walk_saber_time=-1
walk_saber_set=15
clearBullets = function() {
	bullet_time=-1;
	walk_saber_time=-1;
}
//判断是否能射出子弹
canShootBullets = function() {
	var bullet_number=0
	if instance_exists(obj_player_bullet_armor){
		with(obj_player_bullet_armor){
			if sprite_index==spr_player_armor_bullet01
				bullet_number+=1
		}
	}
	return bullet_number<3
}
//站立
shoot_x[0]=29
shoot_y[0]=-16
//走路
shoot_x[1]=30
shoot_y[1]=-16
//空中
shoot_x[2]=34
shoot_y[2]=-19
//冲刺
shoot_x[3]=51
shoot_y[3]=2

//shoot_x[3]=25
//shoot_y[3]=-7