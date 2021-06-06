event_inherited();
undm=1
//damage_agent_boss=true

drawSelf=function() {
	//向下喷射火焰
	if boss.firedir==1 {
		var shiftxy=shift_xy_angle(2*image_xscale, 26*image_yscale, image_angle)
		draw_sprite_ext(spr_boss_cjc_motor_vfire, scr_image_index_fpscurr(true, 0.5, 3),
						x+shiftxy.x, y+shiftxy.y, image_xscale, image_yscale, 
						image_angle, image_blend, image_alpha)
	} 
	//向后喷射火焰
	else if boss.firedir==2 {
		var shiftxy=shift_xy_angle(-30*image_xscale, 8*image_yscale, image_angle)
		draw_sprite_ext(spr_boss_cjc_motor_hfire, scr_image_index_fpscurr(true, 0.5, 3),
						x+shiftxy.x, y+shiftxy.y, image_xscale, image_yscale, 
						image_angle, image_blend, image_alpha)
	}
	draw_self()
}