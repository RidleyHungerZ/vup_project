event_inherited();
if view_current!=1 exit
var alpha=(global.fps_curr mod 4)*0.25
scr_draw_rectangle_view(c_aqua, 0.1*alpha, 1)
var liney=VIEW_H_UI-(global.fps_curr*6 mod VIEW_H_UI)
scr_draw_line(c_aqua, 0.5, 1, false, 0, liney, VIEW_W_UI, liney)