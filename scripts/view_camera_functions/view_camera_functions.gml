/// @desc 获得相机x坐标
/// @arg view
function view_xpos(view) {
	return camera_get_view_x(view_camera[view])
}
/// @desc 获得相机y坐标
/// @arg view
function view_ypos(view) {
	return  camera_get_view_y(view_camera[view])
}
/// @desc 获得相机x坐标
/// @arg view
function view_xcenpos(view) {
	return view_xpos(view)+view_wpos(view)/2
}
/// @desc 获得相机y坐标
/// @arg view
function view_ycenpos(view) {
	return view_ypos(view)+view_hpos(view)/2
}
/// @desc 获得相机宽度
/// @arg view
function view_wpos(view) {
	return camera_get_view_width(view_camera[view])
}
/// @desc 获得相机高度
/// @arg view
function view_hpos(view) {
	return camera_get_view_height(view_camera[view])
}
/// @desc 相机x坐标增减
/// @arg addx
function view_addx(addx) {
	var vx=view_xpos(0), vy=view_ypos(0)
	obj_view.x+=addx
	camera_set_view_pos(view_camera[0],vx+addx,vy)
}
/// @desc 相机y坐标增减
/// @arg addy
function view_addy(addy) {
	var vx=view_xpos(0), vy=view_ypos(0)
	obj_view.y+=addy
	camera_set_view_pos(view_camera[0],vx,vy+addy)
}
/// @desc 相机x坐标设置
/// @arg x
function view_setx(setx) {
	obj_view.x=setx+view_wpos(0)/2
	camera_set_view_pos(view_camera[0],setx,view_ypos(0))
}
/// @desc 相机y坐标设置
/// @arg y
function view_sety(sety) {
	obj_view.y=sety+view_hpos(0)/2
	camera_set_view_pos(view_camera[0],view_xpos(0),sety)
}
