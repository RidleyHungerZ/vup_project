hp=16
attack=6
event_inherited();
adjustGRDY();

SS_idle=spr_enemy06_idle
SS_injure=spr_enemy06_injure
SS_death=spr_enemy06_death
SS_part=spr_enemy06_part
SS_part2=spr_enemy06_part2

xrange=128

lash=noone

find_player = function() {
	return findTarget(128, 128, 64, 64, true)
}