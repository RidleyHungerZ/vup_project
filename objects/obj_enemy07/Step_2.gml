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
if action==0 {
	scr_sprite_change(spr_enemy07_run, 0, 0.5)
	scr_sound_play(se_enemy_motor)
	action=1
} 
else if action==1 {
	if abs(hsp)<6 {
		hsp+=(1/5)*image_xscale
	} else hps=6*image_xscale
	if image_xscale!=sign_no0(obj_player.x-x) 
	&& abs(y-obj_player.y)<=64
	&& !collision_line(x, y, obj_player.x, obj_player.y, obj_ground, 1, 1){
		scr_sprite_change(spr_enemy07_stop, 0, 0.5)
		scr_sound_play(se_enemy_motor_stop)
		action=2
		time=30
	} else if collision_rectangle(bbox_right+hsp, bbox_bottom+GRDY-16, bbox_left+hsp, bbox_top, obj_ground, 1, 1) {
		scr_sprite_change(spr_enemy07_stop, 0, 0.5)
		hsp=0
		vsp=-4
		action=12
	}
}
else if action==2 {
	hsp=6*image_xscale*(time/30)
	//火花
	if time mod 3 == 0 {
		with instance_create_depth(x, bbox_bottom, depth-1, obj_animation_once) {
			scr_sprite_change(spr_enemy07_stop_fire, 0, 0.5)
			image_xscale=other.image_xscale
		}
	}
	if collision_rectangle(bbox_right+hsp, bbox_bottom+GRDY-16, bbox_left+hsp, bbox_top, obj_ground, 1, 1) {
		hsp=0
		time=0
	}
	if time==0 {
		action=3
	}
}
else if action==3 {
	scr_sprite_change(spr_enemy07_trans, 0, 0.5)
	image_xscale*=-1
	while place_meeting(x, y, obj_ground) x+=image_xscale
	action=4
	time=10
}
else if action==4 && time==0 {
	action=0
}
//弹跳
else if action==12 {
	if place_meeting(x,y+GRDY+1,obj_ground)
	|| place_meeting(x,y+GRDY+1,obj_sink)
	|| collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY,obj_floor,1,1) {
		action=3
	}
}