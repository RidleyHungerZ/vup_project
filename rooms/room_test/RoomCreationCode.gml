if global.operate==0 {
	with obj_player {
		x=480
		y=512-GRDY
		scr_set_relife_point(x, y, 1)
		scr_sprite_change(SS_idle, 0, 0.25)
	}
	audio_bgm_change(bgm_stage1)
	global.operate=0.5
	global.player_operate=1
}