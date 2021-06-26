event_inherited();
if !scr_menu_trem() exit
if action==0 && time==0 {
	hspeed=4*image_xscale
	action=1
} else if action==1 {
	//脚下没有墙壁
	if !collision_rectangle(bbox_right,bbox_bottom+GRDY+8,bbox_left,bbox_bottom+GRDY,obj_ground,1,1)
	&& !collision_rectangle(bbox_right,bbox_bottom+GRDY+8,bbox_left,bbox_bottom+GRDY,obj_sink,1,1)
	&& !collision_rectangle(bbox_right,bbox_bottom+GRDY+8,bbox_left,bbox_bottom+GRDY,obj_floor,1,1){
		hit=1
	}
	//接触墙壁
	else if collision_rectangle(bbox_right+hspeed,bbox_bottom+GRDY-4,bbox_left+hspeed,bbox_bottom+GRDY-8,obj_ground,1,1){
		x=round(x)
		while !collision_rectangle(bbox_right+1,bbox_bottom+GRDY-4,bbox_left-1,bbox_bottom+GRDY-8,obj_ground,1,1)
			x+=sign(hspeed)
		hit=1
	}
	else {
		//上斜坡
		while collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_ground,1,1)
		|| collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_sink,1,1)
		|| collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_floor,1,1)
			y-=1
		//下斜坡
		while(collision_rectangle(bbox_right,bbox_bottom+GRDY+8,bbox_left,bbox_bottom+GRDY,obj_ground,1,1)
		&&!collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY,obj_ground,1,1))
		||(collision_rectangle(bbox_right,bbox_bottom+GRDY+8,bbox_left,bbox_bottom+GRDY,obj_sink,1,1)
		&&!collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY,obj_sink,1,1))
		||(collision_rectangle(bbox_right,bbox_bottom+GRDY+8,bbox_left,bbox_bottom+GRDY,obj_floor,1,1)
		&&!collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY,obj_floor,1,1))
			y+=1
	}
}
if hit==1 {
	with instance_create_depth(x, y, depth, obj_animation_once) {
		scr_sprite_change(spr_enemy10_bullet_dis, 0, 0.5)
	}
	instance_destroy()
}