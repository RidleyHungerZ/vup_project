//判断自己是前是后
if enemy.sprite_index==spr_boss_cjc_arm_frt
	scr_sprite_change(spr_boss_cjc_forearm_frt, 0, 0)
else if enemy.sprite_index==spr_boss_cjc_arm_back
	scr_sprite_change(spr_boss_cjc_forearm_back, 0, 0)
event_inherited();
if(!scr_menu_trem()) exit;
if hp<=0 {
	if instance_exists(craw) 
		craw.deathBoomPart()
	deathBoomPart()
}


if sprite_index==spr_boss_cjc_forearm_frt {
	if keyboard_check(ord("5")) exrod_len+=1
	else if keyboard_check(ord("6")) exrod_len-=1
} else if sprite_index==spr_boss_cjc_forearm_back {
	if keyboard_check(ord("7")) exrod_len+=1
	else if keyboard_check(ord("8")) exrod_len-=1
}
exrod_len=clamp(exrod_len, 0, 384)