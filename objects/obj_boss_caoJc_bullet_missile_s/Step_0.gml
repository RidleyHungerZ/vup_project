event_inherited();
if(!scr_menu_trem()) exit;
if action==0 {
	if abs(image_xscale)<1 {
		image_xscale+=1/20*sign(image_xscale)
	} else {
		image_xscale/=image_xscale
		scr_sprite_change(-2, -2, 0.5)
		action=1
	}
} else if action==1 {
	if speed>0 friction=0.1
	else {
		speed=0
		aim_dir=dir_player
		dir_diff=angle_difference(aim_dir, direction)
		action=2
		time=30
	}
} else if action==2 {
	direction+=dir_diff/30
	if time==0 {
		direction=aim_dir
		gravity=0.5
		gravity_direction=direction
		action=3
	}
} else if action==3 {
	speed=clamp(speed, 0, 6)
	if !scr_in_view(64) instance_destroy()
}
