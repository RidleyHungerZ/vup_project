event_inherited();
follow_angle=false //是否跟随角度
undm=1
image_angle=0
draw_yscale=image_yscale
arm_angle=0
armlen=sprite_get_width(sprite_index)-2*9

drawSelf = function() {
	var yscale=image_yscale
	var shiftxy=shift_xy_angle(image_xscale*armlen, 0, image_angle),
		circlespr=spr_boss_cjc_arm_circle_frt,
		circlespr2=spr_boss_cjc_arm_circle_frt2;
	if sprite_index==spr_boss_cjc_arm_back {
		circlespr=spr_boss_cjc_arm_circle_back;
		circlespr2=spr_boss_cjc_arm_circle_back2;
	}
	//后圆章
	draw_sprite_ext(circlespr2, 0, x, y, 
					image_xscale, 1, 0, image_blend, image_alpha);
	draw_sprite_ext(circlespr2, 0, x+shiftxy.x, y+shiftxy.y, 
					image_xscale, 1, 0, image_blend, image_alpha);
	//本体
	image_yscale=draw_yscale
	draw_self()
	//前圆章
	draw_sprite_ext(circlespr, 0, x, y, 
					image_xscale, 1, 0, image_blend, image_alpha);
	draw_sprite_ext(circlespr, 0, x+shiftxy.x, y+shiftxy.y, 
					image_xscale, 1, 0, image_blend, image_alpha);
	image_yscale=yscale
}

#region 伸缩臂
forearm=instance_create_depth(x, y, depth-10, obj_boss_caoJc_forearm)
with forearm {
	enemy=other.id
	shift_x=other.armlen
	shift_y=0
}
#endregion