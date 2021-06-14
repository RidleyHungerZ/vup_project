event_inherited();
if(!scr_menu_trem()) exit;
if sprite_index==spr_player_armor_bullet_ice_cone {
	if action==0 {
		var icnx=lengthdir_x(iceconelen, direction),
			icny=lengthdir_y(iceconelen, direction);
		x=obj_player.x+icnx
		y=obj_player.y+icny
	}
}