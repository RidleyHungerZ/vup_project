scr_menu_stop();
if(!scr_menu_trem()) exit;
scr_time_alarm();
if(damage>=damage_time) {
	scr_ice_boompart_ext(spr_ice_part, 8, x, y)
	//for(var ii=1;ii<=8;ii+=1){
	//	with(instance_create_depth(x,y,depth-1,obj_ice_part)){
	//		scr_sprite_change(spr_part_element2,ii-1,0);
	//		gravity=G;
	//		direction=random_range(other.damage_dir-15,other.damage_dir+15);
	//		speed=random_range(3,6);
	//		dspeed=random(6)*-image_xscale*image_yscale;
	//	}
	//}
	instance_destroy();
	//scr_sound_play(SE_BREAK);
}