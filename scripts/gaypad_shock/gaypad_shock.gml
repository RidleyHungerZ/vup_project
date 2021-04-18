/// @desc 设置手柄震动
/// @arg 左马达
/// @arg 右马达
/// @arg 振动时间;-1无限制
function gaypad_shock(left, right, time){
	global.gaypad_shock=[left, right]
	global.gaypad_shock_time=time
}
function gaypad_shock_stop(){
	gaypad_shock(0, 0, 0)
}