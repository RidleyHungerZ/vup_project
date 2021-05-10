/// @desc 开启对话
/// @arg inx 对话框使用，0全用，1上2下
/// @arg now 当前开启对话框
function scr_talk_start(inx, now){
	global.talk=0.5
	global.talk_inx=inx
	global.talk_now=now
	global.talk_txt=array_create(2, "") //对话内容
	global.talk_txt_len=array_create(2, 0) //对话内容
	global.talk_print=array_create(2, "") //对话输出内容（打字机当前）
	global.talk_print_len=array_create(2, 0) //对话输出内容长度
	global.talk_shoto_type=array_create(2, 0) //头像类型
	global.talk_shoto=array_create(2, 0) //头像
	global.talk_name=array_create(2, 0) //名称
	global.talk_options=array_create(2, []) //对话中的选项
	global.talk_select=array_create(2, 0) //当前选中选项
}
/// @desc 开启对话
/// @arg num 对话框数量
function scr_talk_end(){
	global.talk=-0.5
}
/// @desc 开启对话
/// @arg now 当前对话
/// @arg txt 内容
/// @arg type 人物类型
/// @arg shoto 头像
/// @arg name 名字
/// @arg xscale 左右翻转
/// @arg options 选项
function scr_talk(now, txt, type, shoto, name, xscale, options){
	global.talk_now=now
	global.talk_inx_xscale=xscale
	global.talk_txt[now]=txt
	global.talk_txt_len[now]=string_length(txt)
	global.talk_print[now]=""
	global.talk_print_len[now]=0
	global.talk_shoto_type[now]=type
	global.talk_shoto[now]=shoto
	global.talk_name[now]=name
	global.talk_options[now]=options
	global.talk_select[now]=0
}
/// @desc 这句话是否输出完毕
function scr_talk_print_over() {
	var now=global.talk_now;
	if global.talk_print_len[now]<global.talk_txt_len[now] {
		return false
	} else {
		return true
	}
}
/// @desc 执行下一句话
function scr_talk_next() {
	return keystate_check_pressed(global.A_state)
	|| keystate_check_pressed(global.B_state)
	|| keystate_check_pressed(global.X_state)
	|| keystate_check_pressed(global.Y_state)
}
/// @desc 选项确认
function scr_talk_truekey() {
	return keystate_check_pressed(global.A_state)
}
/// @desc 选项取消
function scr_talk_canclekey() {
	return keystate_check_pressed(global.B_state)
}