/// @description 精灵对齐
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
else if sprite_index==spr_player_armor_idle_chop_charge_saber  {
	scr_player_damage_set(16,ELEMENTS.none,ATK_TYPE.bullet,2,9,0,9,1)
} else if sprite_index==spr_player_armor_idle_chop_charge_saber_fire {
	scr_player_damage_set(16,ELEMENTS.fire,ATK_TYPE.bullet,2,9,0,9,1)
} else if sprite_index==spr_player_armor_idle_chop_charge_saber_ice {
	scr_player_damage_set(16,ELEMENTS.ice,ATK_TYPE.bullet,2,9,0,9,1)
} else if sprite_index==spr_player_armor_idle_chop_charge_saber_elec {
	scr_player_damage_set(16,ELEMENTS.elec,ATK_TYPE.bullet,2,9,0,9,1)
}
//回旋斩
else if sprite_index==spr_player_armor_fall_spin_chop_saber
|| sprite_index==spr_player_armor_fall_spin_choped_saber  {
	scr_player_damage_set(16,ELEMENTS.none,ATK_TYPE.bullet,2,9,0,9,1)
} else if sprite_index==spr_player_armor_fall_spin_chop_saber_fire 
|| sprite_index==spr_player_armor_fall_spin_choped_saber_fire {
	scr_player_damage_set(16,ELEMENTS.fire,ATK_TYPE.bullet,2,9,0,9,1)
} else if sprite_index==spr_player_armor_fall_spin_chop_saber_ice 
|| sprite_index==spr_player_armor_fall_spin_choped_saber_fire {
	scr_player_damage_set(16,ELEMENTS.ice,ATK_TYPE.bullet,2,9,0,9,1)
} else if sprite_index==spr_player_armor_fall_spin_chop_saber_elec 
|| sprite_index==spr_player_armor_fall_spin_choped_saber_fire {
	scr_player_damage_set(16,ELEMENTS.elec,ATK_TYPE.bullet,2,9,0,9,1)
} 
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