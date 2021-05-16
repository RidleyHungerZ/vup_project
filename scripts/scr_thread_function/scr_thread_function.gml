/// @desc 某剧情已完成
/// @arg inx
function scr_thread_over(inx) {
	global.thread[inx]=1
}
/// @desc 某剧情是否已完成
/// @arg inx
function scr_thread_isover(inx) {
	return global.thread[inx]==1
}