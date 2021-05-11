/// @desc 对话是否进行中
function scr_talk_ing() {
	return global.talk!=0 
}
/// @desc 开启对话
/// @arg inx 对话框使用，0全用，1上2下
/// @arg now 当前开启对话框
/// @arg xscale 左右翻转
function scr_talk_start(inx, now, xscale) {
	global.talk=0.5
	global.talk_inx=inx
	global.talk_now=now
	global.talk_inx_xscale=xscale
	obj_view.talk_init()
}
/// @desc 结束对话
function scr_talk_end(){
	global.talk=-0.5
}
/// @desc 开启对话
/// @arg now 当前对话
/// @arg txt 内容
/// @arg type 人物类型
/// @arg shoto 头像
/// @arg name 名字
/// @arg options 选项
function scr_talk(now, txt, type, shoto, name, options){
	global.talk_now=now
	global.talk_txt[now]=txt
	global.talk_txt_len[now]=string_length(txt)
	global.talk_print[now]=""
	global.talk_print_len[now]=0
	global.talk_shoto_type[now]=type
	global.talk_shoto[now]=shoto
	global.talk_name[now]=name
	global.talk_options[now]=options
	global.talk_select[now]=0
	obj_view.talk_select_begin[now]=0
	obj_view.talk_print_fast=false
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