hp=16
attack=6
event_inherited();
element=ELEMENTS.elec
adjustGRDY();
/// @arg injure_back=true
injure_back=false; //受伤是否被击退

SS_idle=spr_enemy10_idle
SS_injure=spr_enemy10_injure
SS_death=spr_enemy10_death
SS_part=spr_enemy10_part
SS_part2=spr_enemy10_part2

find_player = function() {
	return findTarget(160, 160, 96, 32, true)
}