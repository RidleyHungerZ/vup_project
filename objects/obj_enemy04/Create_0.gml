hp=10
attack=6
event_inherited();
adjustGRDY();

SS_idle=spr_enemy04_idle
SS_injure=spr_enemy04_injure
SS_death=spr_enemy04_death
SS_part=spr_enemy04_part
SS_part2=spr_enemy04_part2

xrange=128

scr_sprite_change(spr_enemy04_walk, 0, 0.05)

find_player = function() {
	return findTarget(128, 96, 64, 64, true)
}