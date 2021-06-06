event_inherited();
if(!scr_menu_trem()) exit;
if(scr_boss_isget(bs) || hp<=0) exit;
if(!is_war_boss) exit;
//朝地面喷火
if firedir==1 {
	var shiftxy=shift_xy_angle(76*image_xscale, 31*image_yscale, image_angle)
	vfire(x+shiftxy.x, y+shiftxy.y)
}