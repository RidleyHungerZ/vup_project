event_inherited();
if action==0 {
	scr_view_transition(1, 1)
	action=1
	time=90
} else if action==1 && time==0 {
	scr_view_transition(1, 0)
	action=3
} else if action=3 {
	if scr_view_transition_Isover(1) {
		draw_page++
		if draw_page>=draw_page_count {
			scr_room_goto(room_logo)
		} else {
			action=0
			scr_view_transition(1, 2)
		}
	}
}