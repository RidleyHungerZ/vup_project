//BOSS代理伤害
event_inherited();
if(!scr_menu_trem()) exit;
shift_y+=1*sin(global.fps_currmenu*pi/2)
//向下喷射
if boss.firedir==1 {
	var shiftxy=shift_xy_angle(2*image_xscale, 26*image_yscale, image_angle)
	var _vfire=method(id, boss.vfire)
	_vfire(x+shiftxy.x, y+shiftxy.y)
} 