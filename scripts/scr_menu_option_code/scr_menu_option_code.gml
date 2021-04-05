/// @desc 操作界面操作逻辑
function scr_menu_option_code(){
	var page=2, 
		mselect=menu_select[page][menu_type],
		txtstruts=global.txt_menu[2],
		txt_keyboards=txtstruts.keyboards,
		txt_orders=txtstruts.orders,
		txt_displays=txtstruts.displays,
		txt_volume=txtstruts.volume,
		txt_buttons=txtstruts.buttons,
		item_count=array_length(txt_keyboards)+array_length(txt_orders)+array_length(txt_displays)+array_length(txt_volume)+array_length(txt_buttons);
	if global.menu!=0 item_count--;
	#region 选项切换
	if menu_type==0 {
		if keystate_check_pressed(global.Up_state) {
			mselect--
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			mselect++
			scr_sound_play(se_menu_select)
		}
		if mselect<0 
			mselect=item_count-1
		else if mselect>=item_count 
			mselect=0
	}
	#endregion
	#region 选项选值
	else if menu_type==1 {
		
	}
	#endregion
	#region 选项选值2
	else if menu_type==2 {
		
	}
	#endregion
	menu_select[page][menu_type]=mselect
}