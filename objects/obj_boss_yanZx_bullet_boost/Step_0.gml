event_inherited();
if !scr_menu_trem() exit
//瞄准
if action==0 {
	scr_sprite_change(spr_boss_yanzx_bullet_boost_st, 0, 1)
	action=1
} 
//发射
else if action==10 {
	scr_sprite_change(spr_boss_yanzx_bullet_boost_ing, 0, 0.5)
	scr_sound_play(se_boss_yanzx_gun_boost)
	have_dmg=true
	with instance_create_depth(x, y, depth-1, obj_animation_once) {
		scr_sprite_change(spr_boss_yanzx_bullet_boost_round, 0, 0.5)
		image_xscale=other.image_yscale
	}
	action=11
}
//结束
else if action==20 {
	scr_sprite_change(spr_boss_yanzx_bullet_boost_ed, 0, 0.5)
	have_dmg=false
	action=21
}