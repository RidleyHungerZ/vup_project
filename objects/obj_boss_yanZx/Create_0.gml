attack=6
if scr_mode_Is_hard() hp=288
else hp=192
event_inherited();
bs=1
element=ELEMENTS.fire
enemy_type=1
enemy_ground=1

SS_injure=spr_boss_yanzx_injure
SS_death=spr_boss_yanzx_death

_xl=512
_xr=1024
_yt=0
_yb=288

//开始爆炸发生事件
boss_hp0_trigger=function() {
	action=0
	speed=0
	gravity=0
	gravity_direction=270
	
}
//消失时一并带走零件
boom_trigger = function() {
	
}