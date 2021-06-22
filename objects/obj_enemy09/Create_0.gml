hp=6
attack=6
event_inherited();
element=ELEMENTS.ice
attack_element=ELEMENTS.ice

item=1
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
/// @arg auto_xscale=1
auto_xscale=false; //镜头外自动朝向玩家
/// @arg push_fly=0
push_fly=2; //是否被击飞，0为击中即飞且空血，1为空血即飞，2为不飞，3为击中即飞但不空血
/// @arg use_speed_system=1
use_speed_system=false; //是否采用运动系统
/// @arg use_death_system=1
use_death_system=false; //是否采用死亡系统
