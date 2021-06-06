event_inherited();
if(!scr_menu_trem()) exit;
if hp<=0 exit
if view!=1{
	x=init_x
	y=init_y
	exit
}
if sprite_index=SS_injure exit
//站立
if action==0 && time==0 {
	if find_player() {
		if image_xscale!=sign_no0(obj_player.x-x) {
			scr_sprite_change(spr_enemy03_trans_st, 0, 0.25)
			action=1
		} else {
			action=2
		}
	}
} 
//转身
else if action==1 {
	if sprite_index==spr_enemy03_idle {
		action=2
	}
}
//装膛
else if action==2 {
	scr_sprite_change(spr_enemy03_shoot, 0, 0.25)
	scr_sound_play(se_enemy_open)
	action=3
	time=30
}
//发射
else if action==3 && time==0 {
	scr_sprite_change(spr_enemy03_shoot2, 0, 0.25)
	//发射x+16,y-20
	with instance_create_depth(x+16*image_xscale, y-24*image_yscale, depth+1, obj_bullet_enemy03) {
		direction=90-45*other.image_xscale
		image_angle=direction
		image_yscale=other.image_xscale
		speed=4
		aim_inst=obj_player
	}
	scr_sound_play(se_enemy_missile)
	action=4
	time=60
}
else if action==4 && time==0 {
	action=0
}