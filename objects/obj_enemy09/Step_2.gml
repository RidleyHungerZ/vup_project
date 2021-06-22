event_inherited();
if(!scr_menu_trem()) exit;
if hp<=0 exit
if view!=1{
	x=init_x
	y=init_y
	exit
}
scr_sprite_imspd(spr_enemy09_idle,1/60,0,1);
scr_sprite_imspd(spr_enemy09_idle,0.1,1,4);
//天花板
if action==0 {
	if abs(x-obj_player.x)<=24
	&& obj_player.y>bbox_bottom
	&& !collision_line(x, y, obj_player.x, obj_player.y, obj_soild, 1, 1) {
		scr_sprite_change(spr_enemy09_shock, 0, 0.25)
		action=1
		time=15
	}
} else if action==1 && time==0 {
	scr_sprite_change(spr_enemy09_fall, 0, 0)
	gravity=G
	vspeed=1
	action=2
} else if action==2 {
	if place_meeting(x, y+GRDY+1, obj_soild) {
		hp=0
	}
}