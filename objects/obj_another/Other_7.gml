event_inherited()
#region 玩家
//event_perform_object(obj_player_hu, ev_other, ev_animation_end)
//event_perform_object(obj_player_armor, ev_other, ev_animation_end)
#endregion
#region NPC
if sprite_index==spr_npc_wuyu_glasses {
	//scr_sprite_change(-2, image_number-0.5, 0)
	scr_sprite_change(spr_npc_wuyu, 0, 0)
}
#endregion
#region 杂兵
if sprite_index==spr_enemy01_shoot {
	scr_sprite_change(-2, image_number-0.5, 0)
} else if sprite_index==spr_enemy01_shoot2 {
	scr_sprite_change(-2, image_number-0.5, 0)
} else if sprite_index==spr_enemy01_shooted {
	scr_sprite_change(spr_enemy01_idle, 0, 0)
}
#endregion