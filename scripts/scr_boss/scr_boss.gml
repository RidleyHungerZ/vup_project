/// @desc 完成某BOSS
/// @arg inx
function scr_boss_get(inx){
	global.boss[inx]=1
}
/// @desc 完成某BOSS
/// @arg inx
function scr_boss_isget(inx){
	return global.boss[inx]==1
}