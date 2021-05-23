hp=14
attack=6
event_inherited();
adjustGRDY();

SS_idle=spr_enemy03_idle
SS_injure=spr_enemy03_injure
SS_death=spr_enemy03_death
SS_part=spr_enemy03_part
SS_part2=spr_enemy03_part2

find_player = function() {
	return findTarget(160, 128, 96, 96, true)
}