event_inherited();
if(!scr_menu_trem()) exit;
#region 大蓄力弹
if in(sprite_index, [spr_player_armor_bullet_charge02_fire]) {
	if place_meeting(x, y, obj_ground) 
	|| place_meeting(x, y, obj_sink) {
		hit_ground(x, y, true)
	} else if hit==1 {
		instance_destroy()
	} else if hit==-1 {
		hit_invalid(x, y, true)
	}
}
#endregion