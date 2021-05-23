/// @arg thread[-1:无限制]
function scr_can_skip(thread) {
	if keystate_check_pressed(global.Start_state)
	&& obj_staff.player_change_action==0
	&& global.room_change==0
	&& global.stop==0
	&&!between(global.operate, 0, false, 1, false)
	&&!(global.operate==1 && global.player_operate==1)
	&&((thread==-1 || global.threaded[thread]==1)
		||debug_mode||true)
	&& obj_room.action>=1 {
		with obj_room_change {
			if action!=0 return false
		}
		with obj_room_change_up {
			if action!=0 return false
		}
		return true
	}
	else
		return false
}

/// @arg view[0白色1黑色]
/// @arg bgm[""重播;"?"不变;"s"停止;bgm_a0变化]
/// @arg ply_scale[0:玩家消失;1/-1:玩家站立+方向]
/// @arg ply_x
/// @arg ply_y
/// @arg thread[-1:不设置]
/// @arg action
function scr_skip(view, bgm, ply_scale, ply_x, ply_y, thread, action, time) {
	global.view_control=0
	global.start_state=2
	global.Start_state=2
	audio_se_stop_all()
	//scr_talkview_transition_cancle()
	scr_view_transition(view,1)
	global.skip=1
	instance_destroy(obj_another)
	instance_destroy(obj_animation_once)
	//instance_destroy(obj_time_once)
	//instance_destroy(obj_fly_outdestroy)
	instance_destroy(obj_physics_part)
	//instance_destroy(obj_room_tile)
	with obj_animation {
		if animation_once instance_destroy()
		else if death_time>=0 instance_destroy()
	}
	with obj_room{
		self.action=action
		self.time=time
		talk_action=0
		//talk_txt_index=0
		//snowflake=false
	}
	//obj_view0.view_war_red=0
	//音乐
	if is_string(bgm) {
		if string_pos("s",bgm)>0
			audio_bgm_stop()
		else if string_length(bgm)=0
			audio_bgm_change_imm(global.music_now)
	} else if audio_exists(bgm)
		audio_bgm_change(bgm)
	//玩家动作
	with obj_player{
		if ply_scale=0{
			scr_sprite_change(spr_none,0,0)
		}
		else if ply_scale=1||ply_scale=-1{
			scr_sprite_change(SS_idle,0,0.25)
			if global.player_hp<=dyinghp
				scr_sprite_change(SS_idle2,-2,-2)
			image_xscale=ply_scale
		}
		walk=0
		jump=0
		vsp=0
		hsp=0
		dash=0
		v_ice=0
		x=ply_x
		y=ply_y-GRDY
		speed=0
		gravity=0
		friction=0
		path_speed=0
	}
	//scr_viewroom_inroom()
	scr_view_set_with_inst(obj_player)
	//按键
	codekey_Hdirect(0)
	codekey_Vdirect(0)
	codekey_attack(0)
	codekey_dash(0)
	codekey_jump(0)
	//codekey_select(0)
	//codekey_start(0)
	codekey_sub(0)
	//codekey_switch(0)
	//codekey_true(0)
	scr_room_player_xstop(ply_x)
	//剧情进程
	if thread!=-1
		scr_thread_over(thread)
	with obj_view {
		//对话
		talk_rate=0
		global.talk=0
		talk_init()
		//小提示
		tip_talk_rate=0
		global.tip_talk=0
		tip_init()
	}
	//CG
	//cg_cancle()
	//no_gui_surf_ghost=false
}
