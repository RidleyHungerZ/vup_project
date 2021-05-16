function scr_room_beginstep_area0(){
var prg=0
#region 开局对话
if room==room_start {
	prg=0
	if action==0 {
		action=1
		time=60
	}
	thread_talk_execute(prg, 1, 2, 60)
	if action==2 && time==0 {
		scr_view_transition(1, 0)
		action=3
	}
	if action==3 {
		if scr_view_transition_Isover(1) {
			scr_room_goto(room_area0_1)
			with obj_player {
				scr_sprite_change(SS_idle, 0, 0.25)
				x=128
				y=208-GRDY
				image_xscale=1
				scr_relife_set_point(x, y+GRDY, 1)
			}
			audio_bgm_change(bgm_stage1)
			scr_thread_over(prg)
			action=0
		}
	}
}
#endregion
#region 仓库办公室
else if room==room_kanaroom 
&& !scr_thread_isover(1){
	prg=1
	if action==0 {
		
	}
}
#endregion
#region 仓库办公室门口
else if room==room_area0_1
&& !scr_thread_isover(2){
	prg=2
	if action==0 {
		action=1
		time=60
	}
	thread_talk_execute(prg, 1, 2, 30)
	if action==2 {
		obj_view.missionStart()
		scr_thread_over(prg)
		action=0
	}
}
#endregion
#region 通风管道
else if room==room_area0_1
&& !scr_thread_isover(3){
	prg=3
	if action==0 {
		if between(obj_player.x, 3776, true, 3920, true) {
			global.player_operate=0
			direct=1
			action=0.5
			time=1
		}
	}
	if scr_room_fall_after(1, "") {
		if obj_player.x>=3904 {
			codekey_Hdirect(0)
			scr_room_player_xstop(3904)
			action=3
			time=30
		}
	}
	if action==3 && time==0 {
		scr_sound_play(se_menu_error)
		action=4
		time=60
	}
	thread_talk_execute(prg, 4, 5, 30)
	if action==5 {
		scr_room_freedom()
		scr_thread_over(prg)
		action=0
	}
}
#endregion
}