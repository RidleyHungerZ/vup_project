event_inherited();
if sprite_index==spr_enemy01_shoot {
	scr_sprite_change(-2, image_number-0.5, 0)
} else if sprite_index==spr_enemy01_shoot2 {
	scr_sprite_change(-2, image_number-0.5, 0)
} else if sprite_index==spr_enemy01_shooted {
	scr_sprite_change(spr_enemy01_idle, 0, 0)
}