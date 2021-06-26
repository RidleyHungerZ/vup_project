event_inherited();
if sprite_index==spr_enemy10_attack {
	scr_sprite_change(-2, image_number-0.5, 0)
} else if sprite_index==spr_enemy10_attack_ed {
	scr_sprite_change(spr_enemy10_idle, 0, 0)
}