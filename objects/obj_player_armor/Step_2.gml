event_inherited()
if(!scr_menu_trem()) exit;
#region 精灵播放帧速修改区
scr_sprite_imspd(spr_player_armor_idle_chop1,0.5,0,3)
scr_sprite_imspd(spr_player_armor_idle_chop1,0.5,3,6)
scr_sprite_imspd(spr_player_armor_idle_chop1,0.25,6,7)
//////////////////////////////////////
scr_sprite_imspd(spr_player_armor_idle_chop2,0.5,0,3)
scr_sprite_imspd(spr_player_armor_idle_chop2,0.5,3,6)
scr_sprite_imspd(spr_player_armor_idle_chop2,0.25,6,7)
scr_sprite_imspd(spr_player_armor_idle_chop2,0.25,7,9)
//////////////////////////////////////
scr_sprite_imspd(spr_player_armor_idle_chop3,0.5,0,4)
scr_sprite_imspd(spr_player_armor_idle_chop3,0.5,4,7)
scr_sprite_imspd(spr_player_armor_idle_chop3,0.5,7,10)
scr_sprite_imspd(spr_player_armor_idle_chop3,0.25,10,11)
//////////////////////////////////////
scr_sprite_imspd(spr_player_armor_fall_chop,0.5,0,1)
scr_sprite_imspd(spr_player_armor_fall_chop,0.5,1,4)
scr_sprite_imspd(spr_player_armor_fall_chop,0.5,4,7)
scr_sprite_imspd(spr_player_armor_fall_chop,0.25,7,10)
//////////////////////////////////////
scr_sprite_imspd(spr_player_armor_dash_chop,0.5,0,1)
scr_sprite_imspd(spr_player_armor_dash_chop,0.5,1,4)
scr_sprite_imspd(spr_player_armor_dash_chop,0.5,4,7)
scr_sprite_imspd(spr_player_armor_dash_chop,0.25,7,9)
//////////////////////////////////////
scr_sprite_imspd(spr_player_armor_idle_chop_charge,0.5,0,3)
scr_sprite_imspd(spr_player_armor_idle_chop_charge,0.5,3,6)
scr_sprite_imspd(spr_player_armor_idle_chop_charge,0.5,6,10)
scr_sprite_imspd(spr_player_armor_idle_chop_charge,0.25,10,11)
//////////////////////////////////////
#endregion
updateMask()