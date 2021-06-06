event_inherited();
if(!scr_menu_trem()) exit;
//向前伸出时，前后替换，将光源至于前侧
if arm_angle<90 draw_yscale=-1
else draw_yscale=1
//将机械臂角度转换为实际角度
if image_xscale==1 {
	image_angle=180+arm_angle
} else if image_xscale==-1 {
	image_angle=180-arm_angle
}