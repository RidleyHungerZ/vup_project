scr_menu_stop()
if !scr_menu_trem() exit
scr_time_alarm()
if !can_talk exit
var list=talk_setting.list,
	talkset=list[talk_txt_index];
var now=global.talk_now,
	selectnow=global.talk_select[now];
#region 开始对话
if talk_action==0 {
	if !scr_talk_ing()
	&& global.operate==1 
	&& global.player_operate==1 
	&& place_meeting(x, y, obj_player) 
	&& obj_player.jump==0 
	&& obj_player.walk==0 {
		ready_talk=true
	} else {
		ready_talk=false
	}
	if ready_talk 
	&& keystate_check_pressed(global.up_state) {
		talk_action=1
		ready_talk=false
	}
} else if talk_action==1 {
	if xscale_to_player 
		image_xscale=sign_no0(obj_player.x-x)
	else
		obj_player.x=sign_no0(x-obj_player.x)
	global.operate=0
	with obj_player {
		scr_sprite_change(SS_talk, 0, 0.25)
	}
	talk_setting=variable_struct_get(npc_setting, group)
	talk_txt_index=0
	talk_action=2
} else if talk_action==2 {
	scr_talk_start(talk_setting.talkinx, list[0].talkinx, -image_xscale)
	var unow=TALK_INX.up;
	if talkset.talkinx==TALK_INX.up unow=TALK_INX.down
	scr_talk(unow, "", talk_setting.otherShotoType, talk_setting.otherShoto, talk_setting.otherName, [])
	scr_talk(talkset.talkinx, "", talkset.shotoType, talkset.shoto, talkset.name, [])
	talk_action=3
} else if talk_action==3 {
	if global.talk==1
		talk_action=10
} 
#endregion
#region 对话中
else if talk_action==10 {
	var options=[];
	if array_length(talkset.selects)>0 {
		for(var i=0;i<array_length(talkset.selects);i++) {
			array_push(options, talkset.selects[i].txt)
		}
	}
	scr_talk(talkset.talkinx, talkset.txt, talkset.shotoType, talkset.shoto, talkset.name, options)
	talk_action=11
}
//打字机完毕
else if talk_action==11 {
	if scr_talk_print_over() {
		talk_action=12
		time=10
	}
} 
//执行选项、下一句
else if talk_action==12 && time==0 {
	//有选项
	if array_length(talkset.selects)>0 {
		if scr_talk_truekey() {
			var option=talkset.selects[selectnow],
				next=option.next
			if is_real(next) {
				talk_txt_index=next
				talk_action=10
				scr_sound_menu_play(se_menu_true)
			} else if is_method(next) {
				next()
				talk_action=13
			}
		} else if scr_talk_canclekey()
		&& talkset.back!=0 {
			if talkset.back<0
				talk_txt_index-=talkset.back
			else
				talk_txt_index=talkset.back
			talk_action=10
			scr_sound_menu_play(se_menu_cancle)
		}
	} else if scr_talk_next() {
		var talknext=talkset.next
		talk_txt_index++
		if talknext>=0 talk_txt_index=talknext
		if talk_txt_index<array_length(list)
		&& talknext!=-2 {
			talk_action=10
		} else {
			talk_txt_index--
			scr_talk_end()
			talk_action=-1
		}
	}
} 
//选项执行中
else if talk_action==13 {
	var option=talkset.selects[selectnow],
		inNext=option.inNext
	if !inNext() {
		talk_action=10
	}
}
#endregion
#region 对话结束
else if talk_action==-1 {
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
#endregion