event_inherited();
if !scr_menu_trem() exit
if action==0 && time==0 {
	ground_anima=instance_create_depth(x, y, depth+1, obj_boss_yanZx_anima_groundfire)
	ground_anima.image_xscale=0.75
	action=1
	time=waittime
} else if action==1 && time==0 {
	scr_sprite_change(spr_boss_yanzx_bullet_fire, 0, 0.5)
	scr_sound_play(se_boss_yanzx_kick)
	direction=90
	speed=6
	image_angle=direction
	image_xscale=0
	image_yscale=0
	if instance_exists(ground_anima)
		ground_anima.disapper()
	action=2
} else if action==2 {
	if image_xscale<1 image_xscale+=1/15
	else image_xscale=1
	image_yscale=image_xscale
	var dis=point_distance(x, y, x, topy)
	speed=dis/16
	speed=clamp(speed, 1, 6)
	if y<=topy {
		y=topy
		speed=0
		scr_sprite_change(spr_boss_yanzx_bullet_fire_ed, 0, 0.5)
		action=3
	}
}