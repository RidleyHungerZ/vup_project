/// @desc 用于配置保存BGM循环信息
function audio_bgm_loop_config() {
	// 整曲循环的设置为0
	global.bgm_loop_cfgmap = ds_map_create()
	var map = global.bgm_loop_cfgmap
#region 关卡曲目
	map[? bgm_stage1] = [28.83, 157.28]	//stage1
#endregion
#region 剧情曲目
	
#endregion
#region 战斗曲目
	map[? bgm_boss1] = [1.95, 40.37]
#endregion
}
