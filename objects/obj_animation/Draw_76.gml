/// @desc 跟随设置
if(view_current!=0) exit;
if instance_exists(follow) {
	if follow_sprite
		sprite_index=follow.sprite_index
	if follow_index
		image_index=follow.image_index
	if follow_xscale 
		image_xscale=follow.image_xscale
	if follow_yscale 
		image_yscale=follow.image_yscale
	if follow_angle
		image_angle=follow.image_angle
	if follow_blend
		image_blend=follow.image_blend
	if follow_alpha
		image_alpha=follow.image_alpha
	
	var shiftxy=shift_xy_angle(shift_x*image_xscale, shift_y*image_yscale, follow.image_angle+shift_angle)
	x=follow.x+shiftxy.x+shift_xfix
	y=follow.y+shiftxy.y+shift_yfix
} else if follow!=noone {
	instance_destroy()
}