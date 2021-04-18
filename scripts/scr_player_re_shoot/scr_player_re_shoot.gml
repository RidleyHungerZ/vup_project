function scr_player_re_shoot(shx, shy) {
	with instance_create_depth(x+shx*image_xscale,y+shy*image_yscale,depth-1,obj_player_bullet_hu) {
		scr_sprite_change(spr_player_hu_bullet01,0,0.5)
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
		hspeed=8*image_xscale
		scr_player_damage_set(2,ELEMENTS.none,ATK_TYPE.bullet,0,1,0,1,0)
		scr_sound_play(se_player_hu_bullet01)
	}
	bullet_time=bullet_set
}
