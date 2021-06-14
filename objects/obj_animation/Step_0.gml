if menu_stop scr_menu_stop()
if menu_stop && !scr_menu_trem() exit
scr_time_alarm()
if death_time>0 death_time--
else if death_time==0 
	instance_destroy()
	
#region 常规数据
image_speed+=aimspd;
if(image_speed>aimspd_max) image_speed=aimspd_max;
else if(image_speed<aimspd_min) image_speed=aimspd_min;
image_xscale+=xcspeed*sign(image_xscale);
image_yscale+=ycspeed*sign(image_yscale);
direction+=dirspeed;
image_angle+=aglspeed;
image_alpha+=aphspeed;
if(aspeed!=0) {
	if(speedlmt!=0) 
		speed=clamp(speed+aspeed, 0, speedlmt);
	else speed=max(speed+aspeed, 0);
}
#endregion
#region 出屏幕
if(view_edge>=0 && !scr_in_view(view_edge)) 
	instance_destroy();
if(room_edge>=0 && !scr_in_room(room_edge)) 
	instance_destroy();
#endregion