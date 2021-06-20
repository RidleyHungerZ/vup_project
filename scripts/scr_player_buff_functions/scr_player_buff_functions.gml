#region 增益buff
/// @desc 正面buff
function scr_player_buff(buff, time){
	global.player_buff=buff
	global.player_buff_time=time
}
/// @desc 判断/获取正面buff
/// @arg buff*
function scr_player_buff_is(debuff){
	if is_undefined(debuff) {
		return global.player_debuff
	} else {
		return global.player_debuff==debuff
	}
}
/// @desc 清除正面buff
function scr_player_buff_clear(){
	global.player_buff=PLAYER_BUFF.none
	global.player_buff_time=0
}
#endregion
#region 负面debuff
/// @desc 负面buff
function scr_player_debuff(debuff, time){
	global.player_debuff=debuff
	global.player_debuff_time=time
}
/// @desc 判断/获取负面buff
/// @arg debuff*
function scr_player_debuff_is(debuff){
	if is_undefined(debuff) {
		return global.player_debuff
	} else {
		return global.player_debuff==debuff
	}
}
/// @desc 清除负面buff
function scr_player_debuff_clear(){
	global.player_debuff=PLAYER_DEBUFF.none
	global.player_debuff_time=0
}
#endregion