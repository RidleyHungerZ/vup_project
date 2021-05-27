event_inherited()
scr_sprite_change(spr_player_none,0,0);
death_time=-1
animation_once=false;
dis_edge=96;

hit_ground=function(xx, yy, destory) {
	var hitanima = instance_create_depth(xx, yy, depth, obj_animation_once) 
	with hitanima{
		scr_sprite_change(spr_player_bullet_hit, 0, 0.25)
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
	}
	if(destory) instance_destroy()
	return hitanima
}
hit_invalid=function(xx, yy, destory) {
	var hitanima = instance_create_depth(xx, yy, depth, obj_animation_once) 
	with hitanima{
		scr_sprite_change(spr_player_bullet_invalid, 0, 0.25)
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
	}
	scr_sound_play(se_enemy_undamage)
	if(destory) instance_destroy()
	return hitanima
}