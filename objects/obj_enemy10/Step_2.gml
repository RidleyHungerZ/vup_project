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
		scr_sprite_change(spr_enemy10_attack, 0, 0.25)
		action=1
	}
} 
//装膛
else if action==1 {
	if image_index>=3 {
		for(var i=-4;i<=4;i++) {
			if i==0 continue;
			with instance_create_depth(x+24*sign(i), bbox_bottom, depth-10, obj_bullet_enemy10) {
				image_xscale=sign(i)
				time=abs(i*5)
				while !place_meeting(x, y+GRDY+1, obj_soild) y++
				while place_meeting(x, y+GRDY, obj_soild) y--
			}
		}
		scr_sound_play(se_enemy_elec)
		action=2
		time=60
	}
}
//发射
else if action==2 && time==0 {
	scr_sprite_change(spr_enemy10_attack_ed, 0, 0.25)
	action=3
	time=30
}
else if action==3 && time==0 {
	action=0
	time=30
}