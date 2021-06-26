event_inherited();
if !scr_menu_trem() exit
if action==0 {
	ground_anima=instance_create_depth(x, y, depth+1, obj_boss_yanZx_anima_groundfire)
	action=1
	time=waittime
} else if action==1 && time==0 {
	scr_sprite_change(spr_boss_yanzx_bullet_flyfire, 0, 0.25)
	action=2
} else if action==2 {
	if image_index>=3 {
		if instance_exists(ground_anima)
			ground_anima.disapper()
		have_dmg=false;
		attack=0
		action=3
	}
}