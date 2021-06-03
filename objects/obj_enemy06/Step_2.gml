event_inherited();
if(!scr_menu_trem()) exit;
if instance_exists(lash)
&& sprite_index!=spr_enemy06_lash
	instance_destroy(lash)
if hp<=0 exit
if view!=1{
	x=init_x
	y=init_y
	exit
}
if sprite_index=SS_injure exit
//站立
if action==0 && time==0 {
	scr_sprite_change(spr_enemy06_walk, 0, 0.05)
	hsp=1*image_xscale
	action=1
} 
//跑步
else if action==1 {
	if (x-xsign)*image_xscale>=xrange
	|| walkGround(hsp) {
		scr_sprite_change(spr_enemy06_idle, 0, 0.25)
		hsp=0
		action=2
		time=60
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
if action<10 && time==0 {
	if find_player() {
		action=10
	}
}
else if action==10 {
	scr_sprite_change(spr_enemy06_lash_st, 0, 0.25)
	hsp=0
	image_xscale=sign_no0(obj_player.x-x)
	while place_meeting(x, y, obj_ground) x+=image_xscale
	action=11
	time=30
}
else if action==11 && time==0 {
	scr_sprite_change(spr_enemy06_lash, 0, 0.5)
	lash=instance_create_depth(x, y, depth-1, obj_enemy06_lash)
	lash.enemy=id
	scr_sound_play(se_enemy_jet)
	hsp=6*image_xscale
	action=12
	time=40
}
else if action==12 {
	hsp=6*image_xscale*(time/40)
	if time==0 {
		hsp=0
		scr_sprite_change(spr_enemy06_lash, 0, 0)
		action=13
		time=30
	}
}
else if action==13 && time==0 {
	scr_sprite_change(spr_enemy06_idle, 0, 0.25)
	xsign=x
	action=0
	time=60
}