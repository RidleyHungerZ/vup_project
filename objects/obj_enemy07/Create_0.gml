hp=6
attack=6
event_inherited();
adjustGRDY();

/// @arg injure_back=true
injure_back=false; //受伤是否被击退
/// @arg injure_elementback=true
injure_elementback=false; //属性是否被击退
/// @arg injure_elementfall=true
injure_elementfall=false; //飞行属性被属性击中是否下落
/// @arg death_xscale=1
death_xscale=false; //是否使用受伤对准的死亡方向

death_use_speed_system=true;

SS_idle=spr_enemy07_run
SS_injure=spr_enemy07_injure
SS_death=spr_enemy07_death
SS_part=spr_enemy07_part
SS_part2=spr_enemy07_part2

//scr_sprite_change(spr_enemy07_run, 0, 0.5)