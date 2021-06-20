hp=1
attack=4
event_inherited();
use_speed_system=false
use_death_system=false
enemy_or_bullet=2
undm=1

index=0 //骰子编号
aimx=x
self_boom=true //是否自爆
fun_selfBoom=function() {
	scr_enemy_boom_number(x, y, 1, 0, 0)
	instance_destroy()
}