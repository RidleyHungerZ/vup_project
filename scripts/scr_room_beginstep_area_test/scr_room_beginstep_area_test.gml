function scr_room_beginstep_area_test(){
var prg=0
#region BOSS战
if room==room_area0_test_boss 
&& !scr_boss_isget(1) {
	prg=10
	#region 开战前
	if action==0 {
		if between(obj_player.x, 512, true, 1024, true) {
			global.player_operate=0
			direct=sign(768-obj_player.x)
			with obj_boss_yanZx {
				x=768+160*other.direct
				image_xscale=-other.direct
			}
			action=0.5
			time=1
		}
	}
	if scr_room_fall_after(1, bgm_beforewar) {
		var aimx=768-160*direct
		if obj_player.x*direct>=aimx*direct {
			codekey_Hdirect(0)
			scr_room_player_xstop(aimx)
			inst_room_area0_test_boss_roomrange.use=true
			action=3
			time=90
		}
	}
	thread_talk_execute(prg, 3, 4, 30)
	if action==4 && time==0 {
		scr_thread_over(prg)
		scr_room_bosswar_start(bgm_boss1, bgm_area0, function() {
			inst_room_area0_test_boss_roomrange.use=false
		})
	}
	#endregion
	#region 战斗中
	else if scr_room_bosswar_inwar() {
		
	}
	#endregion
	#region BOSS死亡
	else if scr_room_bosswar_boss_hp0() {
		scr_room_bosswar_boss_boomstart(function() {})
		action=1204
	}
	else if action==1204 {
		if scr_room_bosswar_boss_boomover() {
			scr_boss_get(1)
			inst_room_area0_test_boss_roomrange.use=false
			action=0
			scr_room_freedom()
			audio_bgm_change(bgm_area0)
		}
	}
	#endregion
	///@skip
	if scr_can_skip_boss(prg) {
		inst_room_area0_test_boss_roomrange.use=true
		scr_skip_boss(1, bgm_boss1, bgm_area0, 1, 768-160*direct, 224, prg, function() {
			inst_room_area0_test_boss_roomrange.use=false
		})
	}
}
#endregion
}