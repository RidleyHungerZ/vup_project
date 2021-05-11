event_inherited();
can_talk=true;
talk_action=0
xscale_to_player=true //对话时是否朝向玩家，否则由玩家改变朝向
//对话开始
talk_start=function() {
	
}
//正在对话中
talk_ing=function() {
	return talk_action==2
}
//对话结束
talk_end=function() {
	talk_action=-1
}
talk_inx=TALK_INX.up
start_now=TALK_INX.up
txt_inx=0