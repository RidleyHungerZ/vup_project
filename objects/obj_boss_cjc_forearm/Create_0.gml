hp=96
event_inherited();
view_edge=-1
boom_number=9
//undm=1
follow_angle=false //是否跟随角度

exrod_len=0 //伸缩杆长度

drawSelf=function() {
	//后部分
	image_index=1 
	draw_self()
	//伸缩杆
	var exrodspr=spr_boss_cjc_exrod_frt,
		exrodsprw=sprite_get_width(exrodspr),
		exrshiftxy=shift_xy_angle(27*image_xscale, 9*image_yscale, image_angle),
		startxy={x : exrshiftxy.x, y : exrshiftxy.y};
	if sprite_index==spr_boss_cjc_forearm_back
		exrodspr=spr_boss_cjc_exrod_back
	draw_sprite_ext(exrodspr, 0, x+startxy.x, y+startxy.y, 
					image_xscale, image_yscale, image_angle, image_blend, image_alpha)		
	exrshiftxy=shift_xy_angle(exrodsprw*image_xscale, 0*image_yscale, image_angle);
	startxy.x+=exrshiftxy.x
	startxy.y+=exrshiftxy.y
	draw_sprite_ext(exrodspr, 1, x+startxy.x, y+startxy.y, 
					image_xscale*max(0, exrod_len-exrodsprw)/exrodsprw, 
					image_yscale, image_angle, image_blend, image_alpha)
	//主体
	image_index=0
	draw_self()
}
deathBoomPart = function() {
	scr_enemy_boom_number();
	//scr_enemy_boompart(partspr);
	instance_destroy();
}

craw=instance_create_depth(x, y, depth-10, obj_boss_cjc_craw)
with craw {
	enemy=other.id
	shift_xorg=28
	shift_y=10
}