//主对象消失则自身消失
if mastenemy
&& !instance_exists(enemy) {
	instance_destroy()
	exit
}
event_inherited();
if(!scr_menu_trem()) exit;