/// @desc 跟随设置
if(view_current!=0) exit;
shift_x=shift_xorg+enemy.exrod_len
event_inherited();
//抓到玩家
if catch_player {
	obj_player.x=x+32*image_xscale
	obj_player.y=y
}
//抓着箱子
if blockExists() {
	catch_block.x=x+catch_block_xof*image_xscale
	catch_block.y=y+catch_block_yof*image_yscale
}