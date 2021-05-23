/// @desc 开启读取页面
/// @arg index
function scr_loading_open(index){
	with obj_view {
		loading_action=1
		loading_index_temp=index
	}
}
/// @desc 从黑暗中开启读取页面
/// @arg index
function scr_loading_open_inblack(index){
	scr_view_transition(1, 1)
	with obj_view {
		loading_action=2.5
		loading_index_temp=index
	}
}
/// @desc 读取页面是否还在开启中
function scr_loading_isopen() {
	return obj_view.loading_action!=0
}