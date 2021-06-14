event_inherited();
if sprite_index==spr_player_armor_bullet_charge02_st_elec {
	scr_sprite_change(spr_player_armor_bullet_charge02_elec, 0, -2)
	x+=40*image_xscale
	hspeed=12*image_xscale
} else if sprite_index==spr_player_armor_bullet_elec_laser_break {
	instance_destroy()
} else if sprite_index==spr_player_armor_bullet_elec_laser_line {
	instance_destroy()
}