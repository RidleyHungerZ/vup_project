/// @desc 绘制操作界面
function scr_menu_option_draw(dx, dy){
	var drawx=dx, drawy=dy, page=2
	//定义每个选项绘制方式
	if !is_method(draw_option_item) {
		draw_option_item = function(drx, dry, txtstruts, menupagesel, selected) {
			var text = txtstruts.text,
				option = txtstruts.option,
				option_type = option.type,
				option_list = option.list,
				variable_list = option.variable,
				selectin_neither = !selected && (menu_type>1), //未选中自己
				selectin = selected && (menu_type>1); //是否进入该选项
			var txtshifty=4;
			//底子
			draw_sprite(spr_menu_option_item, 0, drx, dry)
			//是否选中
			if selected {
				var alpha=1
				if menu_type!=1 alpha=0.5
				if option.type == menu_page2_option.line
					draw_sprite_ext(spr_menu_option_item, 2, drx, dry, 1, 1, 0, c_white, alpha)
				else draw_sprite_ext(spr_menu_option_item, 1, drx, dry, 1, 1, 0, c_white, alpha)
			}
			//名称
			scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0.5, text, drx-704, dry+txtshifty, 1, 1, -1, -1, -1, 0)
			//选项值
			var option_txt_color=c_white,
				flashaph = 0.5+0.5*sin(global.fps_curr*pi/15);
			if selectin option_txt_color=c_white
			switch option.type {
				case menu_page2_option.list:
					if selectin 
						draw_sprite_ext(spr_menu_option_item_selects, 1, drx+528, dry, 1, 1, 0, c_white, flashaph)
					else 
						draw_sprite(spr_menu_option_item_selects, 0, drx+528, dry)
					var value=variable_global_get(variable_list)
					//值仅有一个时，视作普通字符串显示，否则显示当前选中列表
					var txtval;
					if array_length(option_list)==1 txtval=option_list[0]
					else txtval=option_list[value]
					//绘制list文本
					txtval=string_replace_var(txtval)
					scr_draw_text_ext(option_txt_color, 1, 0, font_puhui_32, 0.5, 0.5, txtval, drx+528, dry+txtshifty, 1, 1, -1, -1, c_black, 1)
					break;
				case menu_page2_option.keypad:
					if selectin {
						var alpha1 = 1,
							alhpa2 = 1,
							inx1 = 5,
							inx2 = 6;
						//选中的黑闪烁，未选中的黑底，2级选中半透明
						if menu_type<2 flashaph=1
						if menu_type>=2 {
							if menu_type==2 flashaph=1
							if menupagesel[2]==0 {
								inx1 = 7
								alpha1 = flashaph 
								alhpa2 = 1
							}
							else {
								inx2 = 8
								alpha1 = 1
								alhpa2 = flashaph
							}
						}
						draw_sprite_ext(spr_menu_option_item_selects, inx1, drx+528, dry, 1, 1, 0, c_white, alpha1)
						draw_sprite_ext(spr_menu_option_item_selects, inx2, drx+528, dry, 1, 1, 0, c_white, alhpa2)
					}
					else {
						//未选中都是灰色
						draw_sprite(spr_menu_option_item_selects, 3, drx+528, dry)
						draw_sprite(spr_menu_option_item_selects, 4, drx+528, dry)
					}
					//绘制键盘，如果是字符串则视为变量，如果是数字则直接当做值
					var keyvarstr = variable_list[0]
					if is_real(keyvarstr)
					|| variable_global_exists(keyvarstr) {
						var keyval = undefined;
						if is_real(keyvarstr) {
							keyval=keyvarstr
						} else {
							keyval = variable_global_get(keyvarstr);
						}
						var keyinx = global.keyboard_spr_map[? keyval];
						if is_undefined(keyinx) 
							keyinx = global.keyboard_spr_map[? "undefined"];
						draw_sprite(spr_menu_option_keyboard, keyinx, drx+432, dry)
					}
					//绘制手柄，如果是字符串则视为变量，如果是数字则直接当做值
					var joyvarstr = variable_list[1]
					if is_real(joyvarstr)
					|| variable_global_exists(joyvarstr) {
						var joyval = undefined;
						if is_real(joyvarstr) {
							joyval=joyvarstr
						} else {
							joyval = variable_global_get(joyvarstr);
						}
						var joyinx = global.gaypad_spr_map[? joyval];
						if is_undefined(joyinx) 
							joyinx = global.gaypad_spr_map[? "undefined"];
						draw_sprite(spr_menu_option_gaypad, joyinx, drx+624, dry)
						
					}
					break;
				case menu_page2_option.line:
					//值
					var lineimx=40, minv=option_list[0], maxv=option_list[1],
						value=variable_global_get(variable_list)
					draw_sprite_ext(spr_menu_option_volume_line, 0, drx+392, dry, lineimx, 1, 0, c_white, 1)
					draw_sprite(spr_menu_option_volume_button, 0, drx+392+lineimx*16*(value-0.5), dry)
					break;
			}
		}
	}
	var options_count=0,
		menupagesel = menu_select[page];
	var txtstruts=global.txt_menu[2],
		tabcount=variable_struct_names_count(txtstruts), //页卡总数
		strutslist=[txtstruts.keyboards, txtstruts.orders, txtstruts.displays, txtstruts.volume], //页卡列表
		struts=strutslist[menupagesel[0]], //当前页卡配置项
		itemlist=struts.items, //配置项列表
		item_count=array_length(itemlist), //当前页卡配置项总数
		buttonlist=[txtstruts.button.init, txtstruts.button.back],
		button_count=array_length(buttonlist);
		
	//tab选项页
	drawx=dx+336 drawy=dy+288
	for(var i=0;i<array_length(strutslist);i++) {
		var selected = menupagesel[0]==i, 
			tabinx=1,
			txtselup=8;
		if selected tabinx=0
		else txtselup=0
		draw_sprite(spr_menu_option_tab, tabinx, drawx+224*i, drawy)
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, strutslist[i].name, drawx+224*i+8, drawy-16-txtselup, 1, 1, -1, -1, -1, 0)
	}
	//背景iframe
	draw_sprite(spr_menu_option_iframe, 0, dx+960, dy+288)
	//滚动条
	drawx=dx+1760 drawy=dy+320
	if item_count>menu_option_list_max {
		scr_draw_menu_scroll(drawx, drawy, 1, 40, menu_option_list_begin, menu_option_list_max, item_count+button_count)
	}
	//详细内容绘制
	drawx=dx+960 drawy=dy+352
	for(var i=menu_option_list_begin; i<min(menu_option_list_end+1, item_count+button_count); i++) {
		var selected = (menupagesel[1]==i) && menu_type>0;
		//项目
		if i<item_count {
			var item = itemlist[i];
			draw_option_item(drawx, drawy+(i-menu_option_list_begin)*64, item, menupagesel, selected);
		}
		//按钮
		else {
			var bi=i-array_length(itemlist),
				btnnow = buttonlist[bi];
			var btninx=0, txtshifty=4;;
			if selected btninx=1;
			draw_sprite(spr_menu_option_button, btninx, drawx-544, drawy+(i-menu_option_list_begin)*64)
			scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0.5, btnnow.text, drawx-704, drawy+(i-menu_option_list_begin)*64+txtshifty, 1, 1, -1, -1, -1, 0)
		}
	}
}