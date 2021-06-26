event_inherited();
if sprite_index==spr_player_armor_bullet_charge02_st_fire {
	scr_sprite_change(spr_player_armor_bullet_charge02_fire, 0, -2)
	x+=40*image_xscale
	hspeed=12*image_xscale
}
#region 燕逐晓本体
else if sprite_index==spr_boss_yanzx_chant {
	scr_sprite_change(spr_boss_yanzx_chant_ing, 0, 0.25)
	action=0
}
else if sprite_index==spr_boss_yanzx_app {
	scr_sprite_change(spr_boss_yanzx_chant, 0, 0.25)
}
else if sprite_index==spr_boss_yanzx_dis {
	instance_destroy()
}
#endregion
#region 燕逐晓召唤子弹
else if sprite_index==spr_boss_yanzx_bullet_fire_st {
	scr_sprite_change(spr_boss_yanzx_bullet_fire, 0, 0.25)
	speed=8
} 
else if sprite_index==spr_boss_yanzx_bullet_fire_ed {
	instance_destroy()
}
#endregion