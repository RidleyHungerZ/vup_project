if(view_current!=0) exit;
//镭射光线
if sprite_index==spr_player_armor_bullet_elec_laser_line {
	var sprw=sprite_get_width(sprite_index),
		len=image_xscale*sprw,
		drx=x,
		dry=y,
		drlen=0;
	draw_sprite_ext(spr_player_armor_bullet_elec_laser_top, image_index, drx, dry, 1, image_yscale, 
					image_angle, image_blend, image_alpha)
	drlen+=sprite_get_width(spr_player_armor_bullet_elec_laser_top)
	while drlen<len {
		var shiftendxy=shift_xy_angle(drlen, 0, image_angle);
		drx=shiftendxy.x
		dry=shiftendxy.y
		drlen+=sprw
		draw_sprite_ext(spr_player_armor_bullet_elec_laser_line, image_index, x+drx, y+dry, 1, image_yscale, 
						image_angle, image_blend, image_alpha)
	}
} else 
	event_inherited();