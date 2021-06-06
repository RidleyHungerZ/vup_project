event_inherited();
if sprite_index == spr_boss_cjc_lanuch1_open {
	scr_sprite_change(spr_boss_cjc_lanuch1_opening,0,0);
} else if sprite_index == spr_boss_cjc_lanuch1_close {
	scr_sprite_change(spr_boss_cjc_lanuch_closing,0,0);
	action=0
} else if sprite_index == spr_boss_cjc_lanuch2_open {
	scr_sprite_change(spr_boss_cjc_lanuch2_opening,0,0);
} else if sprite_index == spr_boss_cjc_lanuch2_close {
	scr_sprite_change(spr_boss_cjc_lanuch_closing,0,0);
	action=0
}