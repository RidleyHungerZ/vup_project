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
npc_talk_start(npc, group, TALK_INX.both, TALK_SHOTO.npc, 10, 5)
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kaiXin, 1, -1, 
@"蓝蓝早上好吖XD，
系统的运行状态如何~？", [], false))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, 100, 
@"加奈早w，系统一切正常~
需要执行调查任务或者传送去其他区域的话，
直接跟我说一声就好噢！", [], false))
inx=100
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"请问有什么可以帮助你的吗？", [
new npcTalkSelect("关于暴乱事件", 110, noone),
new npcTalkSelect("关于物语stor", 120, noone),
new npcTalkSelect("关于纯蓝blue自己", 130, noone),
new npcTalkSelect("关于仓库", 140, noone),
new npcTalkSelect("关于货物", 150, noone),
new npcTalkSelect("再见", 160, noone),
], false))
//关于暴乱事件
inx=110
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 13, 5, -1, 
@"阿巴阿巴……呜……
最近的暴乱事件频发率好像又攀升了……", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.huangZhang, 1, 100, 
@"啊这……窝……窝会尽快调查清楚的！
蓝蓝先冷静！", []))
//关于物语stor
inx=120
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, -1, 
@"蓝蓝知道『物语stor』这个人吗？", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"正在检索『物语stor』……", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 12, 5, 100, 
@"『虚拟驱动器』计划负责人……
其余资料访问权限不足。", []))
//关于纯蓝blue自己
inx=130
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.weiXiao, 1, -1, 
@"蓝蓝有的时候真看不出是AI呢。", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"谢谢夸奖~但是必须提醒，
纯蓝blue为军用AI，请勿对其产生奇怪的想法或是有奇怪的行为。
不然会发生什么我也不知道噢~", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.chaoFeng, 1, 100, 
@"欸嘿……", []))
//关于仓库
inx=140
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kaiXin, 1, -1, 
@"居然可以完全复刻窝在仓库的家欸……", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"搬家服务也在可以申请的范围哦~", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.wuNai, 1, 100, 
@"窝也没那么多家可以搬啦……", []))
//关于货物
inx=150
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kuMen, 1, -1, 
@"话说之前仓库里的货物怎么办，商业街好多店铺的货物都储存在那……", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"暴乱事件在不可抗力条款中，所以不用担心违约金。", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kuMen, 1, -1, 
@"窝还是有些愧对那些委托人……", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"那就打起精神来协助解决暴乱吧~", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kaiXin, 1, 100, 
@"说得也是呢！", []))
//再见
inx=160
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 11, 5, -2, 
@"有什么需要和我说一声就好噢！", []))
#endregion
#region 物语
npc="wuyu" 
group="normal" inx=0
npc_talk_start(npc, group, TALK_INX.both, TALK_SHOTO.npc, 3, 2)
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jingXi, 1, -1, 
@"哇噢～布置得紧锣密鼓的……
这些瓶瓶罐罐跟仪器都是干嘛用的？", [], false))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up,TALK_SHOTO.npc, 3, 2, -1, 
@"部分是我从我自己的实验室搬过来的，
不要乱碰。", [], false))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up,TALK_SHOTO.npc, 3, 2, 100, 
@"后调查行动的技术支持就由我提供，
像是物品交易，装备开发，卡片管理之类的。
当然，不是免费的。", [], false))
//选项分支
npc_talk_txt(npc, group, 100, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"那么，有何贵干？", [
new npcTalkSelect("关于商店", 110, noone),
new npcTalkSelect("关于卡片解析", 120, noone),
new npcTalkSelect("关于物语stor自己", 130, noone),
new npcTalkSelect("再见", 140, noone),
], false))
//关于商店
inx=110
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kuMen, 1, -1, 
@"为什么商店里面只卖装备开发方案啊……
就不能直接卖成品给窝么！
还得再花钱……花材料开发……", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, 100, 
@"说得好，但是上面卡我材料了，
你可以跟他们反应一下，能不能把我的材料申请先过了。", []))
//关于卡片解析
inx=120
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, -1, 
@"有几张卡片的解析内容总感觉怪怪的……
该不会是哪个奇怪的家伙写入的吧……", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"你是对我的文风有什么意见么？", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.wuNai, 1, -1, 
@"没……没有的事……
（说多了这个家伙肯定会涨价）", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"别想多了，商品的价格只与其价值有关。", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.wuNai, 1, -1, 
@"（喂，这个家伙是能听到窝在想什么吗？！）", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, 100, 
@"你的表情太明显了，还有没事的话别打扰我了。", []))
//关于物语自己
inx=130
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, -1, 
@"乃也是『Pro经营者』吗？", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"如果是那个认证的话，我没有获得。", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, -1, 
@"可是乃的实验好像一直在使用『存在支持度』，
如果不是『Pro经营者』的话……", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -1, 
@"这种自己产生的东西，为什么要认证才能使用？", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, -1, 
@"窝……窝不明白。", []))
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, 100, 
@"那就别去想，无知者无罪。", []))
//再见
inx=140
npc_talk_txt(npc, group, inx++, new npcTalkContext(TALK_INX.up, TALK_SHOTO.npc, 10, 5, -2, 
@"没事的话别打扰我了。", []))
#endregion
}

