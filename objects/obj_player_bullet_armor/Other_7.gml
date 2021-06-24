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
#region 援护技能
else if sprite_index==spr_player_support_armor_round_st {
	scr_sprite_change(spr_player_support_armor_round_ing, 0, -2)
} else if sprite_index==spr_player_support_armor_round_ed {
	instance_destroy()
}
#endregion