event_inherited();
if !scr_menu_trem() exit
//正常
if icon==0 {
	if direction=0 
		scr_sprite_change(spr_flyobj_ground01_right, -2, 0.25)
	else if direction=180 
		scr_sprite_change(spr_flyobj_ground01_left, -2, 0.25)
	else if direction=90 
		scr_sprite_change(spr_flyobj_ground01_up, -2, 0.25)
	else if direction=270 
		scr_sprite_change(spr_flyobj_ground01_down, -2, 0.25)
	else
		scr_sprite_change(spr_flyobj_ground01_idle, -2, 0.1)
} 
//警告
else if icon=1 {
	scr_sprite_change(spr_flyobj_ground01_warn, -2, 0.1)
} 
//关机
else if icon=-1 {
	scr_sprite_change(spr_flyobj_ground01_off, 0, 0)
} 
//错误
else if icon=-2 {
	scr_sprite_change(spr_flyobj_ground01_error, -2, 0.25)
}