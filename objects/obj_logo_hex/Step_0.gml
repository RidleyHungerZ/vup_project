event_inherited();
if !scr_menu_trem() exit
if action==1 {
	action=2
	time=60
} else if action==2 {
	var blend=c_aqua
	image_blend=merge_color(c_white, blend, time/60)
	if time==0 {
		action=0
		image_blend=c_white
	}
}