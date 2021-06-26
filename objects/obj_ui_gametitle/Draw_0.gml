if view_current!=1 exit
if draw_page==0 {
	draw_sprite(spr_gametitle_kana, 0, VIEW_W_UI/2, VIEW_H_UI/2-32)
	scr_draw_text_ext(c_black, 1, 0, font_puhui_32, 0.5, 0.5, global.gametitle[0], 
		VIEW_W_UI/2, VIEW_H_UI/2+360, 1.5, 1.5, -1, -1, -1, 0)
} else if draw_page==1 {
	var circuit_x=VIEW_W_UI/2,
		circuit_y=VIEW_H_UI/2-64,
		circuit_scale=1.5,
		circuit_inx=0,
		circuit_count=sprite_get_number(spr_gametitle_vrs_bgs);
	if time==75 {
		scr_sound_menu_play(se_item_disk)
	}
	if between(time, 15, false, 75, false) {
		circuit_inx=(75-(time))/60*circuit_count;
	}
	draw_sprite_ext(spr_gametitle_vrs_bgs, circuit_inx, circuit_x, circuit_y, circuit_scale, circuit_scale, 0, c_white, 1)
	draw_sprite_ext(spr_gametitle_vrs, 0, circuit_x, circuit_y, circuit_scale, circuit_scale, 0, c_white, 1)
	draw_sprite_ext(spr_gametitle_vrs_frame, 0, circuit_x, circuit_y, circuit_scale, circuit_scale, 0, c_white, 1)
	scr_draw_text_ext(c_black, 1, 0, font_puhui_32, 0.5, 0.5, global.gametitle[1], 
		VIEW_W_UI/2, VIEW_H_UI/2+360, 1.5, 1.5, -1, -1, -1, 0)
} else if draw_page==2 {
	draw_sprite(spr_logo_joy, 0, VIEW_W_UI/2, VIEW_H_UI/2-64)
	scr_draw_text_ext(c_black, 1, 0, font_puhui_32, 0.5, 0.5, global.gametitle[2], 
		VIEW_W_UI/2, VIEW_H_UI/2+384, 1, 1, -1, -1, -1, 0)
}