event_inherited();
if !scr_menu_trem() exit
if action==0 {
	if collision_point(x, y, obj_ground, 1, 1)
	|| hit!=0 {
		scr_sprite_change(spr_boss_yanzx_bullet_fire_ed, 0, 0.5)
		speed=0
		action=1
	}
}