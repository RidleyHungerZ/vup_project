scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
if view_edge>0 && !scr_in_view(view_edge) 
	instance_destroy()