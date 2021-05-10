/// @desc 演绎处理
scr_menu_stop()
if !scr_menu_trem() exit
#region BOSS战部分
if action==1000 {
	instance_create_depth(x, y, obj_view.depth-1, obj_ui_warning)
	action=1001
} else if action==1001 {
	if !instance_exists(obj_ui_warning) {
		global.boss_war=1
		action=1002
		time=30
	}
} else if action==1002 && time==0 {
	scr_room_freedom()
	audio_bgm_change(bosswar_bgm)
	action=1003
} 
//自由活动
else if action==1003 {
	if global.player_hp<=0 {
		global.boss_war=0
		action=1100
	} else if global.boss_hp<=0 {
		global.boss_war=0
		action=1200
	}
}
//玩家死亡
//else if action==1150 {
//	global.boss_war=0
//	obj_staff.player_death_action=1
//	action=1151
//}
//BOSS死亡
else if action==1200 {
	//玩家脚下有可以站立的地面时才结束战斗
	if scr_room_player_ground_under(){
		global.player_operate=0
		scr_room_player_needfall()
		audio_bgm_stop()
		action=1201
	}
} else if action==1201 {
	if global.player_hp<=0 {
		global.boss_war=0
		action=1100
	} else if obj_player.jump==0 
	&& obj_player.walk==0 {
		global.operate=0
		action=1202
		time=30
	}
} else if action==1202 && time==0 {
	action=1203
}
#endregion

scr_room_beginstep_test()