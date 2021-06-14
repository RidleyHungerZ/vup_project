event_inherited();
if(!scr_menu_trem()) exit;
if(jump==10){
	jump=11
	time=30
}
if(jump==11) {
	image_alpha=global.fps_30;
	if time==0 instance_destroy()
}