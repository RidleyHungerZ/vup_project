if view_current!=0 exit
var sprCenName=sprite_get_name(sprite_index)+"_cen",
	sprCen=asset_get_index(sprCenName);
if sprite_exists(sprCen) {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, image_yscale, 
					image_angle, image_blend, image_alpha)
	var lenx=sprite_get_width(sprite_index),
		shift_cenxy=shift_xy_angle(lenx, 0, image_angle);
	draw_sprite_ext(sprCen, image_index, x+shift_cenxy.x, y+shift_cenxy.y, image_xscale-1, image_yscale, 
					image_angle, image_blend, image_alpha)
} else {
	draw_self()
}