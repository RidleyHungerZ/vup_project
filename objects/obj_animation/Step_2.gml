event_inherited()
if !scr_menu_trem() exit
if instance_exists(follow) {
	x=follow.x+follow_shiftxy[0]
	y=follow.y+follow_shiftxy[1]
}