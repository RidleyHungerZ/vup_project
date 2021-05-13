/// @desc 开启提示框
/// @arg txts[]
/// @arg inx*
function scr_tip_talk(txts, inx){
	if global.operate!=1
	|| global.player_operate!=1 
		return;
	with obj_view {
		if is_undefined(inx) inx=0
		global.tip_talk_txt_list=txts
		tip_talk_index=inx
		global.tip_talk=0.5
		tip_talk_rate=0
	}
}
function scr_tip_talk_end() {
	global.tip_talk=-0.5
}
/// @desc 对话是否进行中
function scr_tip_talk_ing() {
	return global.tip_talk!=0 
}