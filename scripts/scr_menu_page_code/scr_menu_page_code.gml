/// @desc 状态页操作按钮
function scr_menu_page_status_code() {
	var txtstruts=global.txt_menu[0].right,
		options=txtstruts.option;
	#region 选项目
	if menu_type==0 {
		if keystate_check_pressed(global.Up_state) {
			menu_select[menu_page][0]-=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			menu_select[menu_page][0]+=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.A_state) {
			//卡片
			if menu_select[menu_page][0]==0 {
				if scr_player_change_trim() {
					menu_select[menu_page][1]=global.model
					menu_type=0.1
					menutime=15
					scr_sound_play(se_menu_true)
				} else {
					scr_sound_play(se_menu_error)
				}
			}
			//副武器
			else if menu_select[menu_page][0]==1 {
				if menutime==0 {
					if obj_staff.player_sub_unuse[global.model] {
						scr_sound_play(se_menu_error)
					} else {
						if global.main_sub_exchange[global.model]==0
							global.main_sub_exchange[global.model]=1
						else global.main_sub_exchange[global.model]=0
						menutime=10
						scr_sound_play(se_menu_true)
					}
				}
			}
			//R罐
			else if menu_select[menu_page][0]==2 {
				if ds_list_size(global.rtanklist)>0
				&& global.player_hp<global.player_hp_up {
					menu_select[menu_page][1]=0
					menu_type=1
					scr_sound_play(se_menu_true)
				} else {
					scr_sound_play(se_menu_error)
				}
			}
			//逃逸
			else if menu_select[menu_page][0]==3 {
					
			}
		}
		if menu_select[menu_page][0]<0 
			menu_select[menu_page][0]=array_length(options)-1
		else if menu_select[menu_page][0]>=array_length(options) 
			menu_select[menu_page][0]=0
	}
	#endregion
	else {
		#region 卡片
		if menu_select[menu_page][0]==0 {
			//展开
			if menu_type==0.1 {
				if menutime==0 menu_type=1
			} 
			//关闭
			else if menu_type==0.9 {
				if menutime==0 menu_type=0
			} 
			//选卡
			else if menu_type==1 {
				if keystate_check_pressed(global.Left_state) {
					menu_select[menu_page][1]-=1
					menutime=10
					scr_sound_play(se_menu_select)
				} else if keystate_check_pressed(global.Right_state) {
					menu_select[menu_page][1]+=1
					menutime=10
					scr_sound_play(se_menu_select)
				} else if keystate_check_pressed(global.A_state) {
					if scr_model_isget(menu_select[menu_page][1]) {
						global.model=menu_select[menu_page][1]
						if last_model==global.model
							obj_staff.player_change_atonce=false
						else 
							obj_staff.player_change_atonce=true
						menu_type=0.9
						menutime=15
						scr_sound_play(se_menu_true)
					} else {
						scr_sound_play(se_menu_error)
					}
				} else if keystate_check_pressed(global.B_state) {
					menu_type=0.9
					menutime=15
					scr_sound_play(se_menu_cancle)
				}
				if menu_select[menu_page][1]<0 
					menu_select[menu_page][1]=global.model_number-1
				else if menu_select[menu_page][1]>=global.model_number
					menu_select[menu_page][1]=0
			}
		}
		#endregion
		#region R罐
		if menu_select[menu_page][0]==2 {
			if menu_type==1 {
				if keystate_check_pressed(global.Left_state) {
					menu_select[menu_page][1]-=1
					//menutime=10
					scr_sound_play(se_menu_select)
				} else if keystate_check_pressed(global.Right_state) {
					menu_select[menu_page][1]+=1
					//menutime=10
					scr_sound_play(se_menu_select)
				} else if keystate_check_pressed(global.A_state) {
					var inx=global.rtanklist[| menu_select[menu_page][1]],
						val=global.rtank_val[inx];
					if(val>0) {
						menu_type=2
					} else scr_sound_play(se_menu_error)
				} else if keystate_check_pressed(global.B_state) {
					menu_type=0
					scr_sound_play(se_menu_cancle)
				}
				if menu_select[menu_page][1]<0 
					menu_select[menu_page][1]=ds_list_size(global.rtanklist)-1
				else if menu_select[menu_page][1]>=ds_list_size(global.rtanklist)
					menu_select[menu_page][1]=0
			}
			//开始补血
			else if menu_type==2 {
				if menutime==0 {
					var inx=global.rtanklist[| menu_select[menu_page][1]];
					if global.rtank_val[inx]>0 
					&& global.player_hp<global.player_hp_up {
						global.rtank_val[inx]--
						global.player_hp++
						scr_sound_play(se_item_rtank)
						menutime=2
					} else {
						menu_type=1
					}
				}
			}
		}
		#endregion
		#region 逃逸
		if menu_select[menu_page][0]==3 {
			
		}
		#endregion
	}
}