if action<0 executeNoStop()
if !scr_menu_trem() exit
if action>=0 {
	if place_meeting(x, y, obj_player) {
		scr_sprite_change(spr_none, 0, 0)
		action=-1
	}
	if action==0 {
		if !place_meeting(x, y+GRDY, obj_soild) {
			gravity=GRAV
			action=1
		}
	}
}
if action<0 execute()