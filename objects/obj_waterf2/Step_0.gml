scr_menu_stop()
if !scr_menu_trem() exit
if(!collision_rectangle(obj_player.bbox_right,obj_player.bbox_bottom,obj_player.bbox_left,obj_player.bbox_top,obj_water_top,1,1)) 
	instance_destroy();