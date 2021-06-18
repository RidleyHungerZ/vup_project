event_inherited();
undm=1
view_edge=-1
boom_number=9

mask_part=noone //爪子覆盖部分
action_type=-1 //0横抓 1竖抓

shift_xorg=0

catch_player=false //抓到玩家
catch_block=noone //抓住的箱子
catch_block_xof=0
catch_block_yof=0

deathBoomPart = function() {
	scr_enemy_boom_number();
	//scr_enemy_boompart(partspr);
	instance_destroy();
}
#region 抓人
//准备抓人
catchReady = function() {
	action=1
}
//抓人伸出
catchExtend = function() {
	action=10
}
//抓人释放
catchRelease = function() {
	action=40
}
//抓人结束，爪子转回
catchTurned = function() {
	action=50
}
#endregion
#region 抓箱子
//拿到箱子
blockReady = function(block) {
	if block==obj_boss_caoJc_block_bomb01 {
		scr_sprite_change(spr_boss_cjc_crawcen_catch_get2_back, 0, 0)
		catch_block_xof=80
		catch_block_yof=0
		catch_block=instance_create_depth(
			x+catch_block_xof*image_xscale, y+catch_block_yof*image_yscale, depth-10, obj_boss_caoJc_block_bomb01)
	} else if block==obj_boss_caoJc_block_bomb02 {
		scr_sprite_change(spr_boss_cjc_crawcen_catch_get_back, 0, 0)
		catch_block_xof=56
		catch_block_yof=0
		catch_block=instance_create_depth(
			x+catch_block_xof*image_xscale, y+catch_block_yof*image_yscale, depth-10, obj_boss_caoJc_block_bomb02)
	}
	with catch_block {
		use_move_sys=false
	}
	action=1
}
//释放箱子
blockRelease = function() {
	action=10
}
//结束，爪子转回
blockTurned = function() {
	action=20
}
blockExists = function() {
	return instance_exists(catch_block)
}
#endregion