if view_current!=1 exit
var cenx=VIEW_W_UI/2,
	ceny=VIEW_H_UI/2;
//背景图像
var logox=x/VIEW_W*VIEW_W_UI, logoy=y/VIEW_H*VIEW_H_UI;
draw_sprite(spr_logo_bgs, 0, cenx, ceny)
draw_sprite(spr_logo_title, 0, logox, logoy)
//文本
var txtsx=cenx,
	txtsy=ceny+256;
//按下任意键
if select_type==0 {
	var txtalpha=1;
	if frac(action)!=0
	&& time>0 
		txtalpha=(time mod 4)*0.25
	scr_draw_text_ext(c_black, txtalpha, 0, font_puhui_32, 0.5, 0.5, global.txt_logo[0], 
					txtsx, txtsy, 1, 1, -1, -1, -1, 0);
}
//选项
else {
	var options=global.txt_logo[select_type];
	for(var i=0;i<select_type-1;i++) {
		options=options[select[i]]
	}
	var optioncount=array_length(options),
		selectnow=select[select_type],
		txth=112,
		allh=txth*(optioncount-1);
	for(var i=0;i<optioncount;i++) {
		var drawy=txtsy-allh/2+i*txth,
			txtcol=c_black,
			txtalpha=1;
		//选择缓动
		if i==selectnow {
			txtcol=c_white;
			//边框
			var xrate=0, yrate=1;
			if frac(action)==0 xrate=(time/10);
			else {
				yrate=max(0, (time-25)/5);
			}
			draw_sprite(spr_logo_txt_bgs, 0, txtsx, drawy)
			draw_sprite_ext(spr_logo_txt_frame, 0, txtsx-16*xrate, drawy-16*yrate, 1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_logo_txt_frame, 0, txtsx+16*xrate, drawy+16*yrate, -1, -1, 0, c_white, 1)
		}
		//文字
		//选中时闪光
		if i==selectnow 
		&& frac(action)!=0 
		&& time>0 
			txtalpha=(time mod 4)*0.25
		scr_draw_text_ext(txtcol, txtalpha, 0, font_puhui_32, 0.5, 0.5, options[i], 
						txtsx, drawy, 1, 1, -1, -1, -1, 0);
	}
}
//配置界面
if operate_setting_display {
	with obj_menu {
		var dx=0,
			dy=0,
			cenx = dx+VIEW_W_UI/2,
			index=2;
		draw_sprite(spr_menu_bgs, 0, 0, 0)
		draw_sprite(spr_menu_tab, 0, dx, dy)
		var tabcenum=sprite_get_number(spr_menu_tab_center);
		draw_sprite(spr_menu_tab_center, scr_image_index_fpscurr(false, 0.1, tabcenum), cenx, dy)
		draw_sprite(spr_menu_tab_center_frame, 0, cenx, dy)
		draw_sprite(spr_nemu_tab_center_name, index, cenx, dy+64)
		scr_menu_option_draw(0, 0)
	}
}