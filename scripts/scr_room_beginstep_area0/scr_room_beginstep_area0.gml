function scr_room_beginstep_area0(){
var prg=0
#region 开局对话
if room==room_story 
&& !scr_thread_isover(0){
	prg=0
	if action==0 {
		action=0.5
		time=30
	}
	if action==0.5 && time==0 {
		audio_bgm_change(bgm_beforewar)
		action=1
		time=30
	}
	thread_talk_execute(prg, 1, 2, 60)
	if action==2 && time==0 {
		scr_view_transition(1, 0)
		action=2.1
	}
	if action==2.1 {
		if scr_view_transition_Isover(1) {
			scr_view_transition(1, 2)
			audio_bgm_stop()
			action=3
			time=60
		}
	}
	if action==3 && time==0 {
		scr_thread_over(prg)
		action=0
	}
	///@skip
	if scr_can_skip(prg) {
		scr_skip(1, "s", 1, 0, 0, prg, 0, 0)
		scr_view_transition(1, 2)
	}
}
#endregion
#region 剧情概述
else if room==room_story 
&& !scr_thread_isover(1){
	prg=1
	if action==0 {
		layer_set_visible(layer_get_id("Backgrounds_black"), false)
		scr_view_transition(1, 1)
		action=0.5
		time=30
	}
	if action==0.5 && time==0 {
		audio_bgm_change(bgm_story)
		action=1
		time=30
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
		obj_player.call_screen=true
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
		obj_player.call_screen=false
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
			action=13.3
			time=60
		}
	}
	if action==13.3 && time==0 {
		obj_player.call_screen=true
		action=14
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
		obj_player.call_screen=false
		scr_sound_stop(se_env_wave_noise)
		audio_bgm_change(bgm_area0)
		obj_view.missionStart(0, 0)
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
		obj_view.missionStart(0, 30)
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
#region 仓库大门外
else if room==room_area0_2 
&& !scr_thread_isover(4) {
	prg=4
	if action==0 {
		if scr_room_doorclose_canoper() {
			temp[0]=global.sub_type
			global.sub_type=0
			temp[1]=global.main_sub_exchange[PLAYER_MODEL.ARMOR]
			global.main_sub_exchange[PLAYER_MODEL.ARMOR]=0
			global.player_operate=0
			action=0.5
			time=60
		}
	}
	if action==0.5 && time==0 {
		obj_player.call_screen=true
		action=1
	}
	thread_talk_execute(prg, 1, 2, 30)
	//信号阻断
	if action==2 && time==0 {
		scr_sound_loop(se_env_wave_noise)
		action=3
		time=60
	}
	thread_talk_execute(prg, 3, 4, 30)
	//前进到网格查看
	if action==4 && time==0 {
		obj_player.call_screen=false
		scr_sound_stop(se_env_wave_noise)
		action=4.1
		time=30
	}
	if action==4.1 && time==0 {
		codekey_Hdirect(1)
		action=4.2
	}
	if action==4.2 {
		if obj_player.x>=1200 {
			codekey_Hdirect(0)
			scr_room_player_xstop(1200)
			action=4.3
			time=30
		}
	}
	if action==4.3 && time==0 {
		with obj_player {
			scr_sprite_change(SS_squat, 0, 0.25)
		}
		action=5
		time=60
	}
	thread_talk_execute(prg, 5, 6, 60)
	//敌人出现
	if action==6 && time==0 {
		global.view_control=1
		audio_bgm_stop()
		action=6.1
		time=30
	}
	if action==6.1 && time==0 {
		with instance_create_layer(1440, -16, layerInst[1], obj_bullet_enemy01) {
			speed=6
			direction=225
		}
		scr_sound_play(se_enemy_bullet)
		obj_player.unoperate_injure=true
		action=6.2
	}
	if action==6.2 {
		with obj_player {
			if uninjure!=0 {
				hsp=0
				injure_t=9999
				unoperate_injure=false
				other.action=6.3
				other.time=10
			}
		}
	}
	if action==6.3 && time==0 {
		with obj_player {
			scr_sprite_change(SS_trip, 0, 0)
			walk=0
			jump=0
			global.operate=0
			other.action=6.4
			other.time=60
		}
	}
	if action==6.4 && time==0 {
		with obj_player {
			scr_sprite_change(SS_climb, 0, 0)
		}
		action=6.5
		time=30
	}
	//飞行暴乱体出现
	if action==6.5 && time==0 {
		npc[1]=instance_create_layer(1456, -32, layerInst[3], obj_thread_enemy05)
		with npc[1] {
			scr_sprite_change(spr_enemy05_idle, 0, 0.5)
			image_xscale=-1
		}
		action=6.6
	}
	if action==6.6 {
		var eyaimx=1312, eyaimy=144;
		with npc[1] {
			var eydis = point_distance(x, y, eyaimx, eyaimy),
				eydir = point_direction(x, y, eyaimx, eyaimy);
			if eydis>4 {
				direction=eydir
				speed=max(eydis/32, 4)
			} else {
				direction=0
				speed=0
				x=eyaimx
				y=eyaimy
				float=true
				other.action=6.7
			}
		}
	}
	if action==6.7 {
		audio_bgm_change(bgm_beforewar)
		action=7
		time=30
	}
	thread_talk_execute(prg, 7, 8, 30)
	//被包围
	if action==8 && time==0 {
		npc[2]=instance_create_layer(1568, 224, layerInst[3], obj_thread_enemy01)
		with npc[2] {
			scr_sprite_change(spr_enemy01_walk, 0, 0.2)
			image_xscale=-1
			hspeed=3*image_xscale
		}
		npc[3]=instance_create_layer(896, 224, layerInst[3], obj_thread_enemy01)
		with npc[3] {
			scr_sprite_change(spr_enemy01_walk, 0, 0.2)
			image_xscale=1
			hspeed=3*image_xscale
		}
		npc[4]=instance_create_layer(720, 224, layerInst[3], obj_thread_enemy01)
		with npc[4] {
			scr_sprite_change(spr_enemy01_walk, 0, 0.2)
			image_xscale=1
			hspeed=3*image_xscale
		}
		action=8.1
	}
	if action==8.1 {
		var allok=true
		with npc[2] {
			if hspeed!=0 {
				allok=false
				if x<=1392 {
					scr_sprite_change(spr_enemy01_shoot, 0, 0.25)
					hspeed=0
					x=1392
				} 
			}
		}
		with npc[3] {
			if hspeed!=0 {
				allok=false
				if x>=1088 {
					scr_sprite_change(spr_enemy01_shoot, 0, 0.25)
					hspeed=0
					x=1088
				} 
			}
		}
		with npc[4] {
			if hspeed!=0 {
				allok=false
				if x>=1008 {
					scr_sprite_change(spr_enemy01_shoot, 0, 0.25)
					hspeed=0
					x=1008
				} 
			}
		}
		if allok {
			action=9
			time=60
		}
	}
	thread_talk_execute(prg, 9, 10, 30)
	//腰带闪光
	if action==10 && time==0 {
		npc[0]=instance_create_depth(obj_player.x, obj_player.y+16, obj_player.depth-10, obj_player_flash_circle)
		with npc[0] {
			rad=wave
		}
		action=11
		time=60
	}
	thread_talk_execute(prg, 11, 12, 30)
	if action==12 && time==0 {
		npc[0].radxscsp=1.5
		audio_bgm_stop()
		action=12.1
		time=60
	}
	if action==12.1 && time==0 {
		scr_sound_play(se_player_change_flash)
		scr_view_transition(0, 0)
		action=12.2
	}
	if action==12.2 {
		if scr_view_transition_Isover(0) {
			scr_view_transition(0, 2)
			instance_destroy(obj_player_flash_circle)
			scr_model_get(PLAYER_MODEL.ARMOR)
			scr_item_gain(ITEM.C, ITEMC.esSaber)
			global.model=PLAYER_MODEL.ARMOR
			global.player_hp=global.player_hp_up
			action=12.3
			time=30
		}
	}
	if action==12.3 && time==0 {
		with obj_player {
			scr_sprite_change(SS_idle, 0, 0)
			walk=0
			idle=0
		}
		//开始蓄力
		global.sub_state=2
		codekey_sub(1)
		obj_player.charge[2]=obj_player.charge_max
		action=12.4
		time=30
	}
	if action==12.4 && time==0 {
		scr_view_transition(0, 1)
		global.operate=1
		obj_player.unoperate_injure=true
		obj_player.operate_charge_release=true
		action=20
		time=60
	}
	//灭除所有敌人
	if action==20 && time==0 {
		//右侧杂兵开枪
		npc[2].shoot()
		action=20.1
	}
	//玩家向右冲刺
	if action==20.1 {
		codekey_Hdirect(1)
		codekey_dash(1)
		action=20.2
	}
	//砍杀右侧地面杂兵
	if action==20.2 && time==0 {
		if obj_player.x>=1312 {
			//空中杂兵开枪
			npc[1].shoot()
			codekey_attack(1)
			action=20.3
			time=1
		}
	}
	if action==20.3 && time==0 {
		codekey_attack(0)
		codekey_Hdirect(0)
		codekey_dash(0)
		action=20.4
	}
	if action==20.4 {
		if obj_player.walk==0 {
			obj_player.image_xscale=-1
			action=20.5
			time=20
		}
	}
	if action==20.5 && time==0 {
		//左侧杂兵开枪
		npc[3].shoot()
		//左侧杂兵开枪
		npc[4].shoot()
		codekey_Hdirect(-1)
		codekey_jump(1)
		codekey_dash(1)
		action=20.6
		time=1
	}
	if action==20.6 && time==0 {
		//if obj_player.x<=1344 {
		codekey_attack(1)
		action=20.7
		time=5
	}
	if action==20.7 && time==0 {
		codekey_attack(0)
		action=20.8
	}
	if action==20.8 {
		if obj_player.hsp!=0 {
			if obj_player.x<=1216 {
				codekey_Hdirect(0)
				scr_room_player_xstop(1216)
			}
		}
		if obj_player.jump==0 {
			codekey_Hdirect(0)
			codekey_jump(0)
			codekey_dash(0)
			//发射蓄力炮
			codekey_sub(0)
			action=20.9
			time=60
		}
	}
	if action==20.9 && time==0 {
		obj_player.unoperate_injure=false
		obj_player.operate_charge_release=false
		audio_bgm_change(bgm_area0)
		action=21
		time=30
	}
	//CG展示
	if action==21 && time==0 {
		scr_view_transition(1, 0)
		action=21.1
	}
	if action==21.1 {
		if scr_view_transition_Isover(1) {
			npc[0]=instance_create_depth(0, -1080, -110, obj_ui_cg) 
			with npc[0] image_index=0
			npc[1]=instance_create_depth(0, 0, -100+1, obj_ui_cg) 
			with npc[1] scr_sprite_change(spr_bgs_start_1, 0, 0)
			npc[2]=instance_create_depth(0, 0, -100+2, obj_ui_cg) 
			with npc[2] scr_sprite_change(spr_bgs_start_2, 0, 0)
			npc[3]=instance_create_depth(0, 0, -100+3, obj_ui_cg) 
			with npc[3] scr_sprite_change(spr_bgs_start_3, 0, 0)
			npc[4]=instance_create_depth(0, 0, -100+4, obj_ui_cg) 
			with npc[4] scr_sprite_change(spr_bgs_start_4, 0, 0)
			npc[5]=instance_create_depth(0, 0, -100+5, obj_ui_cg) 
			with npc[5] scr_sprite_change(spr_bgs_start_5, 0, 0)
			npc[6]=instance_create_depth(0, 0, -100+6, obj_ui_cg) 
			with npc[6] scr_sprite_change(spr_bgs_start_6, 0, 0)
			action=21.2
			time=60
		}
	}
	if action==21.2 && time==0 {
		action=21.3
		time=180
		npc[0].vspeed=960/time
		npc[1].vspeed=360/time
		npc[2].vspeed=270/time
		npc[3].vspeed=180/time
		npc[4].vspeed=90/time
	}
	if action==21.3 && time==0 {
		for(var i=0;i<7;i++) {
			npc[i].vspeed=0
		}
		action=22
		time=120
	}
	thread_talk_execute(prg, 22, 23, 120)
	//CG结束
	if action==23 && time==0 {
		scr_view_transition(1, 0)
		action=23.1
	}
	if action==23.1 {
		if scr_view_transition_Isover(1) {
			instance_destroy(obj_ui_cg)
			global.view_control=0
			obj_player.image_xscale=1
			action=24
			time=60
		}
	}
	thread_talk_execute(prg, 24, 25, 60)
	if action=25 && time==0 {
		global.sub_type=temp[0]
		global.main_sub_exchange[PLAYER_MODEL.ARMOR]=temp[1]
		scr_thread_over(prg)
		scr_room_freedom()
		action=0
	}
	///@skip
	if scr_can_skip(prg) {
		scr_skip(1, bgm_area0, 1, 1216, 224, prg, 0, 0)
		global.sub_type=temp[0]
		global.main_sub_exchange[PLAYER_MODEL.ARMOR]=temp[1]
		scr_model_get(PLAYER_MODEL.ARMOR)
		scr_item_gain(ITEM.C, ITEMC.esSaber)
		global.model=PLAYER_MODEL.ARMOR
		instance_destroy(obj_bullet)
		instance_destroy(obj_thread_enemy01)
		instance_destroy(obj_thread_enemy05)
		instance_destroy(obj_player_bullet)
		global.view_control=0
		scr_room_freedom()
	}
}
#endregion
}