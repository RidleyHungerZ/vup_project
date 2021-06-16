/// @description 精灵对齐
if global.player_hp<=0 
|| global.operate!=1
|| global.player_operate!=1 {
	scr_sprite_change(spr_none, 0, 0)
}
#region 精灵对齐
if(scr_menu_trem()) {
	var sprname = sprite_get_name(global.player.sprite_index)+"_saber",
		spr = asset_get_index(sprname);
	if sprite_exists(spr) {
		scr_sprite_change(spr, global.player.image_index, global.player.image_speed)
	}
	#region 属性变化
	//蓄力斩
	if sprite_index==spr_player_armor_idle_chop_charge_saber {
		if element==ELEMENTS.fire sprite_index=spr_player_armor_idle_chop_charge_saber_fire
		else if element==ELEMENTS.ice sprite_index=spr_player_armor_idle_chop_charge_saber_ice
		else if element==ELEMENTS.elec sprite_index=spr_player_armor_idle_chop_charge_saber_elec
	} else if sprite_index==spr_player_armor_fall_spin_chop_saber {
		if element=ELEMENTS.fire sprite_index=spr_player_armor_fall_spin_chop_saber_fire
		else if element==ELEMENTS.ice sprite_index=spr_player_armor_fall_spin_chop_saber_ice
		else if element==ELEMENTS.elec sprite_index=spr_player_armor_fall_spin_chop_saber_elec
	} else if sprite_index==spr_player_armor_fall_spin_choped_saber {
		if element==ELEMENTS.fire sprite_index=spr_player_armor_fall_spin_choped_saber_fire
		else if element==ELEMENTS.ice sprite_index=spr_player_armor_fall_spin_choped_saber_ice
		else if element==ELEMENTS.elec sprite_index=spr_player_armor_fall_spin_choped_saber_elec
	}
	//ex技能
	else if sprite_index==spr_player_armor_fly_chop_saber {
		if element==ELEMENTS.fire sprite_index=spr_player_armor_fly_chop_saber_fire
	} else if sprite_index==spr_player_armor_fly_choping_saber {
		if element==ELEMENTS.fire sprite_index=spr_player_armor_fly_choping_saber_fire
	} else if sprite_index==spr_player_armor_fly_choped_saber {
		if element==ELEMENTS.fire sprite_index=spr_player_armor_fly_choped_saber_fire
	}
	#endregion
}
#endregion
if(image_xscale==0) image_xscale=1;
#region 伤害设置
if sprite_index==spr_player_armor_idle_chop1_saber {
	scr_player_damage_set(6,ELEMENTS.none,ATK_TYPE.cut,2,7,0,7,1)
} else if sprite_index==spr_player_armor_idle_chop2_saber {
	scr_player_damage_set(8,ELEMENTS.none,ATK_TYPE.cut,2,8,0,8,1)
} else if sprite_index==spr_player_armor_idle_chop3_saber {
	scr_player_damage_set(10,ELEMENTS.none,ATK_TYPE.cut,2,9,0,9,1)
} else if sprite_index==spr_player_armor_fall_chop_saber {
	scr_player_damage_set(8,ELEMENTS.none,ATK_TYPE.cut,2,6,0,6,1)
} else if sprite_index==spr_player_armor_walk_chop_saber {
	scr_player_damage_set(6,ELEMENTS.none,ATK_TYPE.cut,2,6,0,6,1)
} else if sprite_index==spr_player_armor_dash_chop_saber {
	scr_player_damage_set(10,ELEMENTS.none,ATK_TYPE.cut,2,6,0,6,1)
}
//蓄力斩
var chop_charge=false, chop_charge_ele=ELEMENTS.none;
if sprite_index==spr_player_armor_idle_chop_charge_saber  {
	chop_charge=true
	chop_charge_ele=ELEMENTS.none
} else if sprite_index==spr_player_armor_idle_chop_charge_saber_fire {
	chop_charge=true
	chop_charge_ele=ELEMENTS.fire
} else if sprite_index==spr_player_armor_idle_chop_charge_saber_ice {
	chop_charge=true
	chop_charge_ele=ELEMENTS.ice
} else if sprite_index==spr_player_armor_idle_chop_charge_saber_elec {
	chop_charge=true
	chop_charge_ele=ELEMENTS.elec
}
if chop_charge {
	scr_player_damage_set(16,chop_charge_ele,ATK_TYPE.bullet,2,9,0,9,1)
}
//回旋斩
var chop_spin=false, chop_spin_ele=ELEMENTS.none;
if sprite_index==spr_player_armor_fall_spin_chop_saber
|| sprite_index==spr_player_armor_fall_spin_choped_saber  {
	chop_spin=true
	chop_spin_ele=ELEMENTS.none
} else if sprite_index==spr_player_armor_fall_spin_chop_saber_fire 
|| sprite_index==spr_player_armor_fall_spin_choped_saber_fire {
	chop_spin=true
	chop_spin_ele=ELEMENTS.fire
} else if sprite_index==spr_player_armor_fall_spin_chop_saber_ice 
|| sprite_index==spr_player_armor_fall_spin_choped_saber_ice {
	chop_spin=true
	chop_spin_ele=ELEMENTS.ice
} else if sprite_index==spr_player_armor_fall_spin_chop_saber_elec 
|| sprite_index==spr_player_armor_fall_spin_choped_saber_elec {
	chop_spin=true
	chop_spin_ele=ELEMENTS.elec
} 
if chop_spin {
	var spandmg=8
	if span_comboing spandmg=4
	scr_player_damage_set(spandmg,chop_spin_ele,ATK_TYPE.bullet,2,9,1,0,1)
} else span_comboing=false
//升龙斩
if sprite_index==spr_player_armor_fly_chop_saber 
|| sprite_index==spr_player_armor_fly_choping_saber  
|| sprite_index==spr_player_armor_fly_choped_saber  {
	scr_player_damage_set(12,ELEMENTS.none,ATK_TYPE.cut,2,10,0,10,1)
} else if sprite_index==spr_player_armor_fly_chop_saber_fire
|| sprite_index==spr_player_armor_fly_choping_saber_fire 
|| sprite_index==spr_player_armor_fly_choped_saber_fire {
	scr_player_damage_set(12,ELEMENTS.fire,ATK_TYPE.cut,2,10,0,10,1)
}
#endregion
if sprite_index!=spr_none
	global.player.bullet_time=-1;