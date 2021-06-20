event_inherited();
if(!scr_menu_trem()) exit;
//丢出飞行中
if action==0 {
	var dis=point_distance(x, y, aimx, aimy)
	speed=max(1, dis/16)
	if dis<=4 {
		speed=0
		x=aimx
		y=aimy
		action=1
		time=30
	}
} else if action==1 && time==0 {
	action=2
	time=60
} else if action==2 {
	if time mod 10 ==0 {
		var inx=(time div 10),
			shotdir=90+90*image_xscale+30*image_xscale*inx,
			shotx=lengthdir_x(32, shotdir),
			shoty=lengthdir_y(32, shotdir);
		with instance_create_depth(x+shotx, y+shoty, depth-1, obj_boss_yanZx_bullet_kickfire) {
			direction=shotdir
			speed=8
			image_yscale=other.image_xscale
			image_xscale*=0.5
			image_yscale*=0.5
			image_angle=direction
		}
		scr_sound_play(se_boss_yanzx_gun_shoot)
	}
	if time==0 {
		action=3
		time=30
	}
} else if action==3 && time==0 {
	spanGunOver=true
	action=4
}
//归位
else if action==10 {
	speed=8
	direction=point_direction(x, y, boss.x, boss.y)
	action=11
} else if action==11 {
	var dis=point_distance(x, y, boss.x, boss.y)
	speed=max(1, dis/16)
	if dis<=4 {
		instance_destroy()
	}
}