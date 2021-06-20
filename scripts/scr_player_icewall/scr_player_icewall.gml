function scr_player_icewall() {
	if place_meeting(x,y,obj_icewall)
	//|| scr_player_debuff_is(PLAYER_DEBUFF.oil)
		return true
	else
		return false
}
