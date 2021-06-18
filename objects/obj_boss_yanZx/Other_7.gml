event_inherited();
#region 闪现
if sprite_index==spr_boss_yanzx_app {
	scr_sprite_change(spr_boss_yanzx_idle, 0, 0.25)
	can_dmg=true
	have_dmg=true
}
else if sprite_index==spr_boss_yanzx_dis {
	scr_sprite_change(spr_boss_yanzx_none, 0, 0)
	can_dmg=false
	have_dmg=false
}
#endregion
#region 斩击
else if sprite_index==spr_boss_yanzx_chop1 {
	scr_sprite_change(-2, image_number-0.5, 0)
	can_dmg=true
	have_dmg=true
}
else if sprite_index==spr_boss_yanzx_chop2 {
	scr_sprite_change(-2, image_number-0.5, 0)
	can_dmg=true
	have_dmg=true
}
else if sprite_index==spr_boss_yanzx_chop3 {
	scr_sprite_change(-2, image_number-0.5, 0)
	can_dmg=true
	have_dmg=true
}
#endregion
#region 咏唱
else if sprite_index==spr_boss_yanzx_chant {
	scr_sprite_change(spr_boss_yanzx_chant_ing, 0, 0.25)
}
#endregion
#region 火焰踢
else if sprite_index==spr_boss_yanzx_kick_st {
	scr_sprite_change(-2, image_number-2, 0.5)
}
else if sprite_index==spr_boss_yanzx_kick {
	scr_sprite_change(-2, image_number-0.5, 0)
}
else if sprite_index==spr_boss_yanzx_kick_ed {
	scr_sprite_change(spr_boss_yanzx_idle, 0, 0.25)
}
#endregion
#region 持枪
else if sprite_index==spr_boss_yanzx_gun_app {
	scr_sprite_change(-2, image_number-0.5, 0)
}
else if sprite_index==spr_boss_yanzx_gun_raise {
	scr_sprite_change(-2, image_number-0.5, 0)
}
else if sprite_index==spr_boss_yanzx_gun_ed {
	scr_sprite_change(spr_boss_yanzx_gun_raise, 3.5, 0)
}
else if sprite_index==spr_boss_yanzx_throw {
	scr_sprite_change(-2, image_number-0.5, 0)
}
#endregion