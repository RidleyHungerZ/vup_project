event_inherited();

closeDoor=function() {
	scr_sprite_change(SS_close, 0, 0.25)
	scr_sound_play(SE_close)
	action=-1
}