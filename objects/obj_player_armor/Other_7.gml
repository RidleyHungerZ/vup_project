event_inherited();
#region 专属动作
if sprite_index == spr_player_armor_jump_double {
	scr_sprite_change(SS_jumping, 0, 0.25)
}
else if sprite_index == spr_player_armor_kick_down_st {
	scr_sprite_change(-2, image_number-0.5, 0)
}
else if sprite_index == spr_player_armor_kick_fallover {
	//scr_sprite_change(-2, image_number-0.5, 0)
	scr_sprite_change(SS_squated, 0, 0.25)
}
else if sprite_index == spr_player_armor_kick_squat_jump {
	scr_sprite_change(spr_player_armor_tumbing, 0, 0.5)
}
else if sprite_index == spr_player_armor_kick_jump {
	scr_sprite_change(spr_player_armor_tumbing, 0, 0.5)
}
else if sprite_index == spr_player_armor_kick_craw_jump {
	scr_sprite_change(spr_player_armor_tumbing, 0, -0.5)
}
#endregion
#region 射击动作
else if sprite_index == SS_idle_shoot{
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
else if sprite_index == spr_player_armor_glide_shoot{
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
else if sprite_index == spr_player_armor_dash_chop {
	if jump==0 && walk==PYWALK.dashChop {
		scr_sprite_change(SS_dashed,0,0.25);
		dash=0;
		walk=0;
		hsp=0;
		dash_time_l=0;
		dash_time_r=0;
		dash_order_time_H=0;
	} else if jump==PYJUMP.airDashChop {
		scr_sprite_change(SS_jumped, 0, 0.25)
		jump=PYJUMP.fall
	}
}
//蓄力斩
else if sprite_index == spr_player_armor_idle_chop_charge {
	scr_sprite_change(spr_player_armor_idle_choped, 0, 0.25)
	saber_combo=0
	walk=0
}
//回旋斩
else if sprite_index == spr_player_armor_fall_chop {
	scr_sprite_change(spr_player_armor_fall_choped, 0, 0.25)
}
else if sprite_index == spr_player_armor_fall_spin_chop {
	if saber_combo>0 {
		scr_sprite_change(-2, 2, -2)
		scr_sound_play(se_player_armor_chop)
		saber_combo=0
		global.player_saber.span_comboing=true
	} else {
		scr_sprite_change(spr_player_armor_fall_spin_choped, 0, 0.5)
		global.player_saber.span_comboing=false
	}
}
else if sprite_index == spr_player_armor_fall_spin_choped {
	scr_sprite_change(spr_player_armor_fall_choped, 0, 0.25)
}
else if sprite_index == spr_player_armor_fall_choped {
	if jump==PYJUMP.jump scr_sprite_change(SS_jumping, 0, 0.25)
	else if jump==PYJUMP.glide scr_sprite_change(spr_player_armor_glide, 0, 0.25)
	else scr_sprite_change(SS_fall, 0, 0.25)
}
//升龙斩
else if sprite_index == spr_player_armor_fly_chop {
	scr_sprite_change(spr_player_armor_fly_choping, 0, 0.5)
	walk=0
	jump=PYJUMP.flyChop
	w_j=1
	hsp=2*hspd;
	vsp=-vspd;
	if global.player_saber.element==ELEMENTS.fire {
		vsp*=1.2
	}
}
else if sprite_index == spr_player_armor_fly_choping {
	scr_sprite_change(-2, image_number-3, -2)
	hsp=0
}
else if sprite_index == spr_player_armor_fly_choped {
	if jump==1 scr_sprite_change(SS_jumping, 0, 0.25)
	else scr_sprite_change(SS_fall, 0, 0.25)
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
#region 援护技能
else if sprite_index==spr_player_armor_support_idle_start {
	scr_sprite_change(-2, image_number-0.5, 0)
	menu_stop_use=true
} 
else if sprite_index==spr_player_armor_support_idle_ed {
	scr_sprite_change(SS_fall, 0, 0.25)
}
else if sprite_index==spr_player_armor_support_fall_start {
	scr_sprite_change(-2, image_number-0.5, 0)
	menu_stop_use=true
} 
else if sprite_index==spr_player_armor_support_fall_ed {
	scr_sprite_change(SS_fall, 0, 0.25)
}
#endregion
updateMask()