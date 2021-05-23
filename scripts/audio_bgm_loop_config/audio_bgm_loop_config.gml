/// @desc 用于配置保存BGM循环信息
function audio_bgm_loop_config() {
	// 整曲循环的设置为0
	global.bgm_loop_cfgmap = ds_map_create()
	var map = global.bgm_loop_cfgmap
#region 关卡曲目
	map[? bgm_area0] = [28.83, 157.28]	//stage1
#endregion
#region 剧情曲目
	map[? bgm_story] = [1.25, 31.25]
	map[? bgm_kanaroom] = 0//[57.975, 101.61]
	map[? bgm_danger] = [12.4, 89.82]
#endregion
#region 战斗曲目
	map[? bgm_boss1] = [1.95, 40.37]
#endregion
}
