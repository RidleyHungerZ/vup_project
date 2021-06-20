event_inherited();
if(!scr_menu_trem()) exit;
//抛升
if action==0 {
	if vspeed>=0 {
		scr_sprite_change(spr_boss_yanzx_bullet_dice_st, 0, 0.5)
		x=aimx
		speed=0
		gravity=0
		action=1
		time=30
	}
} 
//坠落
else if action==1 && time==0 {
	scr_sprite_change(spr_boss_yanzx_bullet_dice_fall, 0, 0.5)
	vspeed=4
	gravity=G
	action=2
}
//落地
else if action==2 {
	if place_meeting(x, y, obj_ground) {
		scr_sprite_change(spr_boss_yanzx_bullet_dice_fallover, 0, 0.5)
		scr_sound_play(se_boss_yanzx_dice_fallover)
		scr_view_shock(1)
		y=floor(y)
		while !place_meeting(x, y+1+GRDY, obj_ground) y++
		while place_meeting(x, y+GRDY, obj_ground) y--
		y-=GRDY
		speed=0
		gravity=0
		action=3
		time=60
	}
}
//爆炸
else if action==3 && time==0 {
	if self_boom {
		fun_selfBoom()
	}
}