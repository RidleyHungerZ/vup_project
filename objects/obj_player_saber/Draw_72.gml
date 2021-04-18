/// @description 精灵对齐
#region 精灵对齐
if(scr_menu_trem()) {
	var sprname = sprite_get_name(global.player.sprite_index)+"_saber",
		spr = asset_get_index(sprname);
	if sprite_exists(spr) {
		scr_sprite_change(spr, global.player.image_index, global.player.image_speed)
	}
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
#endregion