/// @desc 绘制头部页签
/// @arg x
/// @arg y
function scr_draw_menu_tab(dx, dy, index){
	var cenx = dx+VIEW_W_UI/2;
	var preinx = index-1,
		nextinx = index+1;
	if preinx<0 preinx=menu_page_count-1
	if nextinx>=menu_page_count nextinx=0
	draw_sprite(spr_menu_tab, 0, dx, dy)
	draw_sprite(spr_menu_tab_lr_name, preinx, dx+408, dy+64)
	draw_sprite(spr_menu_tab_lr_name, nextinx, dx+VIEW_W_UI-408, dy+64)
	//L
	draw_sprite_ext(spr_menu_tab_lr, 0, dx, dy, 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_menu_tab_lr_txt, 0, dx+96, dy+80, 1, 1, 0, c_white, 1)
	//R
	draw_sprite_ext(spr_menu_tab_lr, 0, dx+VIEW_W_UI, dy, -1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_menu_tab_lr_txt, 1, dx+VIEW_W_UI-96, dy+80, 1, 1, 0, c_white, 1)
	//name
	draw_sprite(spr_menu_tab_center, 0, cenx, dy)
	draw_sprite(spr_nemu_tab_center_name, index, cenx, dy+64)
	//箭头
	var af = sin(global.fps_curr*pi/30);
	draw_sprite_ext(spr_menu_arrow, 0, cenx-336-8*af, dy+64, -1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_menu_arrow, 0, cenx+336+8*af, dy+64, 1, 1, 0, c_white, 1)
}
/// @desc 绘制状态页
/// @arg x
/// @arg y
function scr_draw_menu_status(dx, dy){
	var drawx=dx, drawy=dy, page=0
	scr_draw_menu_tab(dx, dy, page)
	#region 左侧
	draw_sprite(spr_menu_status_left_bgs, 0, dx+368, dy+592)
	//时间金币卡
	drawx=dx+368 drawy=dy+384
	draw_sprite(spr_menu_status_left_timeec_bgs, 0, drawx, drawy)
	drawx=dx+368 drawy=dy+384
	var txtstruts=global.txt_menu[0].left;
	//时间
	scr_draw_text_ext(UIPINK, 1, 0, font_puhui_32, 0.5, 0.5, txtstruts.PLAY_TIME, drawx, drawy-28-56, 1, 1, -1, -1, -1, 0)
	var timestr=date_format("HH:mm:ss", [0, 0, 0, global.hour, global.minute, global.second])
	scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, timestr, drawx, drawy-28, 1, 1, -1, -1, -1, 0)
	//金币
	scr_draw_text_ext(UIPINK, 1, 0, font_puhui_32, 0.5, 0.5, txtstruts.CYBER_ES, drawx, drawy+28, 1, 1, -1, -1, -1, 0)
	var esstrs=["[", "ES]"];
	scr_draw_text_ext(UIPINK, 1, 0, font_puhui_32, 0, 0.5, esstrs[0], drawx-112, drawy+28+56, 1, 1, -1, -1, -1, 0)
	scr_draw_text_ext(UIPINK, 1, 0, font_puhui_32, 1, 0.5, esstrs[1], drawx+112, drawy+28+56, 1, 1, -1, -1, -1, 0)
	scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, global.player_ec, drawx-24, drawy+28+56, 1, 1, -1, -1, -1, 0)
	
	//头像
	drawx=dx+368 drawy=dy+624
	draw_sprite(spr_menu_status_left_shoto_iframe, 0, drawx, drawy)
	draw_sprite(spr_menu_status_left_shoto, global.model, drawx, drawy)
	draw_sprite(spr_menu_status_left_shoto_iframe, 1, drawx, drawy)
	//血条
	drawx=dx+128 drawy=dy+752
	var hpifw=sprite_get_width(spr_menu_status_left_hp_iframe),
		hpifh=sprite_get_height(spr_menu_status_left_hp_iframe),
		hpifxcenlen=hpifw*(30*(global.player_hp_up/64))-2*hpifw,
		hpcenlen=hpifw*(30*(global.player_hp/64));
	draw_sprite(spr_menu_status_left_hp_iframe, 0, drawx, drawy)
	draw_sprite_ext(spr_menu_status_left_hp_iframe, 1, drawx+hpifw, drawy, hpifxcenlen/hpifw, 1, 0, c_white, 1)
	draw_sprite(spr_menu_status_left_hp_iframe, 2, drawx+hpifw+hpifxcenlen, drawy)
	
	draw_sprite_part(spr_menu_status_left_hp, 0, 0, 0, max(0, min(hpcenlen, hpifw)), hpifh, drawx, drawy-hpifh/2)
	draw_sprite_ext(spr_menu_status_left_hp, 1, drawx+hpifw, drawy, max(0, min(hpcenlen-hpifw, hpifxcenlen))/hpifw, 1, 0, c_white, 1)
	draw_sprite_part(spr_menu_status_left_hp, 2, 0, 0, max(0, min(hpcenlen-hpifw-hpifxcenlen, hpifw)), hpifh, drawx+hpifw+hpifxcenlen, drawy-hpifh/2)
	//mp
	drawx=dx+128 drawy=dy+816
	var mpifw=sprite_get_width(spr_menu_status_left_mp_iframe),
		mpifh=sprite_get_height(spr_menu_status_left_hp_iframe),
		mpifxcenlen=mpifw*(30*(global.player_mp_up/64))-2*mpifw,
		mpcenlen=mpifw*(30*(global.player_mp/64));
	draw_sprite(spr_menu_status_left_mp_iframe, 0, drawx, drawy)
	draw_sprite_ext(spr_menu_status_left_mp_iframe, 1, drawx+mpifw, drawy, mpifxcenlen/mpifw, 1, 0, c_white, 1)
	draw_sprite(spr_menu_status_left_mp_iframe, 2, drawx+mpifw+mpifxcenlen, drawy)

	draw_sprite_part_ext(spr_menu_status_left_mp, 0, 0, 0, max(0, min(mpcenlen, mpifw)), mpifh, drawx, drawy-mpifh/2, 1, 1, UIPINK, 1)
	draw_sprite_ext(spr_menu_status_left_mp, 1, drawx+mpifw, drawy, max(0, min(mpcenlen-mpifw, mpifxcenlen))/mpifw, 1, 0, UIPINK, 1)
	draw_sprite_part_ext(spr_menu_status_left_mp, 2, 0, 0, max(0, min(mpcenlen-mpifw-mpifxcenlen, mpifw)), mpifh, drawx+mpifw+mpifxcenlen, drawy-mpifh/2, 1, 1, UIPINK, 1)
	//羁绊
	drawx=dx+464 drawy=dy+936
	var supstr="MAX";
	if global.player_support<100 {
		supstr=string(global.player_support)+"%"
		if global.player_support<10 supstr=" "+supstr;
	}
	scr_draw_text_ext(UIPINK, 1, 0, font_jam_80, 0.5, 0.5, supstr, drawx, drawy, 1, 1, -1, -1, -1, 0)
	#endregion
	#region 右侧
	drawx=dx+1248 drawy=dy+592
	draw_sprite(spr_menu_status_right_bgs, 0, drawx, drawy)
	
	#endregion
}
/// @desc 绘制道具页
/// @arg x
/// @arg y
function scr_draw_menu_item(dx, dy){
	var drawx=dx, drawy=dy, page=1
	scr_draw_menu_tab(dx, dy, page)
	
}
/// @desc 绘制设置页
/// @arg x
/// @arg y
function scr_draw_menu_option(dx, dy){
	var drawx=dx, drawy=dy, page=2
	scr_draw_menu_tab(dx, dy, page)
	scr_menu_option_draw(dx, dy)
}
/// @desc 绘制任务页
/// @arg x
/// @arg y
function scr_draw_menu_mission(dx, dy){
	var drawx=dx, drawy=dy, page=3
	scr_draw_menu_tab(dx, dy, page)
	
}
/// @desc 绘制技能页
/// @arg x
/// @arg y
function scr_draw_menu_skill(dx, dy){
	var drawx=dx, drawy=dy, page=4
	scr_draw_menu_tab(dx, dy, page)
	
}