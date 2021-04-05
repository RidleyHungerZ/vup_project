event_inherited();
if(!scr_menu_trem()) exit;
if place_meeting(x, y, obj_ground)
|| place_meeting(x, y, obj_sink) {
	hit_ground(x, y, true)
} else if hit>0 {
	instance_destroy()
} else if hit==-1 {
	hit_invalid(x, y, true)
}