/// @desc 使用fps获取帧数
/// @arg menu 是否菜单暂停
/// @arg imspd 帧速
/// @arg imnum 总帧数
function scr_image_index_fpscurr(menu, imspd, imnum){
	var fpsc = global.fps_curr
	if menu fpsc = global.fps_currmenu
	return (fpsc mod (imnum/imspd))*imspd
}