/// @desc 设置重生点
/// @arg re_x
/// @arg re_y 16x
/// @arg re_xscale
function scr_relife_set_point(xx, yy, imx) {
	global.re_x=xx
	global.re_y=yy
	global.re_xscale=imx
}
/// @desc 经过某坐标时设置重生点
/// @arg re_x
/// @arg re_y 16x
/// @arg re_xscale
function scr_relife_set_cross(rx, ry, rxsc) {
	if between(obj_player.x,rx-16,false,rx+16,true) 
		scr_relife_set_point(rx,ry,rxsc)
}
/// @desc 根据门设置重生点
/// @arg dorx
/// @arg refy
function scr_relife_set_door(rx, ry) {
	if between(obj_player.y,ry-144,true,ry+144,true){
		if between(obj_player.x,rx,false,rx+64,true) 
			scr_relife_set_point(rx+64,ry,1)
		else if between(obj_player.x,rx-64,true,rx,false) 
			scr_relife_set_point(rx-64,ry,-1)
	}
}
