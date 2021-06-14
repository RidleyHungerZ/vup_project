/// @desc 开启提示框
/// @arg txts[]
/// @arg inx*
function scr_tip_talk(txts, inx){
	if global.operate!=1
	|| global.player_operate!=1 
	|| global.alert_type!=1
		return;
	with obj_view {
		if is_undefined(inx) inx=0
		global.tip_talk_txt_list=txts
		tip_talk_index=inx
		global.tip_talk=0.5
		tip_talk_rate=0
		scr_sound_play(se_tip)
	}
}
function scr_tip_talk_end() {
	global.tip_talk=-0.5
}
/// @desc 对话是否进行中
function scr_tip_talk_ing() {
	return global.tip_talk!=0 
}
/// @desc 执行提示
function scr_tip_thread(area, inx) {
	if !scr_tip_thread_isover(area, inx) {
		global.thread_tip[area][inx]=1
		scr_tip_talk(global.txt_tips[area][inx], 0)
	}
}
/// @desc 小对话是否发生过
function scr_tip_thread_isover(area, inx) {
	return global.thread_tip[area][inx]!=0
}
/// @desc 可以发动小对话
function scr_tip_thread_can() {
	return scr_menu_trem()
		&& global.operate==1
		&& global.player_operate==1
}