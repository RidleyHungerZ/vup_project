scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
if !can_talk exit
if talk_action==0 {
	if !scr_talk_ing()
	&& global.operate==1 
	&& global.player_operate==1 
	&& place_meeting(x, y, obj_player) 
	&& obj_player.jump==0 
	&& obj_player.walk==0 
	&& keystate_check_pressed(global.up_state) {
		if xscale_to_player 
			image_xscale=sign_no0(obj_player.x-x)
		else
			obj_player.x=sign_no0(x-obj_player.x)
		scr_talk_start(talk_inx, start_now)
		talk_start()
		txt_inx=0
		global.operate=0
		with obj_player {
			scr_sprite_change(SS_talk, 0, 0.25)
		}
		talk_action=1
	}
} else if talk_action==1 {
	if global.talk==1
		talk_action=2
} else if talk_action==-1 {
	scr_talk_end()
	talk_action=-2
} else if talk_action==-2 {
	if !scr_talk_ing() {
		talk_action=0
		with obj_player {
			scr_sprite_change(SS_talked, 0, 0.25)
		}
		global.operate=1
	}
}