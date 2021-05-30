#region 全屏转换
if global.full_screen==1 {
	window_set_fullscreen(true)
	global.resolution=1
} else {
	if window_size_change==0 {
		if last_resolution!=global.resolution {
			window_size_change=1
		}
		if last_full_screen!=global.full_screen {
			window_size_change=1
		}
	} else if window_size_change==1 {
		window_size_change=0
		window_center()
		window_set_fullscreen(false)
		window_set_size(ui.winsize[global.resolution].w, ui.winsize[global.resolution].h)
		window_set_caption(CAPTION);
	}
}
last_resolution=global.resolution
last_full_screen=global.full_screen
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
	if talk_rate<1 talk_rate+=0.05
	else {
		talk_rate=1
		global.talk=1
	}
} else if global.talk==-0.5 {
	if talk_rate>0 talk_rate-=0.05
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
		if talk_print_fast printspeed=4
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
			global.talk_select[now]--
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			global.talk_select[now]++
			scr_sound_play(se_menu_select)
		}
		var len=array_length(global.talk_options[now])
		while global.talk_select[now]<0 global.talk_select[now]+=len
		while global.talk_select[now]>=len global.talk_select[now]-=len
		if talk_select_begin[now]>global.talk_select[now]
			talk_select_begin[now]=global.talk_select[now]
		else if talk_select_begin[now]+1<global.talk_select[now]
			talk_select_begin[now]=global.talk_select[now]-1
	}
}
#endregion
#region 小提示
if scr_menu_trem() {
	if global.tip_talk==0.5 {
		if tip_talk_rate<0 tip_talk_rate+=0.05
		else {
			tip_talk_rate=1
			global.tip_talk=1
			global.tip_talk_txt=global.tip_talk_txt_list[tip_talk_index]
			global.tip_talk_txt_len=string_length(global.tip_talk_txt)
		}
	} else if global.tip_talk==-0.5 {
		if tip_talk_rate>0 tip_talk_rate-=0.05
		else {
			tip_talk_rate=0
			global.tip_talk=0
			tip_init()
		}
	} else if global.tip_talk==1 {
		if global.tip_talk_print_len<global.tip_talk_txt_len {
			var printspeed=0.25
			repeat max(1, printspeed) {
				//特殊标签处理
				var nextpart = string_delete(global.tip_talk_txt,1,floor(global.tip_talk_print_len))
				if string_startwith(nextpart, TXT_COL_PERFIX) {
					global.tip_talk_print_len+=string_pos(TXT_COL_SURFIX, nextpart)+1
				} else if string_startwith(nextpart, TXT_ICON_PERFIX) {
					global.tip_talk_print_len+=string_pos(TXT_ICON_SURFIX, nextpart)+1
				} else {
					global.tip_talk_print_len+=min(1, printspeed)
				}
				//快速跳过空格
				if frac(global.tip_talk_print_len)==0{
					while string_char_at(global.tip_talk_txt, global.tip_talk_print_len)==" " 
					&& global.tip_talk_print_len<global.tip_talk_txt_len
						global.tip_talk_print_len++
				}
				if global.tip_talk_print_len==global.tip_talk_txt_len break
			}
		} else {
			if tip_talk_time<tip_talk_time_up tip_talk_time++
			else {
				tip_talk_time=0
				tip_talk_index++
				if tip_talk_index<array_length(global.tip_talk_txt_list) {
					global.tip_talk_txt=global.tip_talk_txt_list[tip_talk_index]
					global.tip_talk_txt_len=string_length(global.tip_talk_txt)
					global.tip_talk_print_len=0
					global.tip_talk_print=""
				} else {
					scr_tip_talk_end()
				}
			}
		}
		//获得当前打印内容
		global.tip_talk_print=string_copy(global.tip_talk_txt, 1, floor(global.tip_talk_print_len))
		//非活动状态关闭
		if global.operate!=1
		|| global.player_operate!=1 {
			scr_tip_talk_end()
		}
	}
}
#endregion
#region 任务开始/结束
if mission_time>0 mission_time--
else mission_time=0
//任务开始
if mission_action==1 && mission_time==0 {
	instance_create_depth(0, 0, obj_view.depth-1, obj_ui_mission_start)
	mission_action=1.1
} else if mission_action==1.1 {
	if !instance_exists(obj_ui_mission_start) {
		mission_action=1.2
		mission_time=30
	}
} else if mission_action==1.2 && mission_time=0 {
	mission_action=0
	mission_time=0
	scr_mission_add(MISSION_TYPE.main, mission_index)
	scr_mission_set_status(MISSION_TYPE.main, mission_index, MISSION_STATIS.inProcess)
	scr_room_freedom()
}
//任务结束
if mission_action==2 && mission_time==0 {
	instance_create_depth(0, 0, obj_view.depth-1, obj_ui_mission_complete)
	mission_action=2.1
} else if mission_action==2.1 {
	if !instance_exists(obj_ui_mission_complete) {
		mission_action=2.2
		mission_time=30
	}
} else if mission_action==2.2 && mission_time=0 {
	mission_action=0
	mission_time=0
	scr_mission_add(MISSION_TYPE.main, mission_index)
	scr_mission_set_status(MISSION_TYPE.main, mission_index, MISSION_STATIS.complete)
	scr_room_freedom()
}
#endregion
#region 加载画面
if loading_time>0 loading_time--
else loading_time=0
if loading_action==1 {
	scr_view_transition(1, 0)
	loading_action=2
} else if loading_action==2 {
	if scr_view_transition_Isover(1) {
		loading_action=2.5
	}
} else if loading_action==2.5 {
	loading_index=loading_index_temp
	loading_rate=0
	loading_action=3
	loading_time=30
} else if loading_action==3 && loading_time==0 {
	loading_rate+=1
	if in(loading_rate, [30, 50, 80, 90]) {
		loading_time=30
	}
	if loading_rate>=100 {
		loading_rate=100
		loading_action=4
		loading_time=30
	}
} else if loading_action==4 && loading_time==0 {
	scr_view_transition(1, 0)
	loading_action=5
} else if loading_action==5 {
	if scr_view_transition_Isover(1) {
		loading_index=-1
		loading_action=0
	}
}
#endregion