/// @desc 获得任务
/// @arg type
/// @arg inx
function scr_mission_add(type, inx){
	if !scr_mission_exist(type, inx) {
		global.mission[type][inx]=MISSION_STATIS.unstart
		ds_list_add(global.mission_list[type], inx)
	}
}
/// @desc 任务变更
/// @arg type
/// @arg inx
function scr_mission_set_status(type, inx, status){
	global.mission[type][inx]=status
}
/// @desc 任务变更
/// @arg type
/// @arg inx
function scr_mission_exist(type, inx){
	return ds_list_exists(global.mission_list[type], inx)
}
/// @desc 任务变更
/// @arg type
/// @arg inx
function scr_mission_get_status(type, inx){
	return global.mission[type][inx]
}
/// @desc 任务变更
/// @arg type
/// @arg inx
function scr_mission_is_status(type, inx, status){
	return global.mission[type][inx]==status
}