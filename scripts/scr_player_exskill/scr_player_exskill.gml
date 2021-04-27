/// @desc 是否获得技能
/// @arg inx
function scr_player_exskill_isget(inx){
	return global.exskill[inx]==1
}
/// @desc 获得技能
/// @arg inx
function scr_player_exskill_gain(inx){
	global.exskill[inx]=1
}