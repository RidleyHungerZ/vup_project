/// @desc 玩家死亡
if player_death_action=2{
	obj_player.death_cliff=false;
	audio_se_stop_all()
	scr_sound_stopall_dpl()
	with obj_room {
		action=0
	}
	//命归零
	if false { //global.player_life<=0 && 
		//global.game_start=0
		//global.operate=0
		//global.player_operate=0
		//scr_view_transition(1,1)
		//player_death_action=0
		//global.player_hp=global.player_hp_up
		//var old=obj_player.id,
		//	neo=instance_create_depth(old.x,old.y,old.depth,old.object_index)
		//instance_destroy(old)
		////gameover选择界面
		//scr_room_goto(room_gameover)
		//audio_bgm_change(bgm_b7)
	}
	//重来
	else{
		player_death_action=3
		alarm[0]=1
		global.operate=0.1
		global.player_operate=1
		global.player_hp=global.player_hp_up
		global.player_mp=global.player_mp_up
		global.player_support=0
		global.boss_hp=0
		//global.player_life-=1
		with obj_player{
			x=global.re_x
			y=global.re_y-GRDY
			image_xscale=global.re_xscale
			scr_sprite_change(SS_idle,0,0.25)
		}
		//scr_view_set_with_player()
		room_restart()
	}
	global.boss_war=0
	global.view_xcen_shift=0//镜头中心偏移
	global.view_ycen_shift=0//镜头中心偏移
	global.stop=0
	global.menu=0
	//对话
	//global.talk=0
	//重置小对话
	//with obj_view0 event_user(15)
}
else if player_death_action=3{
	scr_view_transition(1,1)
	if audio_exists(obj_room.restart_bgm) {
		audio_bgm_change(obj_room.restart_bgm)
		obj_room.restart_bgm=noone
	} else audio_bgm_change(global.music_now)
	player_death_action=0
	global.operate=0.5
	global.player_operate=1
}