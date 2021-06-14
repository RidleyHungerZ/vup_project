event_inherited();
if !variable_instance_exists(id, "npcName") npcName="";
if !variable_instance_exists(id, "group") group="";
can_talk=true;
talk_action=0
talk_txt_index=0
xscale_to_player=true //对话时是否朝向玩家，否则由玩家改变朝向
if npcName!="" {
	npc_setting=variable_struct_get(global.txt_npc, npcName)
	talk_setting=variable_struct_get(npc_setting, group)
}
//对话开始
talk_start=function() {
	talk_action=1
}
//对话结束
talk_end=function() {
	talk_action=-1
}