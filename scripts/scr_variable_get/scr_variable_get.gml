///@desc 这里存放各种获取变量的方法

/// @desc 获取形态
/// @arg inx
function scr_model_get(inx){
	if global.model_get[inx]==0 {
		global.model_get[inx]=1
		global.model_get_number++
	}
}
/// @desc 是否获取形态
/// @arg inx
function scr_model_isget(inx){
	return global.model_get[inx]==1
}