event_inherited();
#region 射击动作
if sprite_index == SS_idle_shoot{
	scr_sprite_change(-2,2,0)
}
else if sprite_index == SS_walk_shoot{
	scr_sprite_change(-2,1,-2)
}
else if sprite_index == SS_walk_shoot1{
	scr_sprite_change(-2,1,-2)
}
else if sprite_index == SS_walk_shoot2{
	scr_sprite_change(-2,1,-2)
}
else if sprite_index == SS_jump_shoot{
	scr_sprite_change(-2,2,-2)
}
else if sprite_index == SS_fall_shoot{
	scr_sprite_change(-2,2,-2)
}
else if sprite_index == SS_dash_shoot{
	scr_sprite_change(-2,2,-2)
}
#endregion
#region 剑斩动作
else if sprite_index == spr_player_armor_idle_chop1 {
	scr_sprite_change(spr_player_armor_idle_choped, 0, 0.25)
	saber_combo=0
	walk=0
}
else if sprite_index == spr_player_armor_idle_chop2 {
	scr_sprite_change(spr_player_armor_idle_choped, 0, 0.25)
	saber_combo=0
	walk=0
}
else if sprite_index == spr_player_armor_idle_chop3 {
	scr_sprite_change(spr_player_armor_idle_choped, 0, 0.25)
	saber_combo=0
	walk=0
}
else if sprite_index == spr_player_armor_idle_choped {
	scr_sprite_change(SS_idle, 0, 0.25)
}
#endregion
#region 变回人形
else if sprite_index==spr_player_armor_change_idle_pull_st{
	scr_sprite_change(-2,image_number-0.5,0);
}
else if sprite_index==spr_player_armor_change_idle_pull{
	var neo=instance_create_depth(x, y, depth, obj_staff.player[PLAYER_MODEL.HU])
	with neo {
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
		injure_t=other.injure_t
		scr_sprite_change(SS_idle, 0, 0)
		menu_imspd=0.25
		jump=0
	}
	instance_destroy()
	obj_staff.player_change_over=true
}
else if sprite_index==spr_player_armor_change_fall_pull_st{
	scr_sprite_change(-2,image_number-0.5,0);
}
else if sprite_index==spr_player_armor_change_fall_pull{
	var neo=instance_create_depth(x, y, depth, obj_staff.player[PLAYER_MODEL.HU])
	with neo {
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
		injure_t=other.injure_t
		scr_sprite_change(SS_fall, 0, 0)
		menu_imspd=0.25
		jump=2
		hsp=walkspd*hspd;
	}
	instance_destroy()
	obj_staff.player_change_over=true
}
#endregion