event_inherited();
if !scr_menu_trem() exit
//防止挤死玩家
if(vspeed>0 || gravity>0)
&& place_meeting(x, y+vspeed+gravity, obj_player) {
	self_boom()
}