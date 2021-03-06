function scr_player_support_skills(){
	if global.model==PLAYER_MODEL.ARMOR 
		scr_player_support_skills_armor()
	else if global.model==PLAYER_MODEL.YANZX 
		scr_player_support_skills_YANZX()
	else if global.model==PLAYER_MODEL.ice1 
		scr_player_support_skills_ice1()
	else if global.model==PLAYER_MODEL.elec
		scr_player_support_skills_elec1()
	else if global.model==PLAYER_MODEL.none 
		scr_player_support_skills_none1()
	else if global.model==PLAYER_MODEL.fire2 
		scr_player_support_skills_fire2()
	else if global.model==PLAYER_MODEL.ICE
		scr_player_support_skills_ICE()
	else if global.model==PLAYER_MODEL.TAILS
		scr_player_support_skills_TAILS()
	else if global.model==PLAYER_MODEL.none2
		scr_player_support_skills_none2()
	else if global.model==PLAYER_MODEL.white
		scr_player_support_skills_white()
}
function scr_player_support_skills_armor(){
	if spskl_action==1 && spskl_time==0 {
		with instance_create_depth(x, y, depth+20, obj_player_bullet_armor) {
			scr_sprite_change(spr_player_support_armor_round_st, 0, 0.5)
			scr_menu_nostop_end()
			scr_player_damage_set(2, ELEMENTS.none, ATK_TYPE.bullet, 0, 100, 1, 0, 0)
			skip_attack_step=4
			can_combo=false
			time=180
		}
		scr_sound_play(se_player_unskill_armor)
		spskl_action=2
		spskl_time=60
	} else if spskl_action==2 && spskl_time==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_YANZX(){
	if spskl_action==1 && spskl_time==0 {
		with instance_create_layer(view_xcenpos(0), view_ycenpos(0), obj_room.layerInst[1], obj_player_bullet_fire) {
			scr_sprite_change(spr_boss_yanzx_app, 0, 0.5)
			image_xscale=other.image_xscale
			scr_menu_nostop_end()
			attack=0
			yanzx_view=[view_xpos(0), view_ypos(0), view_xpos(0)+view_wpos(0), view_ypos(0)+view_hpos(0)]
			dis_edge=-1
		}
		scr_sound_play(se_boss_yanzx_app)
		spskl_action=2
		spskl_time=60
	} else if spskl_action==2 && spskl_time==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_ice1(){
	if spskl_action==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_elec1(){
	if spskl_action==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_none1(){
	if spskl_action==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_fire2(){
	if spskl_action==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_ICE(){
	if spskl_action==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_TAILS(){
	if spskl_action==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_none2(){
	if spskl_action==0 {
		spskl_action=-1
	}
}
function scr_player_support_skills_white(){
	if spskl_action==0 {
		spskl_action=-1
	}
}