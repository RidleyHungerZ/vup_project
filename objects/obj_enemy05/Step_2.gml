event_inherited();
if(!scr_menu_trem()) exit;
if hp<=0 exit
if view!=1{
	x=init_x
	y=init_y
	exit
}
//恢复飞回
if elenemt_recover=1
	fall_return=1
//被电和冰
if injure_element=ELEMENTS.ice
|| injure_element=ELEMENTS.elec exit
//返回中
if fall_return=1{
	speed=3
	direction=point_direction(x,y,xstart,ystart)
	if point_distance(x,y,xstart,ystart)<=speed/2{
		fall_return=0
		speed=0
		direction=0
		round_t=0
	}
}
//绕圈
else if fall_return=0{
	if audofly {
		speed=rad*degtorad(dirspeed)
		direction+=dirspeed
		image_xscale=sign_no0(obj_player.x-x)
		if image_xscale=0 image_xscale=1
	}
	//准备射击
	if action=0 && time==0 {
		if find_player() {
			action=1
		}
	} else if action==1 {
		scr_sprite_change(spr_enemy05_shoot,0,0.5)
		for(var i=0;i<3;i+=1){
			with instance_create_depth(x+28*image_xscale, y+10*image_yscale,depth, obj_bullet_enemy01){
				speed=6
				direction=270+30*i*other.image_xscale
			}
		}
		scr_sound_play(se_enemy_bullet)
		action=2
	}
}