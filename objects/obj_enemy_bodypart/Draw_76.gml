/// @desc 跟随设置
if(view_current!=0) exit;
//跟随
if follow_xscale 
	image_xscale=enemy.image_xscale
if follow_yscale 
	image_yscale=enemy.image_yscale
if follow_angle
	image_angle=enemy.image_angle
if follow_blend
	image_blend=enemy.image_blend
if follow_alpha
	image_alpha=enemy.image_alpha
if follow {
	var shiftxy=shift_xy_angle(shift_x*image_xscale, shift_y*image_yscale, enemy.image_angle+shift_angle)
	x=enemy.x+shiftxy.x+shift_xfix
	y=enemy.y+shiftxy.y+shift_yfix
}