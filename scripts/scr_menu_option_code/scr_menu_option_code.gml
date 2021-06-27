/// @desc 操作界面操作逻辑
function scr_menu_option_code(){
	var page=2, 
		txtstruts=global.txt_menu[2],
		strutslist=[txtstruts.keyboards, txtstruts.orders, txtstruts.displays, txtstruts.volume], //页卡列表
		tabcount=array_length(strutslist), //页卡总数
		struts=strutslist[menu_select[page][0]], //当前页卡配置项
		itemlist = struts.items, //配置项列表
		item_count=array_length(itemlist), //当前页卡配置项总数
		buttonlist=[txtstruts.button.init, txtstruts.button.back],
		button_count=array_length(buttonlist);
	//当前选中项
	var option = itemlist[clamp(menu_select[page][1], 0, item_count-1)].option,
		type = option.type,
		list = option.list,
		varname = option.variable;
	#region 页卡切换
	if menu_type==0 {
		if keystate_check_pressed(global.A_state) {
			menu_type=1
			scr_sound_menu_play(se_menu_true)
			menu_select[page][1]=0
			menu_option_list_begin=0 //列表最上项
			menu_option_list_end=menu_option_list_max-1 //列表最下项
		} else if keystate_check_pressed(global.Left_state) {
			menu_select[page][0]--
			scr_sound_menu_play(se_menu_select)
		} else if keystate_check_pressed(global.Right_state) {
			menu_select[page][0]++
			scr_sound_menu_play(se_menu_select)
		}
		while menu_select[page][0]<0 
			menu_select[page][0]+=tabcount
		while menu_select[page][0]>=tabcount 
			menu_select[page][0]-=tabcount
	}
	#endregion
	#region 选项切换
	else if menu_type==1 {
		if keystate_check_pressed(global.A_state) {
			//配置项
			if menu_select[page][1]<item_count {
				menu_type=2
				menu_select[page][2]=0
				scr_sound_menu_play(se_menu_true)
			}
			//按钮
			else {
				var bi=menu_select[page][1]-item_count,
					btnnow = buttonlist[bi];
				//返回
				if btnnow.code==-1 {
					menu_type=0
					scr_sound_menu_play(se_menu_true)
					menu_select[page][1]=0
					menu_option_list_begin=0 //列表最上项
					menu_option_list_end=menu_option_list_max-1 //列表最下项
				}
				//初始化
				else if btnnow.code==0 {
					var initmap = global.option_init_map[menu_select[page][0]],
						mapkeys = ds_map_keys_to_array(initmap);
					for(var i=0;i<array_length(mapkeys);i++) {
						var key = mapkeys[i],
							val = initmap[? key];
						variable_global_set(key, val)
					}
					scr_sound_menu_play(se_menu_true)
				}
				//保存
				else if btnnow.code==1 {
					print btnnow.text
					scr_sound_menu_play(se_menu_true)
				}
			}
		} else if keystate_check_pressed(global.B_state) {
			menu_type=0
			scr_sound_menu_play(se_menu_cancle)
			scr_menu_option_ini_save(menu_select[page][0]) //保存ini
			menu_select[page][1]=0
			menu_option_list_begin=0 //列表最上项
			menu_option_list_end=menu_option_list_max-1 //列表最下项
		} else if keystate_check_pressed(global.Up_state) {
			menu_select[page][1]--
			scr_sound_menu_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			menu_select[page][1]++
			scr_sound_menu_play(se_menu_select)
		}
		if menu_select[page][1]<0 
			menu_select[page][1]=item_count+1
		else if menu_select[page][1]>item_count+1
			menu_select[page][1]=0
		//滚动条
		var scroll=scr_menu_scroll_set(menu_select[page][1], menu_option_list_begin, menu_option_list_end, menu_option_list_max);
		menu_option_list_begin=scroll[0];
		menu_option_list_end=scroll[1];
		menu_option_list_max=scroll[2];
	}
	#endregion
	#region 选项选值
	else if menu_type==2 {
		var single_true=false
		//选项列表
		if type == menu_page2_option.list {
			if variable_global_exists(varname) {
				var val=variable_global_get(varname);
				if keystate_check_pressed(global.Left_state) {
					val--
					scr_sound_menu_play(se_menu_select)
				}
				else if keystate_check_pressed(global.Right_state) {
					val++
					scr_sound_menu_play(se_menu_select)
				}
				while val>=array_length(list) val-=array_length(list)
				while val<0 val+=array_length(list)
				variable_global_set(varname, val)
				option.onChange();
			}
		} 
		//键盘手柄
		else if type == menu_page2_option.keypad {
			if keystate_check_pressed(global.Left_state) {
				menu_select[page][2]--
				scr_sound_menu_play(se_menu_select)
			}
			else if keystate_check_pressed(global.Right_state) {
				menu_select[page][2]++
				scr_sound_menu_play(se_menu_select)
			}
			while menu_select[page][2]>=array_length(varname) menu_select[page][2]-=array_length(varname)
			while menu_select[page][2]<0 menu_select[page][2]+=array_length(varname)
			//确认
			if keystate_check_pressed(global.A_state) {
				single_true=true
				menu_type=3
				menu_exit_time=5*60
				scr_sound_menu_play(se_menu_true)
			}
		} 
		//线性变量
		else if type == menu_page2_option.line {
			var minv=list[0], maxv=list[1]
			if variable_global_exists(varname) {
				var val=variable_global_get(varname);
				if keystate_check(global.Left_state) 
					val-=(maxv-minv)*0.02
				else if keystate_check(global.Right_state) 
					val+=(maxv-minv)*0.02
				val=clamp(val, minv, maxv)
				variable_global_set(varname, val)
				option.onChange();
			}
		}
		if !single_true {
			if keystate_check_pressed(global.B_state) {
				menu_type=1
				menu_select[page][2]=0
				scr_sound_menu_play(se_menu_cancle)
			} else if keystate_check_pressed(global.A_state) {
				menu_type=1
				menu_select[page][2]=0
				scr_sound_menu_play(se_menu_true)
			}
		}
	}
	#endregion
	#region 按键选择
	else if menu_type==3 {
		//键盘手柄
		if type == menu_page2_option.keypad {
			var keyjoy=menu_select[page][2],
				varstr=varname[keyjoy];
			//能设置按键
			if is_string(varstr)
			&& variable_global_exists(varstr) {
				//键盘
				if keyjoy==0 {
					var anykey=keyboard_key;
					if anykey!=0 
					&& (!keyboard_check(anykey) || keyboard_check_pressed(anykey)){
						scr_keyboard_set_replace(varstr, anykey)
						variable_global_set(varstr, anykey)
						option.onChange();
						menu_type=2
						scr_sound_menu_play(se_menu_true)
					}
				}
				//手柄
				else if keyjoy==1 {
					//失效退出
					if !gaypad_exists() {
						menu_type=2
						scr_sound_menu_play(se_menu_error)
					}
					var anyjoy = gaypad_get_anykey();
					if anyjoy>=0 {
						variable_global_set(varstr, anyjoy)
						option.onChange();
						menu_type=2
						scr_sound_menu_play(se_menu_true)
					}
				}
			} 
			//不能设置的自动退出
			else {
				menu_type=2
				scr_sound_menu_play(se_menu_error)
			}
			//时间到了自动退出
			if menu_exit_time==0 {
				menu_type=2
				scr_sound_menu_play(se_menu_cancle)
			}
		}
	}
	#endregion
}
/// @desc 保存ini配置内容
/// @arg 类型，按option分页算
function scr_menu_option_ini_save(type) {
	ini_open(FILE_CONFIG)
	#region 按键
	if type==0 {
		ini_write_real("key", "left",	global.left_key)
		ini_write_real("key", "right",	global.right_key)
		ini_write_real("key", "up",		global.up_key)
		ini_write_real("key", "down",	global.down_key)
		ini_write_real("key", "select",	global.select_key)
		ini_write_real("key", "start",	global.start_key)

		ini_write_real("key", "A", global.A_key)
		ini_write_real("key", "B", global.B_key)
		ini_write_real("key", "L", global.L_key)
		ini_write_real("key", "R", global.R_key)
		ini_write_real("key", "X", global.X_key)
		ini_write_real("key", "Y", global.Y_key)

		ini_write_real("key", "jump",	global.jump_key)
		ini_write_real("key", "att",	global.att_key)
		ini_write_real("key", "dash",	global.dash_key)
		ini_write_real("key", "sub",	global.sub_key)
		ini_write_real("key", "trans",	global.trans_key)
		ini_write_real("key", "true",	global.true_key)
		ini_write_real("key", "tformL",	global.tformL_key)
		ini_write_real("key", "tformR",	global.tformR_key)

		ini_write_real("joy", "jump",	global.jump_joy)
		ini_write_real("joy", "true",	global.true_joy)
		ini_write_real("joy", "att",	global.att_joy)
		ini_write_real("joy", "trans",	global.trans_joy)
		ini_write_real("joy", "dash",	global.dash_joy)
		ini_write_real("joy", "sub",	global.sub_joy)
		ini_write_real("joy", "tformL",	global.tformL_joy)
		ini_write_real("joy", "tformR",	global.tformR_joy)
	}
	#endregion
	#region 指令
	else if type==1 {
		ini_write_real("order", "joy_ab_invert",	global.joy_ab_invert) //ab倒置
		ini_write_real("order", "sub_type",			global.sub_type)//0双键，1双按，2切换
		ini_write_real("order", "dash_order",	global.dash_order)//冲刺指令
		ini_write_real("order", "alert_type",	global.alert_type)//系统提示
	}
	#endregion
	#region 显示
	else if type==2 {
		ini_write_real("display", "full_screen",	global.full_screen)
		ini_write_real("display", "resolution",	global.resolution)
		ini_write_real("display", "pix_filter",	global.pix_filter)
		ini_write_real("display", "language",	global.language)
		ini_write_real("display", "gamekey_display",	global.gamekey_display)
		ini_write_real("display", "unskill_anima",	global.unskill_anima)
	}
	#endregion
	#region 音量
	else if type==3 {
		ini_write_real("volume", "se",	global.volume_se)
		ini_write_real("volume", "bgm",	global.volume_bgm)
		ini_write_real("volume", "all",	global.volume_all)
	}
	#endregion
	ini_close()
}