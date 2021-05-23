event_inherited();
if sprite_index==spr_enemy03_shoot {
	scr_sprite_change(-2, image_number-0.5, 0)
} else if sprite_index==spr_enemy03_shoot2 {
	scr_sprite_change(spr_enemy03_idle, 0, 0)
} else if sprite_index==spr_enemy03_trans_st {
	scr_sprite_change(spr_enemy03_idle, 0, 0.25)
	image_xscale*=-1
} else if sprite_index==spr_enemy03_trans {
	scr_sprite_change(spr_enemy03_idle, 0, 0)
}