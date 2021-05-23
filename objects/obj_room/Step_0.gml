/// @desc 对话处理
scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
if talk_action!=0 {
	var threadset=global.txt_thread_set[talk_txt_thread][talk_txt_index_st],
		talkset=global.txt_thread[talk_txt_thread][talk_txt_index];
	if talk_action==1 {
		scr_talk_start(threadset.talk_inx, talkset.now, threadset.xscale)
		//双对话框时要先启动另一个对话框
		if threadset.talk_inx==TALK_INX.both {
			var unow=TALK_INX.up;
			if talkset.now==TALK_INX.up unow=TALK_INX.down
			scr_talk(unow, "", threadset.unow.shoto_type, threadset.unow.shoto, threadset.unow.name, [])
		}
		scr_talk(talkset.now, talkset.txt, talkset.shoto_type, talkset.shoto, talkset.name, [])
		talk_action=2
	} else if talk_action==2 {
		if scr_talk_print_over() {
			talk_action=3
			time=10
		}
	} else if talk_action==3 && time==0 {
		if scr_talk_print_over() 
		&& scr_talk_next() {
			talk_txt_index++
			if talk_txt_index<array_length(global.txt_thread[talk_txt_thread])
			&& !talkset.tend{
				talkset=global.txt_thread[talk_txt_thread][talk_txt_index];
				scr_talk(talkset.now, talkset.txt, talkset.shoto_type, talkset.shoto, talkset.name, [])
				time=10
			} else {
				talk_txt_index--
				scr_talk_end()
				talk_action=4
			}
		}
	} else if talk_action==4 {
		if !scr_talk_ing() {
			talk_txt_index++
			talk_action=0
		}
	}
}
//一旦玩家可以自由活动，就清空对话进度
if global.operate==1
&& global.player_operate==1 {
	talk_txt_index=0
}