#region 工具方法
/// @desc npc对话开始设置
function npc_talk_start(npcName, group, talkinx, otherShotoType, otherShoto, otherName) {
	//获取npc小组
	if !variable_struct_exists(global.txt_npc, npcName)
		variable_struct_set(global.txt_npc, npcName, {})
	var tnpc=variable_struct_get(global.txt_npc, npcName)
	//获取情景小组
	if !variable_struct_exists(tnpc, group)
		variable_struct_set(tnpc, group, {})
	var tgroup=variable_struct_get(tnpc, group)
	//赋值
	tgroup.talkinx=talkinx
	tgroup.otherShotoType=otherShotoType
	tgroup.otherShoto=otherShoto
	tgroup.otherName=otherName
}
/// @desc npc对话设置
function npc_talk_txt(npcName, group, inx, context) {
	//获取npc小组
	if !variable_struct_exists(global.txt_npc, npcName)
		variable_struct_set(global.txt_npc, npcName, {})
	var tnpc=variable_struct_get(global.txt_npc, npcName)
	//获取情景小组
	if !variable_struct_exists(tnpc, group)
		variable_struct_set(tnpc, group, {})
	var tgroup=variable_struct_get(tnpc, group)
	//赋值
	tgroup.list[inx]=context
}
/// @desc npc对话详细内容
/// @arg talkinx 对话使用框
/// @arg shotoType 
/// @arg shoto 
/// @arg name 
/// @arg next 下一句;-1继续;-2结束;正数跳转
/// @arg txt 
/// @arg selects[] 选项
/// @arg back 选项是否能回退
function npcTalkContext(_talkinx, _shotoType, _shoto, _name, _next, _txt, _selects, _back) constructor {
	talkinx = _talkinx; 
	shotoType = _shotoType;
	shoto = _shoto;
	name = _name; 
	next = _next; 
	txt = _txt;
	selects = _selects; 
	back = _back;
}
/// @desc npc对话选项
/// @arg txt 选项文本
/// @arg next 选中后进入对话
/// @arg nextFun 选中后进入方法
/// @arg _inFun 方法是否还在继续
function npcTalkSelect(_txt, _next, _inNext) constructor {
	txt = _txt;
	next = _next;
	inNext = _inNext;
}
#endregion
/// @desc npc对话文本
function scr_txt_npc(){
var npc="", group="" ,inx=0
global.txt_npc={}
#region 纯蓝
npc="blue" 
group="normal" inx=0
npc_talk_start(npc, group, TALK_INX.both, TALK_SHOTO.player, PLAYER_SHOTO.normal, 1)
npc_talk_txt(npc, group, inx++, 
	new npcTalkContext(TALK_INX.down, TALK_SHOTO.npc, 10, 5, -1, 
@"你好，我是纯蓝Blue！", [], false))
npc_talk_txt(npc, group, inx++, 
	new npcTalkContext(TALK_INX.up, TALK_SHOTO.player, PLAYER_SHOTO.kaiXin, 1, -1, 
@"你好，蓝蓝！", [], false))
npc_talk_txt(npc, group, inx++, 
	new npcTalkContext(TALK_INX.down, TALK_SHOTO.npc, 10, 5, -1, 
@"请问有什么可以帮助你的吗？", [
new npcTalkSelect("选项1", 10, noone),
new npcTalkSelect("选项2", 20, noone),
new npcTalkSelect("选项3", 30, noone),
new npcTalkSelect("选项4", 40, noone),
], false))
inx=10
npc_talk_txt(npc, group, inx++, 
	new npcTalkContext(TALK_INX.down, TALK_SHOTO.npc, 10, 5, 50, 
@"这里是选项1！", []))
inx=20
npc_talk_txt(npc, group, inx++, 
	new npcTalkContext(TALK_INX.down, TALK_SHOTO.npc, 11, 5, 50, 
@"这里是选项2！", []))
inx=30
npc_talk_txt(npc, group, inx++, 
	new npcTalkContext(TALK_INX.down, TALK_SHOTO.npc, 12, 5, 50, 
@"这里是选项3！", []))
inx=40
npc_talk_txt(npc, group, inx++, 
	new npcTalkContext(TALK_INX.down, TALK_SHOTO.npc, 13, 5, 50, 
@"这里是选项4！", []))
inx=50
npc_talk_txt(npc, group, inx++, 
	new npcTalkContext(TALK_INX.down, TALK_SHOTO.npc, 10, 5, -2, 
@"好啦，对话到这里结束啦！", []))
#endregion

}

