event_inherited();
if(!scr_menu_trem()) exit;
//被镭射光击中的敌人会被列入排除名单
if sprite_index==spr_player_armor_bullet_elec_laser_line {
	exclude_target=array_add_all(exclude_target, skip_now_insts)
}