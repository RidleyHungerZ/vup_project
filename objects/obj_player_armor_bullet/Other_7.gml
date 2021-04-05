event_inherited();
if sprite_index==spr_player_armor_bullet_charge01_st {
	scr_sprite_change(spr_player_armor_bullet_charge01, 0, -2)
	x+=24*image_xscale
	hspeed=10*image_xscale
} else if sprite_index==spr_player_armor_bullet_charge02_st {
	scr_sprite_change(spr_player_armor_bullet_charge02, 0, -2)
	x+=40*image_xscale
	hspeed=12*image_xscale
}