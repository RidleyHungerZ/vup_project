if enemy.sprite_index==spr_boss_cjc_forearm_frt {
	scr_sprite_change(spr_boss_cjc_crawcen_idle_frt, 0, 0)
	action_type=0
}
else if enemy.sprite_index==spr_boss_cjc_forearm_back {
	scr_sprite_change(spr_boss_cjc_crawcen_idle_back, 0, 0)
	action_type=1
}
//damage_agent=enemy
event_inherited();
if !scr_menu_trem() exit