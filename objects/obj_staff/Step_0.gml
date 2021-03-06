#region 玩家死亡
//非BOSS战且非电子空间内
if global.boss_war==0 {
	if player_death_action==1{
		player_death_action=2
		alarm[0]=60
	}
}
#endregion
#region 音量设置
//音效音量
audio_se_boss_set_volume(audio_se_get_volume())
//BGM音量
audio_bgm_set_volume(audio_bgm_get_volume())
audio_bgm_inchange()//必须放在vol之后，有淡入淡出效果
audio_bgm_inloop()
#endregion
#region 多普勒音效箱
audio_dpl_working()
audio_se_working()
#endregion
#region 帧速锁定
//光剑打击感
if global.saber_pause==1
	global.saber_pause=2
else if global.saber_pause==2{
	global.saber_pause=3
	game_set_speed(12, gamespeed_fps)
}
else if global.saber_pause==3{
	global.saber_pause=0
	game_set_speed(FPS_N, gamespeed_fps)
}
//BOSS击杀
if global.boss_pause==1{
	global.boss_pause=2
	boss_pause_time=30
	game_set_speed(30, gamespeed_fps)
}
else if global.boss_pause==2{
	if boss_pause_time>0 boss_pause_time-=1
	else{
		boss_pause_time=0
		global.boss_pause=0
		game_set_speed(FPS_N, gamespeed_fps)
	}
}
//skip
if global.skip==1{
	global.skip=2
	game_set_speed(2, gamespeed_fps)
}
else if global.skip==2{
	global.skip=0
	game_set_speed(FPS_N, gamespeed_fps)
}
#endregion
#region 部分缓存循环检测
{
	
}
#endregion

#region debug测试
if debug_mode {
	if keyboard_check_pressed(vk_delete) {
		global.player_hp=0
	} 
	if keyboard_check_pressed(vk_backspace) {
		with obj_boss {
			if is_war_boss
				hp=1
		}
	} 
	if keyboard_check(vk_control) 
	&&(global.fps_curr mod 3 == 0){
		if keyboard_check(vk_up) {
			global.player_hp++
			scr_sound_play(se_item_hp)
		} else if keyboard_check(vk_down) {
			global.player_hp--
			scr_sound_play(se_item_hp)
		}
		if keyboard_check(vk_right) {
			global.player_mp++
			scr_sound_play(se_item_mp)
		} else if keyboard_check(vk_left) {
			global.player_mp--
			scr_sound_play(se_item_mp)
		}
		if keyboard_check(vk_f1) {
			global.player_support=100
		}
		if global.boss_war==1 {
			if keyboard_check(vk_numpad1) {
				with obj_boss {
					if is_war_boss
						hp++
				}
				scr_sound_play(se_item_mp)
			} else if keyboard_check(vk_numpad2) {
				with obj_boss {
					if is_war_boss
						hp--
				}
				scr_sound_play(se_item_mp)
			}
		}
	}
	
	if keyboard_check_pressed(vk_enter)
	&& global.operate=1
	&& global.player_operate=1{
		try {
			var str=get_string("瞬移坐标：x,y,room(0),bgm",""),
				pos=string_split(str,",")
			if str!="" 
			&& array_length(pos)>=3 {
				obj_player.x=((pos[0]="x")?obj_player.x: real(pos[0]))
				obj_player.y=((pos[1]="y")?obj_player.y: real(pos[1]))
				obj_player.y-=GRDY
				var roompos=asset_get_index(pos[2])
				if room_exists(roompos) scr_room_goto(roompos)
				scr_view_set_with_inst(obj_player)
				scr_relife_set_point(obj_player.x,obj_player.y+GRDY,obj_player.image_xscale)
				if array_length(pos)=4 {
					var bgmname = pos[3], bgm=asset_get_index(pos[3])
					if audio_exists(bgm) audio_bgm_change(bgm)
				}
				instance_activate_all()
				exit
			}
		} catch(e) {
			print e
		}
	}
}
#endregion