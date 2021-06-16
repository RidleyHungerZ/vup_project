event_inherited();
if(!scr_menu_trem()) exit;
if hp<=0 exit
if view!=1{
	x=init_x
	y=init_y
	exit
}
if sprite_index==SS_injure exit
//站立
if action==0 && time==0 {
	if find_player() {
		scr_sprite_change(spr_enemy02_shoot, 0, 0.25)
		with instance_create_depth(x+27*image_xscale, y+7*image_yscale, depth-1, obj_bullet_enemy01) {
			speed=6
			direction=270+45*other.image_xscale
		}
		scr_sound_play(se_enemy_bullet)
		action=1
		time=30
	}
} 
else if action==1 && time==0 {
	scr_sprite_change(spr_enemy02_idle, 0, 0)
	action=0
	time=60
}