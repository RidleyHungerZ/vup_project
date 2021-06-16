event_inherited();
if(!scr_menu_trem()) exit;
if(undamage!=0) {
	var saber=collision_rectangle(bbox_right,bbox_bottom,bbox_left,bbox_top,obj_player_saber,1,1),
		bullet=collision_rectangle(bbox_right,bbox_bottom,bbox_left,bbox_top,obj_player_bullet,1,1)
	if(!saber && !bullet)
		undamage=0;
	else if(saber) {
		if(saber.attack==0) 
			undamage=0;
	}
	else if(bullet) {
		if(bullet.attack==0) 
			undamage=0;
	}
}