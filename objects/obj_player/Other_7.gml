updateMask()
#region 常规动作
if sprite_index==SS_walk{
	scr_sprite_change(-2,2,-2);
}
else if sprite_index==SS_dash{
	scr_sprite_change(-2,5,-2);
}
else if sprite_index==SS_dashed{
	scr_sprite_change(SS_idle,0,0.25);
}
else if sprite_index==SS_jump{
	scr_sprite_change(SS_jumping,0,0.25);
}
else if sprite_index==SS_fallover{
	scr_sprite_change(SS_idle,0,0.25);
}
else if sprite_index==SS_jumped{
	scr_sprite_change(SS_fall,0,0.25);
}
else if sprite_index==SS_craw{
	scr_sprite_change(SS_crawing,0,0.25);
}
else if sprite_index==SS_crawjump{
	scr_sprite_change(-2,1,-2);
}
else if sprite_index==SS_talk{
	scr_sprite_change(SS_talking,0,0.25);
}
else if sprite_index==SS_talked{
	scr_sprite_change(SS_idle,0,0.25);
}
else if sprite_index==SS_squat{
	scr_sprite_change(-2,image_number-0.5,0);
}
else if sprite_index==SS_squated{
	scr_sprite_change(SS_idle, 4, 0.25);
	walk=0;
	jump=0;
}
else if sprite_index==SS_trip{
	scr_sprite_change(SS_climb,0,0.25);
}
else if sprite_index==SS_climb{
	scr_sprite_change(SS_idle,0,0.25);
	walk=0;
}
else if sprite_index==SS_doorup{
	scr_sprite_change(-2,image_number-0.5,0);
}
#endregion
#region 变身
//站立变身
else if sprite_index==SS_change_idle_start{
	scr_sprite_change(SS_change_idle_ing,0,0.25);
}
else if sprite_index==SS_change_idle_selected{
	scr_sprite_change(-2,image_number-0.5,0);
}
else if sprite_index==SS_change_idle_ed{
	if model==0 {
		var neoobjinx=obj_staff.player[PLAYER_MODEL.HU]
		if global.model!=0 neoobjinx=obj_staff.player[PLAYER_MODEL.ARMOR]
		var neo=instance_create_depth(x, y, depth, neoobjinx)
		with neo {
			scr_sprite_change(SS_idle, 0, 0)
			menu_imspd=0.25
		}
		card_change_var(neo)
		instance_destroy()
	} else {
		scr_sprite_change(SS_idle,0,0);
		menu_imspd=0.25
		jump=0
		walk=0
		hsp=0
	}
	obj_staff.player_change_over=true
}
else if sprite_index==SS_change_idle_cancle{
	scr_sprite_change(SS_idle,0,0);
	menu_imspd=0.25
	jump=0
	walk=0
	hsp=0
	obj_staff.player_change_over=true
}
//空中变身
else if sprite_index==SS_change_fall_start{
	scr_sprite_change(SS_change_fall_ing,0,0.25);
}
else if sprite_index==SS_change_fall_selected{
	scr_sprite_change(-2,image_number-0.5,0);
}
else if sprite_index==SS_change_fall_ed{
	if model==0 {
		var neoobjinx=obj_staff.player[PLAYER_MODEL.HU]
		if global.model!=0 neoobjinx=obj_staff.player[PLAYER_MODEL.ARMOR]
		var neo=instance_create_depth(x, y, depth, neoobjinx)
		with neo {
			scr_sprite_change(SS_fall, 0, 0)
			hsp=walkspd*hspd;
			vsp=0
		}
		card_change_var(neo)
		instance_destroy()
	} else {
		scr_sprite_change(SS_fall,0,0);
		menu_imspd=0.25
		jump=2
		hsp=walkspd*hspd;
		vsp=0
	}
	obj_staff.player_change_over=true
}
else if sprite_index==SS_change_fall_cancle{
	scr_sprite_change(SS_fall,0,0);
	menu_imspd=0.25
	jump=2
	hsp=walkspd*hspd;
	vsp=0
	obj_staff.player_change_over=true
}
#endregion
#region 受伤与死亡
else if sprite_index==SS_injure1{
	if(scr_player_Is_fallover(0,0,4,3)) {
		scr_sprite_change(SS_idle,4,0.25);
		walk=0;
		jump=0;
		hsp=0;
		vsp=0;
	}
	else{
		scr_sprite_change(SS_fall,0,0.25);
		walk=0;
		jump=2;
		hsp=walkspd*hspd;
	}
}
else if sprite_index==SS_injure2{
	if(scr_player_Is_fallover(0,0,4,3)) {
		scr_sprite_change(SS_idle,4,0.25);
		walk=0;
		jump=0;
		hsp=0;
		vsp=0;
	}
	else{
		scr_sprite_change(SS_fall,0,0.25);
		walk=0;
		jump=2;
		hsp=walkspd*hspd;
	}
}
else if sprite_index==SS_death{
	scr_sprite_change(spr_player_deathnone,0,1/20);
	//scr_sound_play(se_player_death);
	//for(var i=0;i<8;i+=1){
	//	with(instance_create_depth(x,y,depth-1,obj_fly_outdestroy)) {
	//		scr_sprite_change(spr_player_death_round,0,0.25);
	//		direction=45*i;
	//		speed=2;
	//	}
	//}
}
else if sprite_index==spr_player_deathnone{
	scr_sprite_change(spr_player_none,0,0);
	//for(var i=0;i<8;i+=1){
	//	with(instance_create_depth(x,y,depth-1,obj_fly_outdestroy)) {
	//		scr_sprite_change(spr_player_death_round,0,0.25);
	//		direction=45*i;
	//		speed=2;
	//	}
	//}
}
#endregion
updateMask()