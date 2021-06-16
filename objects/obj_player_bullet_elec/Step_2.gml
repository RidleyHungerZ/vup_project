event_inherited();
if(!scr_menu_trem()) exit;
//镭射球击中的敌人在离开前依然会被攻击
if sprite_index==spr_player_armor_bullet_elec_laser_ball {
	var exclude_target2=exclude_target
	for(var i=0;i<array_length(exclude_target);i++) {
		var et=exclude_target[i]
		if !array_contains(et, skip_now_insts) {
			exclude_target2[i]=noone
		}
	}
	exclude_target=array_add_all(exclude_target2, skip_now_insts)
}
//被镭射光击中的敌人会被列入排除名单
else if sprite_index==spr_player_armor_bullet_elec_laser_line {
	exclude_target=array_add_all(exclude_target, skip_now_insts)
}