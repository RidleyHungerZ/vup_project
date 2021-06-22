event_inherited();
if(!scr_menu_trem()) exit;
if hp<=0 exit
if view!=1{
	x=init_x
	y=init_y
	exit
}
if sprite_index==SS_injure exit
//站立
if action==0 && time==0 {
	y+=8*(pi/30)*sin(global.fps_currmenu*pi/30)
	hspeed=1*image_xscale
	//超边界转弯
	if (x-xsign)*image_xscale>=xrange
	|| !collision_point(x+32*image_xscale, y, obj_water, 1, 1) {
		action=2
	}
	//发现敌人
	else if find_player() {
		scr_sprite_change(spr_enemy08_idle_angry, 0, 0.25)
		speed=0
		action=1
		time=30
	}
} 
//冲击
else if action==1 && time==0 {
	hspeed=4*image_xscale
	//超边界转弯
	if (x-xsign)*image_xscale>=xrange
	|| !collision_point(x+32*image_xscale, y, obj_water, 1, 1) {
		action=2
	}
}
//转弯
else if action==2 {
	speed=0
	if y>ystart {
		scr_sprite_change(spr_enemy08_trans_up, 0, 0.25)
	} else {
		scr_sprite_change(spr_enemy08_trans_down, 0, 0.25)
	}
	action=2.1
}