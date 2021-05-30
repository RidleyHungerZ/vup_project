if action>=1 event_inherited()
else event_perform_object(obj_enemy, ev_step, ev_step_end)
if(!scr_menu_trem()) exit;
if hp<=0 exit
if view!=1{
	x=init_x
	y=init_y
	exit
}