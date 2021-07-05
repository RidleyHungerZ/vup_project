if !variable_instance_exists(id, "hp") hp=12
if !variable_instance_exists(id, "attack") attack=8
event_inherited();
view_edge=-1
/// @arg injure_back=true
injure_back=false; //受伤是否被击退
/// @arg injure_elementback=true
injure_elementback=false; //属性是否被击退
/// @arg injure_elementfall=true
injure_elementfall=false; //飞行属性被属性击中是否下落
/// @arg use_speed_system=1
use_speed_system=false; //是否采用运动系统
/// @arg death_boom=false
death_boom=false; //死亡是否立刻爆炸
/// @arg death_type_use=1
death_type_use=false; //死亡爆炸效果使用
/// @arg death_repeat=1
death_repeat=false; //死亡后复活
/// @arg out_reflash=1
out_reflash=false; //出镜头刷新

scr_sprite_change(-2, 0, 0)
boom_number=9
boom_type=1
boom_rad=80

deathBoomPart=function() {
	scr_enemy_boom_number()
	instance_destroy()
}