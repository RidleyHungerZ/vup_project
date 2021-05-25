function scr_room_beginstep_area0(){
var prg=0
#region 开局对话
if room==room_start 
&& !scr_thread_isover(0){
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
			scr_view_transition(1, 2)
			scr_thread_over(prg)
			action=0
		}
	}
	///@skip
	if scr_can_skip(prg) {
		scr_skip(1, "s", 1, 0, 0, prg, 0, 0)
		scr_view_transition(1, 2)
	}
}
#endregion
#region 剧情概述
else if room==room_start 
&& !scr_thread_isover(1){
	prg=1
	if action==0 {
		layer_set_visible(layer_get_id("Backgrounds_black"), false)
		scr_view_transition(1, 1)
		audio_bgm_change(bgm_story)
		action=1
		time=60
	}
	if action==1 && time==0 {
		npc[0]=instance_create_depth(144, 540, -1001, obj_ui_txt)
		with npc[0] {
			font=font_puhui_32
			txt=global.storybg[0]
			left=0
			top=0.5
			image_xscale=1
			image_yscale=1
			stroke=c_black
			strokew=2
			image_alpha=0
		}
		npc[1]=0
		action=1.1
	}
	if action==1.1 && time==0 {
		var storyinx=npc[1]
		npc[0].txt=global.storybg[storyinx]
		action=1.2
	}
	if action==1.2 {
		if npc[0].image_alpha<1 npc[0].image_alpha+=1/30
		else {
			npc[0].image_alpha=1
			action=1.3
			time=180
		}
	}
	if action==1.3 {
		if time==0 
		||(keystate_check(global.A_state)
		|| keystate_check(global.B_state)
		|| keystate_check(global.X_state)
		|| keystate_check(global.Y_state)) {
			action=1.4
		}
	}
	if action==1.4 {
		if npc[0].image_alpha>0 npc[0].image_alpha-=1/30
		else {
			npc[0].image_alpha=0
			action=1.5
			time=60
		}
	}
	if action==1.5 && time==0 {
		npc[1]++
		if npc[1]<array_length(global.storybg) {
			action=1.1
		} else {
			action=2
			time=60
		}
	}
	//黑屏
	if action==2 && time==0 {
		scr_view_transition(1, 0)
		action=2.1
	}
	if action==2.1 {
		if scr_view_transition_Isover(1) {
			scr_view_transition(1, 2)
			audio_bgm_stop()
			action=2.2
			time=30
		}
	}
	if action==2.2 && time==0 {
		scr_room_goto(room_kanaroom)
		scr_thread_over(prg)
		action=0
	}
	///@skip
	if scr_can_skip(prg) {
		scr_skip(1, "s", 1, obj_player.x, obj_player.y+GRDY, prg, 0, 0)
		scr_room_goto(room_kanaroom)
		scr_view_transition(1, 2)
	}
}
#endregion
#region 仓库办公室
else if (room==room_kanaroom || room==room_area0_1)
&& !scr_thread_isover(2){
	prg=2
	//加载界面
	if action==0 {
		scr_loading_open_inblack(0)
		action=0.1
	}
	if action==0.1 {
		if !scr_loading_isopen() {
			action=0.2
		}
	}
	if action==0.2 {
		audio_bgm_change(bgm_kanaroom)
		with obj_player {
			scr_sprite_change(SS_talking, 0, 0)
			image_xscale=-1
			x=264
			y=224-GRDY
		}
		action=1
		time=60
	}
	//新闻播报
	thread_talk_execute(prg, 1, 2, 60)
	//物语来电
	if action==2 && time==0 {
		scr_sound_play(se_sub_complete)
		action=3
		time=60
	}
	thread_talk_execute(prg, 3, 3.2, 30)
	//信号阻断
	if action==3.2 && time==0 {
		scr_sound_loop(se_env_wave_noise)
		action=3.6
		time=60
	}
	thread_talk_execute(prg, 3.6, 4, 30)
	//爆炸震动
	if action==4 && time==0 {
		scr_sound_stop(se_env_wave_noise)
		audio_bgm_change(bgm_danger)
		scr_sound_play(se_boom)
		scr_view_shock(1)
		with obj_player {
			scr_sprite_change(SS_injure_fall, 0, 0)
			hsp=-1
		}
		action=4.1
		time=15
	}
	if action==4.1 && time==0 {
		with obj_player {
			scr_sprite_change(SS_trip, 0, 0)
			hsp=0
		}
		action=4.2
		time=60
	}
	if action==4.2 && time==0 {
		with obj_player {
			scr_sprite_change(SS_climb, 0, 0)
		}
		action=5
		time=30
	}
	thread_talk_execute(prg, 5, 6, 30)
	//起身看监控
	if action==6 && time==0 {
		with obj_player {
			scr_sprite_change(SS_climb, 0, 0.25)
		}
		action=6.1
		time=30
	}
	if action==6.1 && time==0 {
		with obj_player {
			scr_sprite_change(SS_walk, 0, 0.25)
			hspeed=image_xscale*hspd*walkspd
		}
		action=6.2
	}
	if action==6.2 {
		if obj_player.x<=240 {
			with obj_player {
				scr_sprite_change(SS_idle, 0, 0)
				hspeed=0
				x=240
			}
			action=7
			time=30
		}
	}
	//查看一号监控
	if action==7 && time==0 {
		scr_view_transition(1, 0)
		action=7.1
	}
	if action==7.1 {
		if scr_view_transition_Isover(1) {
			scr_view_transition(1, 2)
			scr_room_goto(room_area0_1)
			action=7.2
			time=2
		}
	}
	if action==7.2 {
		if time==0 {
			scr_view_transition(1, 1)
			view_setx(800)
			view_sety(0)
			instance_create_depth(0, 0, -1, obj_screen_scan)
			//机位
			with instance_create_depth(16, 16, -1, obj_ui_txt) {
				font=font_puhui_32
				txt=global.stage_txt_area0_screen[1]
				left=0
				top=0
				image_xscale=1
				image_yscale=1
				stroke=c_black
				strokew=2
			}
			action=8
			time=120
		}
	}
	thread_talk_execute(prg, 8, 9, 60)
	//查看大门监控
	if action==9 && time==0 {
		scr_view_transition(1, 0)
		action=9.1
	}
	if action==9.1 {
		if scr_view_transition_Isover(1) {
			//机位
			with obj_ui_txt {
				txt=global.stage_txt_area0_screen[2]
			}
			//无信号
			with instance_create_depth(VIEW_W_UI/2, VIEW_H_UI/2, -1, obj_ui_txt) {
				font=font_puhui_32
				txt=global.stage_txt_area0_screen[0]
				left=0.5
				top=0.5
				image_xscale=2
				image_yscale=2
				bgs_color=c_black
				bgs_alpha=1
				bgs_bbox=[0, 0, VIEW_W_UI, VIEW_H_UI]
			}
			action=10
			time=60
		}
	}
	thread_talk_execute(prg, 10, 11, 60)
	if action==11 && time==0 {
		scr_view_transition(1, 0)
		action=11.1
	}
	if action==11.1 {
		if scr_view_transition_Isover(1) {
			scr_view_transition(1, 2)
			scr_room_goto(room_kanaroom)
			action=11.2
			time=2
		}
	}
	if action==11.2 {
		if time==0 {
			scr_view_transition(1, 1)
			view_setx(0)
			view_sety(0)
			action=12
			time=60
		}
	}
	thread_talk_execute(prg, 12, 13, 30)
	if action==13 && time==0 {
		global.operate=1
		global.player_operate=0
		codekey_Hdirect(-1)
		action=13.1
	}
	if action==13.1 {
		if room==room_area0_1 {
			codekey_Hdirect(0)
			action=13.2
		}
	}
	if action==13.2 {
		if scr_room_doorclose_canoper() {
			global.player_operate=0
			action=14
			time=60
		}
	}
	thread_talk_execute(prg, 14, 14.2, 30)
	//信号阻断
	if action==14.2 && time==0 {
		scr_sound_loop(se_env_wave_noise)
		action=14.6
		time=60
	}
	thread_talk_execute(prg, 14.6, 15, 30)
	if action==15 && time==0 {
		scr_sound_stop(se_env_wave_noise)
		audio_bgm_change(bgm_area0)
		obj_view.missionStart(0)
		scr_thread_over(prg)
		action=0
	}
	///@skip
	if scr_can_skip(prg) && action<15 {
		scr_room_goto(room_area0_1)
		scr_skip(1, bgm_area0, 1, 128, 208, prg, 0, 0)
		scr_relife_set_point(obj_player.x, obj_player.y+GRDY, obj_player.image_xscale)
		global.operate=0.1
		global.player_operate=0
		obj_view.missionStart(30)
		instance_destroy(obj_ui_txt)
		instance_destroy(obj_screen_scan)
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
	///@skip
	if scr_can_skip(prg) {
		scr_skip(1, "", 1, 3904, 224, prg, 0, 0)
		scr_room_freedom()
	}
}
#endregion

}