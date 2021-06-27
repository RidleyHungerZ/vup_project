if view_current!=1 exit
#region 菜单页面
if global.menu=0.6 || global.menu=1 || global.menu=-0.5 {
	draw_sprite(spr_menu_bgs, 0, 0, 0)
	//切页
	var drawfuns = [
		scr_draw_menu_status,
		scr_draw_menu_item,
		scr_draw_menu_option,
		scr_draw_menu_mission,
		scr_draw_menu_skill
	],
		preinx = menu_page-1,
		nextinx = menu_page+1;
	if preinx<0 preinx=menu_page_count-1
	if nextinx>=menu_page_count nextinx=0
	var funnow = drawfuns[menu_page],
		funpre = drawfuns[preinx],
		funnext = drawfuns[nextinx];
	if menu_page_change==0 {
		funnow(0, 0)
	} else if menu_page_change==1 {
		funnow(VIEW_W_UI*(-1+menu_page_change_rate), 0)
		funnext(VIEW_W_UI*(0+menu_page_change_rate), 0)
	} else if menu_page_change==-1 {
		funnow(VIEW_W_UI*(1+menu_page_change_rate), 0)
		funpre(VIEW_W_UI*(0+menu_page_change_rate), 0)
	}
}
#endregion
#region 菜单光暗
if menu_open_action!=0
	scr_draw_rectangle_view(c_black, menu_open_rate ,view_current)
#endregion
#region 屏幕光暗
if global.player_change_flash!=0
	scr_draw_rectangle_view(c_white,global.player_change_flash_rate,view_current)
if global.room_change>=1 && global.room_change<=2 {
	scr_draw_rectangle_view(c_black,global.room_change_rate[1],view_current)
}
if global.room_change>=3 && global.room_change<=4 {
	scr_draw_rectangle_view(c_white,global.room_change_rate[2],view_current)
}
#endregion
#region 按键显示
if global.gamekey_display==1 {
	var txts=global.txt_view_gamekey, 
		txtsuts=noone;
	//菜单按键
	if global.menu=0.6 || global.menu=1 || global.menu=-0.5 {
		txtsuts=txts.menu
	}
	//其他菜单
	else if scr_talk_ing() 
	|| room==room_logo {
		txtsuts=txts.otherMenu
	}
	//场景按键
	else if global.operate==1 
	&& global.player_operate==1 {
		txtsuts=txts.stage
	}
	if is_array(txtsuts) {
		draw_sprite_ext(spr_ui_grd_gamekey_bgs, 0, 0, VIEW_H_UI, VIEW_W_UI/16, 1, 0, c_white, 0.65)
		var keycount=array_length(txtsuts),
			gkspr=spr_menu_option_keyboard,
			joypad=os_type_is(OS.HOST) || gaypad_exists();
		if joypad {
			gkspr=spr_menu_option_gaypad;
		}
		var keydx=100,
			keydy=1056,
			txtdx=32,
			txtsc=0.5;
		for(var i=0;i<keycount;i++) {
			if !txtsuts[i].display() continue;
			var txtsut=txtsuts[i],
				valname=txtsut.key,
				val=variable_global_get(valname),
				keycheck = keyboard_check(val),
				keyinx = global.keyboard_spr_map[? val],
				kblend = c_white,
				stroke = -1;
			if joypad {
				valname=txtsut.joy();
				if is_undefined(valname) continue;
				else if is_real(valname) {
					val=valname
				} else if is_string(valname) {
					val=variable_global_get(valname);
				}
				keycheck = gamepad_button_check(global.joy, val);
				keyinx = global.gaypad_spr_map[? val];
			}
			if keycheck {
				kblend=UIPINK
				stroke=UIPINK
			}
			draw_sprite_ext(gkspr, keyinx, keydx, keydy, 1, 1, 0, kblend, 1)
			scr_draw_text_ext(kblend, 1, 0, font_puhui_32, 0, 0.5, txtsut.txt, keydx+txtdx, keydy, txtsc, txtsc, -1, -1, stroke, 1)
			draw_set_font(font_puhui_32)
			var strw=string_width(txtsut.txt)
			keydx+=txtdx+strw*txtsc+64
		}
	}
}
#endregion