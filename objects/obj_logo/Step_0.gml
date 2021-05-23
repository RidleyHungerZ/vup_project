scr_time_alarm()
var options=global.txt_logo[select_type];
for(var i=0;i<select_type-1;i++) {
	options=options[select[i]]
}
var optioncount=array_length(options)
#region 按下任意键
if select_type==0 {
	if action==0 {
		if anykey_check() {
			scr_sound_play(se_logo_true)
			action=0.5
			time=30
		}
	} else if action==0.5 && time==0 {
		action=1
		select_type=1
		select[select_type]=0
	}
}
#endregion
#region 基础选项
else if select_type==1 {
	if action==1 {
		if keystate_check_pressed(global.A_state) {
			action=1.1
			time=30
			scr_sound_play(se_logo_true)
		} else if keystate_check_pressed(global.Up_state) {
			select[select_type]--
			time=10
			scr_sound_play(se_logo_select)
		} else if keystate_check_pressed(global.Down_state) {
			select[select_type]++
			time=10
			scr_sound_play(se_logo_select)
		}
		while select[select_type]<0 select[select_type]+=optioncount
		while select[select_type]>=optioncount select[select_type]-=optioncount
	} 
	//缓动动画
	else if action==1.1 && time==0 {
		if select[select_type]==0 {
			action=2
			select_type=2
			select[select_type]=0
		} else if select[select_type]==1 {
			action=1.2
			scr_view_transition(1, 0)
		} else if select[select_type]==2 {
			action=1.3
			scr_view_transition(1, 0)
		}
	}
	//读档
	else if action==1.2 {
		if scr_view_transition_Isover(1) {
			scr_room_goto(room_test)
			testmode()
		}
	}
	//设置
	else if action==1.3 {
		if scr_view_transition_Isover(1) {
			operate_setting_display=true
			action=1.31
		}
	}
	// 设置中
	else if action==1.31 {
		with obj_menu {
			if menu_type==0 
			&& keystate_check_pressed(global.B_state) {
				scr_sound_menu_play(se_menu_cancle)
				scr_view_transition(1, 0)
				menu_select[2][0]=0
				other.action=1.32
			} else scr_menu_option_code()
		}
	}
	//退出设置
	else if action==1.32 {
		if scr_view_transition_Isover(1) {
			operate_setting_display=false
			action=1
		}
	}
}
#endregion
#region 进阶选项
else if select_type==2 {
	//难度选择
	if action==2 {
		//难度选择
		if select[1]==0 {
			if keystate_check_pressed(global.A_state) {
				action=2.1
				time=30
				scr_sound_play(se_logo_true)
			} else if keystate_check_pressed(global.B_state) {
				select_type=1
				action=1
				time=10
				scr_sound_play(se_logo_cancle)
			} else if keystate_check_pressed(global.Up_state) {
				select[select_type]--
				time=10
				scr_sound_play(se_logo_select)
			} else if keystate_check_pressed(global.Down_state) {
				select[select_type]++
				time=10
				scr_sound_play(se_logo_select)
			}
			while select[select_type]<0 select[select_type]+=optioncount
			while select[select_type]>=optioncount select[select_type]-=optioncount
		} 
	}
	//缓动动画
	else if action==2.1 && time==0 {
		scr_view_transition(1, 0)
		action=2.2
	}
	//黑屏结束
	else if action==2.2 {
		if scr_view_transition_Isover(1) {
			global.game_start=1
			data_save_variable_single()
			global.mode=select[select_type]
			scr_room_goto(room_start)
		}
	}
}
#endregion