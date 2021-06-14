/// @desc 设置背景
/// @arg isfirst 是否为第一次调用，用于操作某些贴图移动层
function scr_viewroom_background(isfirst){
	var vx=view_xpos(0),
		vy=view_ypos(0),
		vw=view_wpos(0),
		vh=view_hpos(0),
		tvx=view_xpos(0),
		tvy=view_ypos(0);
	if isfirst {
		tvx=obj_view.view_shock_prex
		tvy=obj_view.view_shock_prey
	}
	switch(room){
		#region area0
		case room_area0_1 : { #region
			#region 背景
				background_x[1]=0.75 * vx
				background_y[1]=vy
			#endregion
			#region 声音
			
			#endregion
			#region 重生点
				scr_relife_set_door(4640, 176)
			#endregion
			#region 门锁定
			
			#endregion
			#region 小对话
				if scr_tip_thread_can() {
					//办公室对话结束
					if scr_thread_isover(2)
						scr_tip_thread(0, 0)
					if scr_thread_isover(3)
						scr_tip_thread(0, 1)
				}
			#endregion
		break } #endregion
		case room_area0_2 : { #region
			#region 背景
				background_x[1]=0.4 * vx
				background_y[1]=vy-288
				
				background_x[2]=0.5 * vx
				background_y[2]=vy-288
				
				background_x[3]=0.6 * vx
				background_y[3]=vy-288
				
				background_x[4]=0.8 * vx
				background_y[4]=vy-288
				
				background_x[5]=vx
				background_y[5]=vy-288
				
				background_x[6]=vx
				background_y[6]=vy-288
			#endregion
			#region 声音
			
			#endregion
			#region 重生点
				
			#endregion
			#region 门锁定
			
			#endregion
			#region 小对话
				if scr_tip_thread_can() {
					//变身
					if scr_thread_isover(4)
						scr_tip_thread(0, 2)
				}
			#endregion
		break } #endregion
		#endregion
	}
	scr_background_set()
}
/// @desc 按照变量将图层信息设置回去
function scr_background_set() {
	//背景
	for(var i=1;i<=background_count;i+=1){
		var name="Backgrounds_"+string(i),
			lyid=layer_get_id(name),
			bgid=layer_background_get_id(lyid);
		if!layer_exists(lyid) continue
		else if !layer_background_exists(lyid,bgid) continue
		else if !layer_background_get_visible(bgid) && !background_visible[i] continue
		//常量设置
		if background_imspd[i]=0
			layer_background_index(bgid,background_index[i])
		layer_set_visible(lyid,background_visible[i])
		layer_background_xscale(bgid,background_xscale[i])
		layer_background_yscale(bgid,background_yscale[i])
		layer_background_alpha(bgid,background_alpha[i])
		layer_background_blend(bgid,background_blend[i])
		layer_background_htiled(bgid,background_htiled[i])
		layer_background_vtiled(bgid,background_vtiled[i])
		layer_background_stretch(bgid,background_stretch[i])
		//速度
		if scr_menu_trem(){
			layer_hspeed(lyid,background_hspeed[i])
			layer_vspeed(lyid,background_vspeed[i])
			layer_background_speed(bgid,background_imspd[i])
			if background_hspeed[i]=0 layer_x(lyid,background_x[i]) 
			else{background_x[i]=layer_get_x(lyid) mod background_width[i]; layer_x(lyid,background_x[i])}
			if background_vspeed[i]=0 layer_y(lyid,background_y[i]) 
			else{background_y[i]=layer_get_y(lyid) mod background_height[i];layer_y(lyid,background_y[i])}
		}
		else{
			layer_hspeed(lyid,0)
			layer_vspeed(lyid,0)
			layer_background_speed(bgid,0)
			background_x[i]=layer_get_x(lyid)
			background_y[i]=layer_get_y(lyid)
		}
		//精灵存在
		if sprite_exists(background_sprite[i]){
			layer_background_sprite(bgid,background_sprite[i])
			background_width[i]=sprite_get_width(background_sprite[i])*abs(background_xscale[i])
			background_height[i]=sprite_get_height(background_sprite[i])*abs(background_yscale[i])
		}
	}
}
/// @desc 按照图层信息放入到变量中
function scr_background_get() {
	//清理画面
	var lyid0=layer_get_id("Backgrounds_0")
	if !layer_exists(lyid0)
		lyid0=layer_create(1000000,"Backgrounds_0")
	var bgid0=layer_background_get_id(lyid0)
	if !layer_background_exists(lyid0,bgid0)
		bgid0=layer_background_create(lyid0,noone)
	layer_background_blend(bgid0,c_black)
	//绘制背景
	for(var i=1;i<=background_count;i+=1){
		var name="Backgrounds_"+string(i),
			lyid=layer_get_id(name),
			bgid=layer_background_get_id(lyid);
		if!layer_exists(lyid) continue
		else if !layer_background_exists(lyid,bgid) continue
		background_sprite[i]=layer_background_get_sprite(bgid)
		background_index[i]=layer_background_get_index(bgid)
		background_xscale[i]=layer_background_get_xscale(bgid)
		background_yscale[i]=layer_background_get_yscale(bgid)
		background_alpha[i]=layer_background_get_alpha(bgid)
		background_blend[i]=layer_background_get_blend(bgid)
		background_htiled[i]=layer_background_get_htiled(bgid)
		background_vtiled[i]=layer_background_get_vtiled(bgid)
		background_stretch[i]=layer_background_get_stretch(bgid)
		background_visible[i]=layer_get_visible(lyid)
		if scr_menu_trem(){
			background_hspeed[i]=layer_get_hspeed(lyid)
			background_vspeed[i]=layer_get_vspeed(lyid)
			background_imspd[i]=layer_background_get_speed(bgid)
		}
		background_x[i]=layer_get_x(lyid)
		background_y[i]=layer_get_y(lyid)
		if sprite_exists(background_sprite[i]){
			background_width[i]=sprite_get_width(background_sprite[i])*abs(background_xscale[i])
			background_height[i]=sprite_get_height(background_sprite[i])*abs(background_yscale[i])
		}
	}
}
