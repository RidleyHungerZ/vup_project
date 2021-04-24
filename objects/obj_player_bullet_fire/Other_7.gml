event_inherited();
if sprite_index==spr_player_armor_bullet_charge02_st_fire {
	scr_sprite_change(spr_player_armor_bullet_charge02_fire, 0, -2)
	x+=40*image_xscale
	hspeed=12*image_xscale
}