/// @desc 显示大招动画
/// @arg index 大招序号
/// @arg endstop 结束时是否继续游戏
function scr_unskill_display(index, endstop){
	obj_view.unskill_index=index
	obj_view.unskill_endstop=endstop
	obj_view.unskill_action=1
}
/// @desc 是否还在大招动画中
function scr_unskill_isplay() {
	return obj_view.unskill_action!=0
}
/// @desc 显示BOSS大招动画
/// @arg index 大招序号
function scr_unskill_display_boss(index){
	if in(global.unskill_anima, [0, 1]) {
		scr_unskill_display(index, true);
		return true
	}
	return false
}
/// @desc 显示玩家大招动画
/// @arg index 大招序号
function scr_unskill_display_player(index){
	if in(global.unskill_anima, [0, 2]) {
		scr_unskill_display(index, false);
		return true
	}
	return false
}

