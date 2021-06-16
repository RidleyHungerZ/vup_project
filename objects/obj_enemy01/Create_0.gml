hp=100
attack=6
event_inherited();
adjustGRDY();

SS_idle=spr_enemy01_idle
SS_injure=spr_enemy01_injure
SS_death=spr_enemy01_death
SS_part=spr_enemy01_part
SS_part2=spr_enemy01_part2

xrange=128

find_player = function() {
	return findTarget(128, 96, 64, 64, true)
}