hp=8
attack=6
event_inherited();

/// @arg enemy_type=0
enemy_type=1; //0地上1浮空
/// @arg enemy_ground=1
enemy_ground=0; //0无视墙壁，1接触墙壁
/// @arg injure_back=true
injure_back=false; //受伤是否被击退
/// @arg injure_elementback=true
injure_elementback=false; //属性是否被击退
/// @arg injure_elementfall=true
injure_elementfall=false; //飞行属性被属性击中是否下落
/// @arg death_xscale=1
death_xscale=false; //是否使用受伤对准的死亡方向

xrange=256

SS_idle=spr_enemy08_idle
SS_injure=spr_enemy08_injure
SS_death=spr_enemy08_death
SS_part=spr_enemy08_part
SS_part2=spr_enemy08_part2

scr_sprite_change(SS_idle, 0, 0.25)

find_player = function() {
	return findTarget(128, 0, 48, 48, true)
}