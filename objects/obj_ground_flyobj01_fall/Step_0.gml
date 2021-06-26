event_inherited();
if !scr_menu_trem() exit
if action==0 {
	if collision_rectangle(bbox_right, bbox_top, bbox_left, bbox_top-GRDY-1, obj_player, 1, 1) 
	&& obj_player.walk==0 {
		scr_sprite_change(spr_flyobj_ground01_error, 0, 0.25)
		smoke_t=5
		action=1
		time=30
	}
} else if action==1 && time==0 {
	gravity=GRAV
	action=2
} else if action==2 {
	if vspeed>=6 gravity=0
	if !scr_in_room(128) {
		scr_sprite_change(spr_none, 0, 0)
		smoke_t=-1
		speed=0
		gravity=0
		action=3
	}
} else if action==3 {
	if !scr_in_view_arg(xstart, ystart, 256) {
		instance_create_depth(xstart, ystart, depth, object_index)
		instance_destroy()
	}
}