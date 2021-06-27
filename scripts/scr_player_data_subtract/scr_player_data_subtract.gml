/// @desc 玩家血量减少
/// @arg sub_hp 减血量
function scr_player_hp_subtract(sub_hp) {
	global.player_hp-=sub_hp
	//不满血且有扩展
	while global.player_hp_ex>0
	&& global.player_hp<global.player_hp_up {
		global.player_hp_ex--
		global.player_hp++
	}
}
/// @desc 玩家能量减少
/// @arg sub_mp 减能量
function scr_player_mp_subtract(sub_mp) {
	global.player_mp-=sub_mp
	//不满血且有扩展
	while global.player_mp_ex>0
	&& global.player_mp<global.player_mp_up {
		global.player_mp_ex--
		global.player_mp++
	}
}
/// @desc 玩家剩余血量
/// @arg val
function scr_player_hp_have(val) {
	return (global.player_hp+global.player_hp_ex)>=val
}
/// @desc 玩家剩余能量
/// @arg val
function scr_player_mp_have(val) {
	return (global.player_mp+global.player_mp_ex)>=val
}
/// @desc 玩家剩余血量
function scr_player_support_ismax() {
	return global.player_support>=100
}
/// @desc 玩家剩余血量
/// @arg val
function scr_player_support_add(val) {
	if !scr_player_support_ismax() {
		global.player_support+=val
		if scr_player_support_ismax() {
			obj_view.support_max_trigger()
		}
	}
}