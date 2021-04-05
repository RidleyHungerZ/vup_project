/// @description 
if view_current==0 {
	//震动前设置镜头
	view_shock_prex=view_xpos(0)
	view_shock_prey=view_ypos(0)
	#region 震动
	//房间不震动
	if global.view_shock==0{
		viewShock=0;
	}
	//房间震动
	else if scr_menu_trem(){
		var shockT=30, //震动周期
			shockRx=6,
			shockRy=4; //震动幅度
		viewShock+=1;
		var cur_struct_x = animcurve_get(acur_shock_x),
			cur_channel_x = animcurve_get_channel(cur_struct_x, 0),
			cur_val_x = animcurve_channel_evaluate(cur_channel_x, viewShock/shockT),
			shockValx = shockRx*cur_val_x;
		view_addx(shockValx)
		var cur_struct_y = animcurve_get(acur_shock_y),
			cur_channel_y = animcurve_get_channel(cur_struct_y, 0),
			cur_val_y = animcurve_channel_evaluate(cur_channel_y, viewShock/shockT),
			shockValy = shockRy*cur_val_y;
		view_addy(shockValy)
		//scr_setroom_background(obj_view0)
		//震动一次
		if global.view_shock==1 {
			if viewShock mod shockT == 0 
				global.view_shock=0;
		}
		//持续震动
		else if global.view_shock==2 {
			if viewShock >= floor(shockT*(3/4))
				viewShock = floor(shockT*(1/4));
		}
	}
	#endregion
}