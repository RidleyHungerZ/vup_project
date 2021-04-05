scr_menu_stop();
if(!scr_menu_trem()) exit;
if(!scr_in_view(view_off)) instance_destroy();
#region 地上
if(fall==0) {
	if(!collision_rectangle(bbox_right+image_xscale,bbox_bottom+GRDY-4,bbox_left+image_xscale,bbox_top,obj_ground,1,1)){
		x-=0.5*sign(image_xscale);
		while(!collision_rectangle(bbox_right,bbox_bottom+GRDY-4,bbox_left,bbox_top,obj_ground,1,1)
		&&(collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_ground,1,1)
		|| collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_floor,1,1)))
			y-=1;
	}
	if(!place_meeting(x,y+GRDY+4,obj_ground)
	&& !place_meeting(x,y+GRDY+4,obj_sink)
	&& !collision_rectangle(bbox_right,bbox_bottom+GRDY+4,bbox_left,bbox_bottom+GRDY,obj_floor,1,1)) {
		hspeed=-2*sign(image_xscale);
		fall=1;
	}
	wait_time-=1;
	if(wait_time<=0) {
		scr_enemy_boom_number(x, y, boom_number, boom_type)
		scr_enemy_boompart(SS_part);
		instance_destroy();
	}
}
#endregion
#region 空中
else if(fall==1) {
	dis_dir+=dspeed*sign(image_xscale);
	if(abs(vspeed)>=abs(gravity)*vspmaxn
	&& gravity!=0) {
		vspeed=gravity*vspmaxn;
		gravity=0;
	} else {
		gravity=G*sign(image_yscale);
		if(place_meeting(x,y,obj_water))
			gravity=gravity/2;
	}
	if(place_meeting(x,y+GRDY,obj_ground)
	|| place_meeting(x,y+GRDY,obj_sink)
	|| collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY-1,obj_floor,1,1)) {
		fall=0;
		wait_time=0;
	}
}
#endregion