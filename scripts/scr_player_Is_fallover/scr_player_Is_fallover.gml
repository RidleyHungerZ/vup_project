/// @desc 是否落地
/// @arg left_off
/// @arg right_off
/// @arg yof_ground
/// @arg yof_sink
function scr_player_Is_fallover(left_off, right_off, yof_ground, yof_sink) {
	var flordown = collision_rectangle(bbox_right,bbox_bottom+GRDY+2,bbox_left,bbox_bottom+GRDY,obj_floor,1,1)
	if image_yscale=-1
		flordown = collision_rectangle(bbox_right,bbox_top-GRDY,bbox_left,bbox_top-GRDY-2,obj_floor,1,1)
	//记录的半透板
	if scr_player_floordown_exists(flordown) flordown=noone

	if collision_rectangle(bbox_right-right_off,bbox_bottom+GRDY+yof_ground*image_yscale,bbox_left+left_off,bbox_bottom+GRDY-4,obj_ground,1,1)
	|| collision_rectangle(bbox_right-right_off,bbox_bottom+GRDY+yof_sink*image_yscale,bbox_left+left_off,bbox_bottom+GRDY-4,obj_sink,1,1)
	||(image_yscale=1
	&& flordown
	&&!collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-1,obj_floor,1,1))
	||(image_yscale=-1
	&& flordown
	&&!collision_rectangle(bbox_right,bbox_top-GRDY+1,bbox_left,bbox_top-GRDY,obj_floor,1,1))
		return true
	else return false
}
