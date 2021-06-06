event_inherited();
if(!scr_menu_trem()) exit;
if sprite_index==spr_boss_cjc_arm_frt {
	if keyboard_check(ord("1")) arm_angle++
	else if keyboard_check(ord("2")) arm_angle--
} else if sprite_index==spr_boss_cjc_arm_back {
	if keyboard_check(ord("3")) arm_angle++
	else if keyboard_check(ord("4")) arm_angle--
}
arm_angle=clamp(arm_angle, 0, 120)