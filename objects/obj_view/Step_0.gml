#region 全屏转换
if global.full_screen==1 {
	window_set_fullscreen(true)
	global.resolution=1
} else {
	window_set_fullscreen(false)
	window_set_size(ui.winsize[global.resolution].w, ui.winsize[global.resolution].h)
	window_set_caption(CAPTION);
	if window_size_change==0 {
		if last_resolution!=global.full_screen {
			window_size_change=1
			last_resolution=global.full_screen
		}
		if last_full_screen!=global.resolution {
			window_size_change=1
			last_full_screen=global.resolution
		}
	} else if window_size_change==1 {
		window_center()
		window_size_change=0
	}
}
#endregion
#region 小房间判断
scr_viewroom_inroom()
#endregion
#region 恢复操作驾驶舱缓动
if global.operate==1 
&& global.player_operate==1
&& global.talk==0 {
	if operate_rate<1 operate_rate+=0.1
	else operate_rate=1
} else {
	if operate_rate>0 operate_rate-=0.1
	else operate_rate=0
}
#endregion
#region 对话框
if global.talk==0.5 {
	if talk_rate<1 talk_rate+=0.1
	else {
		talk_rate=1
		global.talk=1
	}
} else if global.talk==-0.5 {
	if talk_rate>0 talk_rate-=0.1
	else {
		talk_rate=0
		global.talk=0
		talk_init()
	}
} else if global.talk==1 {
	var now=global.talk_now;
	//下一句
	if !scr_talk_print_over() 
	&& scr_talk_next() 
	&& global.talk_print_len[now]>0 
	&& !talk_print_fast {
		//global.talk_print_len[now]=global.talk_txt_len[now]
		talk_print_fast=true
	}
	if global.talk_print_len[now]<global.talk_txt_len[now] {
		var printspeed=0.25
		if talk_print_fast printspeed=10
		repeat max(1, printspeed) {
			//特殊标签处理
			var nextpart = string_delete(global.talk_txt[now],1,floor(global.talk_print_len[now]))
			if string_startwith(nextpart, TXT_COL_PERFIX) {
				global.talk_print_len[now]+=string_pos(TXT_COL_SURFIX, nextpart)+1
			} else if string_startwith(nextpart, TXT_ICON_PERFIX) {
				global.talk_print_len[now]+=string_pos(TXT_ICON_SURFIX, nextpart)+1
			} else {
				global.talk_print_len[now]+=min(1, printspeed)
			}
			//快速跳过空格
			if frac(global.talk_print_len[now])==0{
				while string_char_at(global.talk_txt[now], global.talk_print_len[now])==" " 
				&& global.talk_print_len[now]<global.talk_txt_len[now]
					global.talk_print_len[now]++
			}
			if global.talk_print_len[now]==global.talk_txt_len[now] break
		}
	}
	//获得当前打印内容
	global.talk_print[now]=string_copy(global.talk_txt[now], 1, floor(global.talk_print_len[now]))
	//选项
	if scr_talk_print_over() 
	&& array_length(global.talk_options[now])>0 {
		if keystate_check_pressed(global.Up_state) {
			global.talk_select--
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			global.talk_select++
			scr_sound_play(se_menu_select)
		}
		var len=array_length(global.talk_options)
		while global.talk_select<0 global.talk_select+=len
		while global.talk_select>=len global.talk_select-=len
		if talk_select_begin>global.talk_select
			talk_select_begin=global.talk_select
		else if talk_select_begin+1<global.talk_select
			talk_select_begin=global.talk_select-1
	}
}
#endregion