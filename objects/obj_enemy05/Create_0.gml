hp=8
attack=6
event_inherited();
scr_sprite_change(-2, 0, 0.5)

/// @arg enemy_type=0
enemy_type=1; //0地上1浮空
/// @arg injure_back=true
injure_back=true; //受伤是否被击退
/// @arg injure_elementback=true
injure_elementback=true; //属性是否被击退
/// @arg injure_elementfall=true
injure_elementfall=true; //飞行属性被属性击中是否下落
/// @arg death_xscale=1
death_xscale=true; //是否使用受伤对准的死亡方向

auto_fly=true //自动飞行
dirspeed=4
rad=80

SS_idle=spr_enemy05_idle
SS_injure=spr_enemy05_injure
SS_death=spr_enemy05_death
SS_part=spr_enemy05_part
SS_part2=spr_enemy05_part2

find_player = function() {
	var dx=128*image_xscale, dy=128*image_yscale,
		player=point_distance(x, y, obj_player.x, obj_player.y)<=96
			&& between(point_direction(x, y, obj_player.x, obj_player.y), 270, false, 270+90*image_xscale, false)
	if player {
		return !collision_line(x, y, player.x, player.y, obj_ground, 1, 1)
	}
}