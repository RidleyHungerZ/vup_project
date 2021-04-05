/// @desc 绘制操作界面
function scr_menu_option_draw(dx, dy){
	var drawx=dx, drawy=dy, page=2
	//定义每个选项绘制方式
	if !is_method(draw_option_item) {
		draw_option_item = function(drx, dry, txtstruts, menupagesel, selected, value) {
			var text = txtstruts.text,
				option = txtstruts.option,
				option_type = option.type,
				option_list = option.list,
				selectin_neither = !selected && (menu_type>0), //未选中自己
				selectin = selected && (menu_type>0); //是否进入该选项
			var txtshifty=4;
			//底子
			draw_sprite(spr_menu_option_item, 0, drx, dry)
			//是否选中
			if selected {
				if option.type == menu_page2_option.line
					draw_sprite(spr_menu_option_item, 2, drx, dry)
				else draw_sprite(spr_menu_option_item, 1, drx, dry)
			}
			//名称
			scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0.5, text, drx-400, dry+txtshifty, 1, 1, -1, -1, -1, 0)
			//选项值
			var option_txt_color=c_white,
				flashaph = 0.5+0.5*sin(global.fps_curr*pi/60);
			if selectin option_txt_color=c_white
			switch option.type {
				case menu_page2_option.list:
					if selectin 
						draw_sprite_ext(spr_menu_option_item_selects, 1, drx, dry, 1, 1, 0, c_white, flashaph)
					else 
						draw_sprite(spr_menu_option_item_selects, 0, drx, dry)
					//值仅有一个时，视作普通字符串显示，否则显示当前选中列表
					var txtval;
					if array_length(option_list)==1 txtval=option_list[0]
					else txtval=option_list[value]
					txtval=string_replace_var(txtval)
					scr_draw_text_ext(option_txt_color, 1, 0, font_puhui_32, 0.5, 0.5, txtval, drx+272, dry+txtshifty, 1, 1, -1, -1, c_black, 1)
					break;
				case menu_page2_option.two:
					if selectin {
						var alpha1 = 1,
							alhpa2 = 1;
						//选中的黑闪烁，未选中的黑底，2级选中半透明
						if menu_type==2 flashaph=0.5
						if menupagesel[1]==0 {
							alpha1 = flashaph 
							alhpa2 = 1
						}
						else {
							alpha1 = 1 
							alhpa2 = flashaph
						}
						draw_sprite_ext(spr_menu_option_item_selects, 4, drx, dry, 1, 1, 0, c_white, alpha1)
						draw_sprite_ext(spr_menu_option_item_selects, 5, drx, dry, 1, 1, 0, c_white, alhpa2)
					}
					else {
						//未选中都是灰色
						draw_sprite(spr_menu_option_item_selects, 2, drx, dry)
						draw_sprite(spr_menu_option_item_selects, 3, drx, dry)
					}
					//值
					var txtval0=string_replace_var(option_list[0]),
						txtval1=string_replace_var(option_list[1]);
					scr_draw_text_ext(option_txt_color, 1, 0, font_puhui_32, 0.5, 0.5, txtval0, drx+192, dry+txtshifty, 1, 1, -1, -1, c_black, 1)
					scr_draw_text_ext(option_txt_color, 1, 0, font_puhui_32, 0.5, 0.5, txtval1, drx+352, dry+txtshifty, 1, 1, -1, -1, c_black, 1)
					break;
				case menu_page2_option.line:
					//值
					var lineimx=24;
					draw_sprite_ext(spr_menu_option_volume_line, 0, drx+192, dry, lineimx, 1, 0, c_white, 1)
					draw_sprite(spr_menu_option_volume_button, 0, drx+192+lineimx*16*(value-0.5), dry)
					break;
			}
		}
	}
	var options_count=0,
		menupagesel = menu_select[page]
	#region 按键设置
	{
		drawx=dx+480 drawy=dy+240
		var txtstruts=global.txt_menu[2].keyboards,
			itemvalue=array_create(array_length(txtstruts), 0);
		itemvalue[0]=global.direct_asdw;
		//小图标
		draw_sprite(spr_menu_option_icon_keygay, 1, drawx+192, drawy)
		draw_sprite(spr_menu_option_icon_keygay, 0, drawx+336, drawy)
		//选项
		for(var i=0;i<array_length(txtstruts);i++) {
			var value = txtstruts[i],
				selected = (i==menupagesel[0]-options_count),
				dtmpy=drawy+(i+1)*64;
			draw_option_item(drawx, dtmpy, value, menupagesel, selected, itemvalue[i]);
		}
		options_count+=array_length(txtstruts)
	}
	#endregion
	#region 指令设置
	{
		drawx=dx+1440 drawy=dy+240
		var txtstruts=global.txt_menu[2].orders,
			itemvalue=[global.sub_type, global.dash_order, global.alert_type];
		//选项
		for(var i=0;i<array_length(txtstruts);i++) {
			var value = txtstruts[i],
				selected = (i==menupagesel[0]-options_count),
				dtmpy=drawy+i*64;
			draw_option_item(drawx, dtmpy, value, menupagesel, selected, itemvalue[i]);
		}
		options_count+=array_length(txtstruts)
	}
	#endregion
	#region 显示设置
	{
		drawx=dx+1440 drawy=dy+496
		var txtstruts=global.txt_menu[2].displays,
			itemvalue=[global.full_screen, global.resolution, global.pix_filter, global.language];
		//选项
		for(var i=0;i<array_length(txtstruts);i++) {
			var value = txtstruts[i],
				selected = (i==menupagesel[0]-options_count),
				dtmpy=drawy+i*64;
			draw_option_item(drawx, dtmpy, value, menupagesel, selected, itemvalue[i]);
		}
		options_count+=array_length(txtstruts)
	}
	#endregion
	#region 音量设置
	{
		drawx=dx+1440 drawy=dy+816
		var txtstruts=global.txt_menu[2].volume,
			itemvalue=[global.volume_all, global.volume_se, global.volume_bgm];
		//选项
		for(var i=0;i<array_length(txtstruts);i++) {
			var value = txtstruts[i],
				selected = (i==menupagesel[0]-options_count),
				dtmpy=drawy+i*64;
			draw_option_item(drawx, dtmpy, value, menupagesel, selected, itemvalue[i]);
		}
		options_count+=array_length(txtstruts)
	}
	#endregion
	#region 保存取消
	{
		drawy=dy+1008
		var selected = false, 
			txtstruts=global.txt_menu[2].buttons;
			//flashaph = 0.5+0.5*sin(global.fps_curr*pi/60);
		//初始化
		drawx=dx+1712
		selected = (menupagesel[0]==options_count)
		draw_sprite(spr_menu_option_button, 0, drawx, drawy)
		if selected 
			draw_sprite_ext(spr_menu_option_button, 1, drawx, drawy, 1, 1, 0, c_white, 1)
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, txtstruts[0], drawx, drawy, 1, 1, -1, -1, -1, 0)
		//返回(仅在单独设置时显示)
		if global.menu==0 {
			drawx=dx+1376
			selected = (menupagesel[0]==options_count+1)
			draw_sprite(spr_menu_option_button, 0, drawx, drawy)
			if selected 
				draw_sprite_ext(spr_menu_option_button, 1, drawx, drawy, 1, 1, 0, c_white, 1)
			scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, txtstruts[1], drawx, drawy, 1, 1, -1, -1, -1, 0)
		}
	}
	#endregion
}