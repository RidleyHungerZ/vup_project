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
		scr_room_bosswar_start(bgm_boss1, bgm_story, function() {
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
		scr_room_bosswar_boss_boomstart(function() {
			with obj_player {
				scr_sprite_change(SS_idle, 0, 0.25)
				walk=0
				jump=0
				x=768-160
				y=224-GRDY
				image_xscale=1
			}
			npc[0]=instance_create_layer(768+160, 224-GRDY, layerInst[3], obj_another)
			with npc[0] {
				scr_sprite_change(spr_boss_yanzx_idle2, 0, 0.25)
				image_xscale=-1
			}
		})
		action=1204
	}
	else if action==1204 {
		if scr_room_bosswar_boss_boomover() {
			scr_boss_get(1)
			action=0
			//scr_room_freedom()
			//audio_bgm_change(bgm_story)
		}
	}
	#endregion
	///@skip
	if scr_can_skip_boss(prg) {
		inst_room_area0_test_boss_roomrange.use=true
		scr_skip_boss(1, bgm_boss1, bgm_story, 1, 768-160*direct, 224, prg, function() {
			inst_room_area0_test_boss_roomrange.use=false
		})
	}
}
#endregion
#region BOSS战结束
else if room==room_area0_test_boss 
&& !scr_thread_isover(11) 
&& scr_boss_isget(1) {
	prg=11
	if action==0 {
		audio_bgm_change(bgm_story)
		action=1
		time=60
	}
	thread_talk_execute(prg, 1, 2, 30)
	if action==2 && time==0 {
		with npc[0] {
			scr_sprite_change(spr_boss_yanzx_dis, 0, 0.25)
			scr_sound_play(se_boss_yanzx_dis)
		}
		action=2.1
		time=120
	}
	if action==2.1 && time==0 {
		instance_destroy(npc[0])
		inst_room_area0_test_boss_roomrange.use=false
		global.operate=1
		action=3
		time=60
	}
	if action==3 && time==0 {
		action=0
		scr_thread_over(prg)
		scr_room_freedom()
	}
	///@skip
	if scr_can_skip(prg) {
		scr_skip(1, "", 1, obj_player.x, obj_player.y+GRDY, prg, 0, 0)
		inst_room_area0_test_boss_roomrange.use=false
		scr_view_set_with_inst(obj_player)
		scr_room_freedom()
	}
}
#endregion
}