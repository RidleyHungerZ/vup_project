/// @desc 开始BOSS战
/// @arg warbgm 开战bgm
/// @arg resbgm 重来bgm
/// @arg failfun 失败执行方法
function scr_room_bosswar_start(warbgm, resbgm, failfun) {
	action=1000
	bosswar_bgm=warbgm
	restart_bgm=resbgm
	bosswar_fail=failfun
}
/// @desc BOSS战进行中
function scr_room_bosswar_inwar() {
	return action==1004
}
/// @desc BOSS战玩家是否死亡
function scr_room_bosswar_player_hp0() {
	return action==1100
}
/// @desc BOSS战BOSS是否死亡
function scr_room_bosswar_boss_hp0() {
	return action==1203
}
/// @desc BOSS战BOSS是否死亡
function scr_room_bosswar_boss_boomstart() {
	with obj_boss {
		if is_war_boss && boom==0
			boom_start()
	}
}
/// @desc BOSS战BOSS是否死亡
function scr_room_bosswar_boss_boomover() {
	with obj_boss {
		if is_war_boss && boom<0
			return true
	}
	return false
}
/// @desc 进入死亡后黑屏
function scr_room_boss_failover() {
	action=1150
}