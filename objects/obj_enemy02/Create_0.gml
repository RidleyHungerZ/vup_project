hp=8
attack=6
event_inherited();

/// @arg enemy_type=0
enemy_type=1; //0地上1浮空
/// @arg injure_back=true
injure_back=false; //受伤是否被击退
/// @arg injure_elementback=true
//injure_elementback=false; //属性是否被击退
/// @arg injure_elementfall=true
injure_elementfall=false; //飞行属性被属性击中是否下落
/// @arg death_xscale=1
death_xscale=false; //是否使用受伤对准的死亡方向

SS_idle=spr_enemy02_idle
SS_injure=spr_enemy02_injure
SS_death=spr_enemy02_death
SS_part=spr_enemy02_part
SS_part2=spr_enemy02_part2

find_player = function() {
	var dx=128*image_xscale, dy=128*image_yscale,
		player=collision_line(x, y, x+dx, y+dy, obj_player, 1, 1)
	if player {
		return !collision_line(x, y, player.x, player.y, obj_ground, 1, 1)
	}
}