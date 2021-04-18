scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
#region 消失计时
if destory_time>0 destory_time--
if between(destory_time, 0, false, 60, true) {
	image_alpha=destory_time mod 2
}
else if destory_time==0 {
	instance_destroy()
}
#endregion
#region 弹跳
if action==1 {
	if vspeed<0 {
		if place_meeting(x, y+vspeed, obj_ground)
			vspeed=0
	} else {
		action=2
	}
}
if action==2 {
	if place_meeting(x, y+vspeed+GRDY, obj_soild) {
		while !place_meeting(x, y+1+GRDY, obj_soild) y++
		while place_meeting(x, y+GRDY, obj_soild) y--
		if destory_time>=0
			scr_sprite_change(-2, -2, 0.25)
		action=0
		speed=0
		gravity=0
	}
}
#endregion