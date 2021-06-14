/// @desc 绘制自身
event_inherited();
if sprite_index==spr_player_armor_jump_double {
	var dblightspr=spr_player_armor_jump_dblight
	if global.model=PLAYER_MODEL.YANZX || global.model=PLAYER_MODEL.fire2 
		dblightspr=spr_player_armor_jump_dblight_fire
	else if global.model=PLAYER_MODEL.ice1 || global.model=PLAYER_MODEL.ICE 
		dblightspr=spr_player_armor_jump_dblight_ice
	else if global.model=PLAYER_MODEL.elec || global.model=PLAYER_MODEL.TAILS 
		dblightspr=spr_player_armor_jump_dblight_elec
	draw_sprite_ext(dblightspr, image_index, x, y, 
					image_xscale, image_yscale, 
					image_angle, image_blend, image_alpha)
}