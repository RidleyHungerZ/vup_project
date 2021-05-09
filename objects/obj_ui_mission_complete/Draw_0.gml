if view_current!=1 exit
var vcx=VIEW_W_UI/2, vcy=VIEW_H_UI/2
//背景
draw_sprite_ext(spr_ui_grd_title_bgs, 0, vcx, vcy, 120, 1, 0, c_white, gray_bgs_alpha)
//mission
draw_sprite_ext(spr_ui_grd_title_mission_complete_ch, 0, vcx+384, vcy-104, 1, 1, 0, c_white, mission_alpha)
draw_sprite_ext(spr_ui_grd_title_mission_complete, 0, vcx, vcy, 1, 1, 0, c_white, mission_alpha)
//边框
draw_sprite_ext(spr_ui_grd_title_frame, 0, vcx, vcy-(160+frame_yof), 1, 1, 0, c_white, frame_alpha)
draw_sprite_ext(spr_ui_grd_title_frame, 0, vcx, vcy+(160+frame_yof), -1, -1, 0, c_white, frame_alpha)
//框内红色
scr_draw_rectangle(UIPINK, frame_red_alpha, 0, vcy-170, VIEW_W_UI, vcy+170)
//屏幕白色
scr_draw_rectangle_view(c_white, view_white_alpha, 1)