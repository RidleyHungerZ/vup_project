if view_current!=1 exit
var vcx=VIEW_W_UI/2, vcy=VIEW_H_UI/2
//背景
draw_sprite_ext(spr_ui_grd_title_bgs, 0, vcx, vcy, 120, 1, 0, c_white, gray_bgs_alpha)
//前方高能
var winchspr=spr_ui_grd_title_warning_ch,
	winchsprw=sprite_get_width(winchspr),
	xof=(16*create_time) mod winchsprw,
	drawcount=ceil(VIEW_W_UI/winchsprw)+2;
for(var i=-1;i<=1;i+=2) {
	var dsx=i*(VIEW_W_UI/2+xof)
	for(var j=0;j<drawcount;j++) {
		draw_sprite_ext(spr_ui_grd_title_warning_ch, 0, vcx-dsx+j*i*winchsprw, vcy+i*104, 1, 1, 0, c_white, warning_ch_alpha)
	}
}
//warning
draw_sprite_ext(spr_ui_grd_title_warning, 0, vcx, vcy, 1.5, 1, 0, c_white, warning_alpha)
//边框
draw_sprite_ext(spr_ui_grd_title_frame, 0, vcx, vcy-(160+frame_yof), 1, 1, 0, c_white, frame_alpha)
draw_sprite_ext(spr_ui_grd_title_frame, 0, vcx, vcy+(160+frame_yof), -1, -1, 0, c_white, frame_alpha)
//warning外三红光
scr_draw_rectangle_view(UIPINK, (warning_alpha-1)*0.5, 1)
//框内红色
scr_draw_rectangle(UIPINK, frame_red_alpha, 0, vcy-170, VIEW_W_UI, vcy+170)
//屏幕白色
scr_draw_rectangle_view(c_white, view_white_alpha, 1)