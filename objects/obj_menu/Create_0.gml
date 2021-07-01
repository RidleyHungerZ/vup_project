event_inherited()
global.menu=0
#region 菜单操作变量
time=0
menu_time=0 //不受暂停影响计时
menu_open_action=0 //开启菜单动作
menu_open_rate=0 //开启菜单黑屏
menu_page=0 //菜单当前页
menu_page_count=5 //菜单页数
menu_type=0 //菜单进度
menu_page_change=0 //页切换
menu_page_change_rate=0 //页切换进度
for(var page=0;page<=20;page+=1) {
	for(var type=0;type<=5;type+=1) {
		menu_select[page][type]=0
		menu_curr[type]=0
	}
}

menu_exit_time=0 //自动退出计时
//道具页面list
menu_item_operate=0 //道具操作类型
menu_item_operate_var=0 //操作数值
menu_item_operate_temp=0 //临时变量，如记录R罐编号
menu_item_list_max=10 //列表显示最大数量
menu_item_list_begin=0 //列表最上项
menu_item_list_end=menu_item_list_max-1 //列表最下项
menu_item_byte_sum=0
//设置页面list
menu_option_list_max=10 //列表显示最大数量
menu_option_list_begin=0 //列表最上项
menu_option_list_end=menu_option_list_max-1 //列表最下项
//任务页面list
menu_miss_list_max=10 //列表显示最大数量
menu_miss_list_begin=0 //列表最上项
menu_miss_list_end=menu_miss_list_max-1 //列表最下项
//技能页面list
menu_skill_list_max=10 //列表显示最大数量
menu_skill_list_begin=0 //列表最上项
menu_skill_list_end=menu_skill_list_max-1 //列表最下项
menu_skill_list=ds_list_create()
#endregion
draw_option_item=noone //设置页面绘制选项内容
last_model=0 //开启彩蛋时的卡片
return_title_stop=false //返回标题画面时关闭暂停
#region 键盘sprite
{
	var inx=0
	global.keyboard_spr_map=ds_map_create()
	global.keyboard_spr_map[? "undefined"] = inx++;
	global.keyboard_spr_map[? ord("0")] = inx++;
	global.keyboard_spr_map[? ord("1")] = inx++;
	global.keyboard_spr_map[? ord("2")] = inx++;
	global.keyboard_spr_map[? ord("3")] = inx++;
	global.keyboard_spr_map[? ord("4")] = inx++;
	global.keyboard_spr_map[? ord("5")] = inx++;
	global.keyboard_spr_map[? ord("6")] = inx++;
	global.keyboard_spr_map[? ord("7")] = inx++;
	global.keyboard_spr_map[? ord("8")] = inx++;
	global.keyboard_spr_map[? ord("9")] = inx++;
	global.keyboard_spr_map[? ord("A")] = inx++;
	global.keyboard_spr_map[? ord("B")] = inx++;
	global.keyboard_spr_map[? ord("C")] = inx++;
	global.keyboard_spr_map[? ord("D")] = inx++;
	global.keyboard_spr_map[? ord("E")] = inx++;
	global.keyboard_spr_map[? ord("F")] = inx++;
	global.keyboard_spr_map[? ord("G")] = inx++;
	global.keyboard_spr_map[? ord("H")] = inx++;
	global.keyboard_spr_map[? ord("I")] = inx++;
	global.keyboard_spr_map[? ord("J")] = inx++;
	global.keyboard_spr_map[? ord("K")] = inx++;
	global.keyboard_spr_map[? ord("L")] = inx++;
	global.keyboard_spr_map[? ord("M")] = inx++;
	global.keyboard_spr_map[? ord("N")] = inx++;
	global.keyboard_spr_map[? ord("O")] = inx++;
	global.keyboard_spr_map[? ord("P")] = inx++;
	global.keyboard_spr_map[? ord("Q")] = inx++;
	global.keyboard_spr_map[? ord("R")] = inx++;
	global.keyboard_spr_map[? ord("S")] = inx++;
	global.keyboard_spr_map[? ord("T")] = inx++;
	global.keyboard_spr_map[? ord("U")] = inx++;
	global.keyboard_spr_map[? ord("V")] = inx++;
	global.keyboard_spr_map[? ord("W")] = inx++;
	global.keyboard_spr_map[? ord("X")] = inx++;
	global.keyboard_spr_map[? ord("Y")] = inx++;
	global.keyboard_spr_map[? ord("Z")] = inx++;
	global.keyboard_spr_map[? 192] = inx++;
	global.keyboard_spr_map[? 189] = inx++;
	global.keyboard_spr_map[? 187] = inx++;
	global.keyboard_spr_map[? 221] = inx++;
	global.keyboard_spr_map[? 219] = inx++;
	global.keyboard_spr_map[? 220] = inx++;
	global.keyboard_spr_map[? 186] = inx++;
	global.keyboard_spr_map[? 222] = inx++;
	global.keyboard_spr_map[? 188] = inx++;
	global.keyboard_spr_map[? 190] = inx++;
	global.keyboard_spr_map[? 191] = inx++;
	global.keyboard_spr_map[? vk_right]	= inx++;
	global.keyboard_spr_map[? vk_down]		= inx++;
	global.keyboard_spr_map[? vk_left]	= inx++;
	global.keyboard_spr_map[? vk_up]	= inx++;
	global.keyboard_spr_map[? vk_f1]	= inx++;
	global.keyboard_spr_map[? vk_f2]	= inx++;
	global.keyboard_spr_map[? vk_f3]	= inx++;
	global.keyboard_spr_map[? vk_f4]	= inx++;
	global.keyboard_spr_map[? vk_f5]	= inx++;
	global.keyboard_spr_map[? vk_f6]	= inx++;
	global.keyboard_spr_map[? vk_f7]	= inx++;
	global.keyboard_spr_map[? vk_f8]	= inx++;
	global.keyboard_spr_map[? vk_f9]	= inx++;
	global.keyboard_spr_map[? vk_f10]	= inx++;
	global.keyboard_spr_map[? vk_f11]	= inx++;
	global.keyboard_spr_map[? vk_f12]	= inx++;
	global.keyboard_spr_map[? vk_escape]	= inx++;
	global.keyboard_spr_map[? vk_end]	= inx++;
	global.keyboard_spr_map[? vk_delete]	= inx++;
	global.keyboard_spr_map[? vk_home]	= inx++;
	global.keyboard_spr_map[? vk_insert]	= inx++;
	global.keyboard_spr_map[? vk_pageup]	= inx++;
	global.keyboard_spr_map[? vk_pagedown]	= inx++;
	global.keyboard_spr_map[? vk_printscreen]	= inx++;
	global.keyboard_spr_map[? vk_alt]	= inx++;
	global.keyboard_spr_map[? vk_backspace]	= inx++;
	global.keyboard_spr_map[? vk_control]	= inx++;
	global.keyboard_spr_map[? vk_enter]	= inx++;
	global.keyboard_spr_map[? vk_shift]	= inx++;
	global.keyboard_spr_map[? vk_space]	= inx++;
	global.keyboard_spr_map[? vk_tab]	= inx++;
	global.keyboard_spr_map[? vk_numpad0]	= inx++;
	global.keyboard_spr_map[? vk_numpad1]	= inx++;
	global.keyboard_spr_map[? vk_numpad2]	= inx++;
	global.keyboard_spr_map[? vk_numpad3]	= inx++;
	global.keyboard_spr_map[? vk_numpad4]	= inx++;
	global.keyboard_spr_map[? vk_numpad5]	= inx++;
	global.keyboard_spr_map[? vk_numpad6]	= inx++;
	global.keyboard_spr_map[? vk_numpad7]	= inx++;
	global.keyboard_spr_map[? vk_numpad8]	= inx++;
	global.keyboard_spr_map[? vk_numpad9]	= inx++;
	global.keyboard_spr_map[? vk_add]	= inx++;
	global.keyboard_spr_map[? vk_subtract]	= inx++;
	global.keyboard_spr_map[? vk_multiply]	= inx++;
	global.keyboard_spr_map[? vk_divide]	= inx++;
	global.keyboard_spr_map[? vk_decimal]	= inx++;
}
#endregion
#region 手柄sprite
{
	var inx=0
	global.gaypad_spr_map=ds_map_create()
	global.gaypad_spr_map[? "undefined"] = inx++;
	global.gaypad_spr_map[? "direct"] = inx++;
	global.gaypad_spr_map[? gp_padr] = inx++;
	global.gaypad_spr_map[? gp_padd] = inx++;
	global.gaypad_spr_map[? gp_padl] = inx++;
	global.gaypad_spr_map[? gp_padu] = inx++;
	global.gaypad_spr_map[? gp_a] = inx++;
	global.gaypad_spr_map[? gp_b] = inx++;
	global.gaypad_spr_map[? gp_x] = inx++;
	global.gaypad_spr_map[? gp_y] = inx++;
	global.gaypad_spr_map[? "gp_stickl"] = inx++;
	global.gaypad_spr_map[? "gp_stickr"] = inx++;
	global.gaypad_spr_map[? gp_stickl] = inx++;
	global.gaypad_spr_map[? gp_stickr] = inx++;
	global.gaypad_spr_map[? gp_l] = inx++;
	global.gaypad_spr_map[? gp_r] = inx++;
	global.gaypad_spr_map[? gp_zl] = inx++;
	global.gaypad_spr_map[? gp_zr] = inx++;
	global.gaypad_spr_map[? gp_start] = inx++;
	global.gaypad_spr_map[? gp_select] = inx++;
}
#endregion