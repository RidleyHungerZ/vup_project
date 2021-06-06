event_inherited();
if(!scr_menu_trem()) exit;
#region 开启
if action==1 {
	if lanuch_mode==1
		scr_sprite_change(spr_boss_cjc_lanuch1_open, 0, 0.25)
	else if lanuch_mode==2
		scr_sprite_change(spr_boss_cjc_lanuch2_open, 0, 0.25)
	scr_sound_play(se_enemy_open)
	action=2
}
#endregion
#region 关闭
if action==-1 {
	if lanuch_mode==1
		scr_sprite_change(spr_boss_cjc_lanuch1_close, 0, 0.25)
	else if lanuch_mode==2
		scr_sprite_change(spr_boss_cjc_lanuch2_close, 0, 0.25)
	scr_sound_play(se_enemy_open)
	action=-2
}
#endregion
#region 散弹发射
if action==10 {
	missile_index=0
	action=11
}
if action=11 && time==0 {
	if missile_index>=array_length(missile_pos) {
		action=12
	} else {
		var pnt=missile_pos[missile_index]
		with instance_create_depth(x+pnt.x*image_xscale, y+pnt.y*image_yscale, depth-1, obj_boss_cjc_bullet_missile_s) {
			direction=90-90*other.image_xscale
			image_angle=direction
			speed=4
		}
		scr_sound_play(se_enemy_missile)
		missile_index++
		time=15
	}
}
#endregion
#region 大导弹发射
if action==20 {
	action=21
}
if action=21 && time==0 {
	with instance_create_depth(x+0*image_xscale, y+6*image_yscale, depth-1, obj_boss_cjc_bullet_missile_b) {
		direction=90-90*other.image_xscale
		image_angle=direction
		speed=4
	}
	scr_sound_play(se_enemy_missile)
	action=22
}
#endregion