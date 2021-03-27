/// @desc 玩家落地调整
function scr_player_fallover_adjust() {
	if image_yscale=1 y=ceil(y)
	if image_yscale=-1 y=floor(y)
	if !collision_rectangle(bbox_right,bbox_bottom+GRDY-4,bbox_left,bbox_top+4,obj_ground,1,1){
		//离地降位
		while !place_meeting(x,y+GRDY+1*image_yscale,obj_ground) 
			&& place_meeting(x,y+GRDY+4*image_yscale,obj_ground)
			y+=image_yscale
		while(!collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY,obj_floor,1,1)
			&& collision_rectangle(bbox_right,bbox_bottom+GRDY+2,bbox_left,bbox_bottom+GRDY+1,obj_floor,1,1)
			&& image_yscale=1)
			||(!collision_rectangle(bbox_right,bbox_top-GRDY,bbox_left,bbox_top-GRDY-1,obj_floor,1,1)
			&& collision_rectangle(bbox_right,bbox_top-GRDY-1,bbox_left,bbox_top-GRDY-2,obj_floor,1,1)
			&& image_yscale=-1)
			y+=image_yscale
		//入地抬升
		while collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_sink,1,1)
			&&!collision_rectangle(bbox_right,bbox_bottom+GRDY-4,bbox_left,bbox_top,obj_sink,1,1)
			y-=image_yscale
		while place_meeting(x,y+GRDY,obj_ground)
			y-=image_yscale
		while(collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-1,obj_floor,1,1) && image_yscale=1)
			||(collision_rectangle(bbox_right,bbox_top-GRDY+1,bbox_left,bbox_top-GRDY,obj_floor,1,1) && image_yscale=-1)
			y-=image_yscale
	}	
	//清空半透板记录
	scr_player_floordown_clear()


}
