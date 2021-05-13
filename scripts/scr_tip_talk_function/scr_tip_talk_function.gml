/// @desc 开启提示框
/// @arg txts[]
/// @arg inx*
function scr_tip_talk(txts, inx){
	with obj_view {
		if is_undefined(inx) inx=0
		global.tip_talk_txt_list=txts
		tip_talk_index=inx
		global.tip_talk=0.5
	}
}
function scr_tip_talk_end() {
	global.tip_talk=-0.5
}