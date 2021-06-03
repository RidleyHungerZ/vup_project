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
	if (x-xsign)*image_xscale>=xrange
	|| walkGround(hsp) {
		image_xscale*=-1
		while place_meeting(x,y,obj_ground)
		|| place_meeting(x,y,obj_sink)
			x+=image_xscale
		x+=4*image_xscale
	}
	hsp=1*image_xscale
	//发现敌人
	if find_player() && time==0 {
		action=10
	}
	//落空
	if !place_meeting(x,y+GRDY+4,obj_ground)
	&& !place_meeting(x,y+GRDY+4,obj_sink)
	&& !collision_rectangle(bbox_right,bbox_bottom+GRDY+4,bbox_left,bbox_bottom+GRDY,obj_floor,1,1){
		scr_sprite_change(spr_enemy04_jump,image_number-1,0)
		action=11
	}
} 
else if action==10 {
	scr_sprite_change(spr_enemy04_jump,0,0.25)
	image_xscale=sign_no0(obj_player.x-x)
	if image_xscale=0 image_xscale=1
	hsp=4*image_xscale
	vsp=-8
	y-=4
	action=11
}
else if action==11 {
	if sprite_index=SS_injure image_index=0
	//触顶
	if vsp>=0
	|| place_meeting(x,y-1,obj_ground)
	|| place_meeting(x,y-1,obj_sink) {
		if vsp<0 vsp=0
		action=12
	}
}
else if action==12 {
	if place_meeting(x,y+GRDY+1,obj_ground)
	|| place_meeting(x,y+GRDY+1,obj_sink)
	|| collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY,obj_floor,1,1){
		//非冰冻和麻痹
		if injure_element!=ELEMENTS.ice && injure_element!=ELEMENTS.elec {
			scr_sprite_change(spr_enemy04_walk, 0, 0.05)
		}
		action=0
		time=120
		xsign=x
		vsp=0
	}
}