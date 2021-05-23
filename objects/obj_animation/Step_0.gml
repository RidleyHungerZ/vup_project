scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
if death_time>0 death_time--
else if death_time==0 
	instance_destroy()