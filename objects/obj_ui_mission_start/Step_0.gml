event_inherited();
create_time++
#region 边框出现
if action==0 {
	frame_yof=464
	frame_alpha=1
	action=1
	time=20
}
else if action==1 {
	frame_yof=464*(time/20)
	if time==0 {
		frame_yof=0
		frame_red_alpha=0
		action=2
		time=10
	}
}
//边框内发红
else if action==2 {
	frame_red_alpha=1-(time/10)
	if time==0 {
		frame_red_alpha=1
		mission_ch_alpha=1
		gray_bgs_alpha=1
		mission_alpha=1
		action=3
		time=10
	}
}
else if action==3 {
	frame_red_alpha=(time/10)
	if time==0 {
		frame_red_alpha=0
		action=4
		//time=20
	}
}
#endregion
#region 出现mission
else if action==4 && time==0{
	action=5
	time=120
}
else if action==5 {
	if time==0 {
		action=6
		time=10
	}
}
#endregion
#region 消失
else if action==6 && time==0 {
	view_white_alpha=0
	scr_sound_play(se_title_disapper)
	action=7
	time=10
}
else if action==7 {
	view_white_alpha=1-(time/10)
	if time==0 {
		view_white_alpha=1
		frame_red_alpha=0
		mission_ch_alpha=0
		gray_bgs_alpha=0
		mission_alpha=0
		frame_alpha=0
		action=8
		time=10
	}
}
else if action==8 && time==0 {
	view_white_alpha=(time/10)
	if time==0 {
		view_white_alpha=0
		action=9
		time=10
	}
}
else if action==9 && time==0 {
	//scr_sound_stop(SE_war)
	instance_destroy()
}
#endregion