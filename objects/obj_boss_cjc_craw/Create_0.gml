event_inherited();
undm=1
view_edge=-1
boom_number=9

action_type=0 //0横抓 1竖抓

shift_xorg=0

deathBoomPart = function() {
	scr_enemy_boom_number();
	//scr_enemy_boompart(partspr);
	instance_destroy();
}