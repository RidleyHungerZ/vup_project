/// @desc 状态页操作按钮
function scr_menu_page_status_code() {
	var page=0,
		txtstruts=global.txt_menu[page].right,
		options=txtstruts.option;
	#region 选项目
	if menu_type==0 {
		if keystate_check_pressed(global.Up_state) {
			menu_select[page][0]-=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			menu_select[page][0]+=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.A_state) {
			//卡片
			if menu_select[page][0]==0 {
				if scr_player_change_trim() {
					menu_select[page][1]=global.model
					menu_type=0.1
					menutime=15
					scr_sound_play(se_menu_true)
				} else {
					scr_sound_play(se_menu_error)
				}
			}
			//副武器
			else if menu_select[page][0]==1 {
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
			else if menu_select[page][0]==2 {
				if ds_list_size(global.rtanklist)>0
				&& global.player_hp<global.player_hp_up {
					menu_select[page][1]=0
					menu_type=1
					scr_sound_play(se_menu_true)
				} else {
					scr_sound_play(se_menu_error)
				}
			}
			//逃逸
			else if menu_select[page][0]==3 {
					
			}
		}
		if menu_select[page][0]<0 
			menu_select[page][0]=array_length(options)-1
		else if menu_select[page][0]>=array_length(options) 
			menu_select[page][0]=0
	}
	#endregion
	else {
		#region 卡片
		if menu_select[page][0]==0 {
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
					menu_select[page][1]-=1
					menutime=10
					scr_sound_play(se_menu_select)
				} else if keystate_check_pressed(global.Right_state) {
					menu_select[page][1]+=1
					menutime=10
					scr_sound_play(se_menu_select)
				} else if keystate_check_pressed(global.A_state) {
					if scr_model_isget(menu_select[page][1]) {
						global.model=menu_select[page][1]
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
				if menu_select[page][1]<0 
					menu_select[page][1]=global.model_number-1
				else if menu_select[page][1]>=global.model_number
					menu_select[page][1]=0
			}
		}
		#endregion
		#region R罐
		if menu_select[page][0]==2 {
			if menu_type==1 {
				if keystate_check_pressed(global.Left_state) {
					menu_select[page][1]-=1
					//menutime=10
					scr_sound_play(se_menu_select)
				} else if keystate_check_pressed(global.Right_state) {
					menu_select[page][1]+=1
					//menutime=10
					scr_sound_play(se_menu_select)
				} else if keystate_check_pressed(global.A_state) {
					var inx=global.rtanklist[| menu_select[page][1]],
						val=global.rtank_val[inx];
					if(val>0) {
						menu_type=2
					} else scr_sound_play(se_menu_error)
				} else if keystate_check_pressed(global.B_state) {
					menu_type=0
					scr_sound_play(se_menu_cancle)
				}
				if menu_select[page][1]<0 
					menu_select[page][1]=ds_list_size(global.rtanklist)-1
				else if menu_select[page][1]>=ds_list_size(global.rtanklist)
					menu_select[page][1]=0
			}
			//开始补血
			else if menu_type==2 {
				if menutime==0 {
					var inx=global.rtanklist[| menu_select[page][1]];
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
		if menu_select[page][0]==3 {
			
		}
		#endregion
	}
}
/// @desc 技能页操作按钮
function scr_menu_page_item_code() {
	var page=1,
		txtstu=global.txt_menu[page],
		itstruts=txtstu.items,
		typecount=array_length(itstruts),
		itemlist=global.itemlist[menu_select[page][0]],
		itemcount=ds_list_size(itemlist),
		itemnow=itemlist[| menu_select[page][1]], //选中物品的id
		itemnowst;
	if !is_undefined(itemnow)
		itemnowst = itstruts[menu_select[page][0]].list[itemnow]
	//非技能页面变回第一个
	if menu_page==0 {
		menu_select[page][1]=0
		menu_item_list_begin=0 //列表最上项
		menu_item_list_end=menu_item_list_max-1 //列表最下项
	}
	if menu_type==0 {
		if keystate_check_pressed(global.Left_state) {
			menu_select[page][0]-=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Right_state) {
			menu_select[page][0]+=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.A_state) {
			if itemcount>0 {
				menu_type=1
				scr_sound_play(se_menu_true)
			} else  {
				scr_sound_play(se_menu_error)
			}
		}
		while menu_select[page][0]<0 
			menu_select[page][0]+=typecount
		while menu_select[page][0]>=typecount 
			menu_select[page][0]-=typecount
	}
	#region 选道具
	else if menu_type==1 {
		if keystate_check_pressed(global.Up_state) {
			menu_select[page][1]-=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			menu_select[page][1]+=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.B_state) {
			menu_type=0
			menu_select[page][1]=0
			scr_sound_play(se_menu_cancle)
		} else if keystate_check_pressed(global.A_state) {
			if menu_select[page][0]==ITEM.A {
				
			} else if menu_select[page][0]==ITEM.B {
				if global.item[ITEM.B][itemnow]==ITEMB_STATUS.open {
					global.item[ITEM.B][itemnow]=ITEMB_STATUS.close
					scr_sound_play(se_menu_true)
				} else {
					if menu_item_byte_sum>=global.item2_byte_max {
						scr_sound_play(se_menu_error)
					} else {
						//检测是否已装备排除装备
						var exclude=itemnowst.exclude,
							isExclude=false;
						for(var i=0;i<itemcount;i++) {
							var ilinx=itemlist[| i]
							if array_contains(ilinx, exclude) 
							&& scr_itemb_isopen(ilinx){
								scr_sound_play(se_menu_error)
								isExclude=true
								break
							}
						}
						if(!isExclude) {
							global.item[ITEM.B][itemnow]=ITEMB_STATUS.open
							scr_sound_play(se_menu_true)
						}
					}
				}
			} else if menu_select[page][0]==ITEM.C {
				
			}
		}
		while menu_select[page][1]<0 
			menu_select[page][1]+=itemcount
		while menu_select[page][1]>=itemcount 
			menu_select[page][1]-=itemcount
		//滚动条
		var scroll=scr_menu_scroll_set(menu_select[page][1], menu_item_list_begin, menu_item_list_end, menu_item_list_max);
		menu_item_list_begin=scroll[0];
		menu_item_list_end=scroll[1];
		menu_item_list_max=scroll[2];
	}
	#endregion
}
/// @desc 技能页操作按钮
function scr_menu_page_option_code() {
	var page=2;
	scr_menu_option_code()
}
/// @desc 技能页操作按钮
function scr_menu_page_mission_code() {
	var page=3,
		txtstu=global.txt_menu[page],
		misslist=global.mission_list[menu_select[page][0]],
		misscount=ds_list_size(misslist);
	//非技能页面变回第一个
	if menu_page==0 {
		menu_select[page][1]=0
		menu_miss_list_begin=0 //列表最上项
		menu_miss_list_end=menu_miss_list_max-1 //列表最下项
	}
	if menu_type==0 {
		if keystate_check_pressed(global.Left_state) {
			menu_select[page][0]-=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Right_state) {
			menu_select[page][0]+=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.A_state) {
			if misscount>0 {
				menu_type=1
				scr_sound_play(se_menu_true)
			} else  {
				scr_sound_play(se_menu_error)
			}
		}
		while menu_select[page][0]<0 
			menu_select[page][0]+=2
		while menu_select[page][0]>=2 
			menu_select[page][0]-=2
	}
	#region 选道具
	else if menu_type==1 {
		if keystate_check_pressed(global.Up_state) {
			menu_select[page][1]-=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			menu_select[page][1]+=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.B_state) {
			menu_type=0
			menu_select[page][1]=0
			scr_sound_play(se_menu_cancle)
		}
		while menu_select[page][1]<0 
			menu_select[page][1]+=misscount
		while menu_select[page][1]>=misscount 
			menu_select[page][1]-=misscount
		//滚动条
		var scroll=scr_menu_scroll_set(menu_select[page][1], menu_miss_list_begin, menu_miss_list_end, menu_miss_list_max);
		menu_miss_list_begin=scroll[0];
		menu_miss_list_end=scroll[1];
		menu_miss_list_max=scroll[2];
	}
	#endregion
}
/// @desc 技能页操作按钮
function scr_menu_page_skill_code() {
	var page=4,
		txtstu=global.txt_menu[page],
		skillcount=ds_list_size(menu_skill_list);
	//非技能页面变回第一个
	if menu_page!=page || menu_page_change!=0 {
		menu_select[page][0]=0
		menu_skill_list_begin=0 //列表最上项
		menu_skill_list_end=menu_skill_list_max-1 //列表最下项
	}
	//计算技能总数
	#region 选技能
	if menu_type==0 {
		if keystate_check_pressed(global.Up_state) {
			menu_select[page][0]-=1
			scr_sound_play(se_menu_select)
		} else if keystate_check_pressed(global.Down_state) {
			menu_select[page][0]+=1
			scr_sound_play(se_menu_select)
		}
		while menu_select[page][0]<0 
			menu_select[page][0]+=skillcount
		while menu_select[page][0]>=skillcount 
			menu_select[page][0]-=skillcount
		//滚动条
		var scroll=scr_menu_scroll_set(menu_select[page][0], menu_skill_list_begin, menu_skill_list_end, menu_skill_list_max);
		menu_skill_list_begin=scroll[0];
		menu_skill_list_end=scroll[1];
		menu_skill_list_max=scroll[2];
	}
	#endregion
}