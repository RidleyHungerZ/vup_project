event_inherited();
if sprite_index==spr_enemy08_trans_up {
	scr_sprite_change(spr_enemy08_trans_over, 0, 0.25)
	image_xscale*=-1
	y-=16
} else if sprite_index==spr_enemy08_trans_down {
	scr_sprite_change(spr_enemy08_trans_over, 0, 0.25)
	image_xscale*=-1
	y+=16
} else if sprite_index==spr_enemy08_trans_over {
	scr_sprite_change(spr_enemy08_idle, 0, 0.25)
	action=0
}