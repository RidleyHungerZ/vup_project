event_inherited();
if(!scr_menu_trem()) exit;
if hp<=0 exit
if view!=1{
	x=init_x
	y=init_y
	exit
}
if sprite_index=SS_injure exit
//站立
if action==0 && time==0 {
	scr_sprite_change(spr_enemy01_walk, 0, 0.2)
	hsp=3*image_xscale
	action=1
} 
//跑步
else if action==1 {
	if (x-xsign)*image_xscale>=xrange
	|| walkGround(hsp) {
		scr_sprite_change(spr_enemy01_idle, 0, 0)
		hsp=0
		action=2
		time=30
	}
}
//暂停回头
else if action==2 && time==0 {
	image_xscale*=-1
	while place_meeting(x, y, obj_ground) x+=image_xscale
	action=0
	time=60
}
//发现敌人
if action<10 {
	if find_player() {
		scr_sprite_change(spr_enemy01_shoot, 0, 0.25)
		hsp=0
		image_xscale=sign_no0(obj_player.x-x)
		while place_meeting(x, y, obj_ground) x+=image_xscale
		action=10
		time=30
	}
}
else if action==10 && time==0 {
	scr_sprite_change(spr_enemy01_shoot2, 0, 0.5)
	with instance_create_depth(x+34*image_xscale, y-8*image_yscale, depth-1, obj_bullet_enemy01) {
		image_xscale=other.image_xscale
		hspeed=8*image_xscale
	}
	scr_sound_play(se_enemy_bullet)
	action=11
	time=30
}
else if action==11 && time==0 {
	if find_player() {
		image_xscale=sign_no0(obj_player.x-x)
		while place_meeting(x, y, obj_ground) x+=image_xscale
		action=10
		time=30
	} else {
		scr_sprite_change(spr_enemy01_shooted, 0, 0.25)
		action=0
		time=30
	}
}