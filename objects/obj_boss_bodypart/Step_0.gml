//遍历获取boss的id
var parenemy=enemy
while instance_exists(parenemy) {
	if parenemy.inst_of(obj_boss) {
		boss=parenemy
		break
	} else {
		parenemy=parenemy.enemy
	}
}
//代理伤害
if damage_agent_boss
	damage_agent=boss
event_inherited();
if(!scr_menu_trem()) exit;
