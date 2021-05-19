/// @desc 使用fps获取帧数
/// @arg menu
/// @arg imspd
/// @arg imnum
function scr_image_index_fpscurr(menu, imspd, imnum){
	var fpsc = global.fps_curr
	if menu fpsc = global.fps_currmenu
	return (fpsc mod (imnum/imspd))*imspd
}