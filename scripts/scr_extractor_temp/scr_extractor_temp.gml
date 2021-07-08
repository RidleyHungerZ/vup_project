/// @desc 创建临时执行器
function scr_create_extractor_temp(obj){
	var assl = instance_create_depth(view_xpos(0), view_ypos(0), 1, obj);
	return assl;
}
/// @desc 创建临时执行器
function scr_execute_extractor_temp(assl){
	assl.execute()
}