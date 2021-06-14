event_inherited();
if(!scr_menu_trem()) exit;
if action==0 {
	action=1
	time=240
} else if action==1 {
	if instance_exists(obj_player)
		direction=direction_goto([obj_player.x,obj_player.y], dirspeed, direction)
	if time==0 {
		action=2
	}
} else if action==2 {
	if !scr_in_view(64) instance_destroy()
}

