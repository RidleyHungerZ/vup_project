event_inherited();
if(!scr_menu_trem()) exit;
if(scr_boss_isget(bs)) exit;
if(!is_war_boss) exit;
//朝地面喷火
if firedir==1 {
	var shiftxy=shift_xy_angle(76*image_xscale, 31*image_yscale, image_angle)
	vfire(x+shiftxy.x, y+shiftxy.y)
}
if(hp<=0) exit;
//漂浮
if float {
	y+=4*(pi/60)*sin(global.fps_currmenu*pi/60)
}