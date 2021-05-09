function scr_room_beginstep_test(){
#region 测试BOSS
if room==room_test 
&& !scr_boss_isget(0) {
	if between(obj_player.x, 1024, true, 1536, true) 
	&& between(obj_player.y, 0, true, 288, true) {
		#region 前戏
		if action==0 {
			if scr_room_doorclose_canoper() {
				global.player_operate=0
				direct=1
				action=0.5
				time=1
			}
		}
		else if scr_room_fall_after(1, "s") {
			if obj_player.x>=1104 {
				codekey_Hdirect(0)
				scr_room_player_xstop(1104)
				action=3
				time=60
			}
		}
		else if action==3 && time==0 {
			scr_room_bosswar_start(bgm_boss1, bgm_stage1)
		}
		#endregion
		#region 战斗中
		else if scr_room_bosswar_inwar() {
			
		}
		#endregion
		#region 玩家死亡
		//else if scr_room_bosswar_player_hp0() {
		//	action=1101
		//	time=60
		//}
		//else if action==1101 && time==0 {
		//	scr_room_boss_failover()
		//}
		#endregion
		#region BOSS死亡
		else if scr_room_bosswar_boss_hp0() {
			scr_boss_get(0)
			audio_bgm_change(bgm_stage1)
			scr_room_freedom()
			action=0
		}
		#endregion
	}
}
#endregion
}