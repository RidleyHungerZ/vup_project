/// @desc 序关文本
function scr_txt_area0(){
var prg=0, inx=0
#region 神秘对话
prg=0 inx=0
thread_talk(prg, inx, TALK_INX.both, 1, TALK_SHOTO.npc, 2, 0)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 1, 0, false,
@"NEO巴比伦准备的怎么样了？")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 2, 0, false,
@"差不多了，服务器已经可以承载下目前的所有人类了。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 1, 0, false,
@""+TXT_KEY+@"『经营者』"+TXT_W+@"体系的原理还有进展吗？")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 2, 0, false,
@"没有……我们还是没法理解为什么人类可以从"+TXT_KEY+@"『存在支持度』"+TXT_W+@"中得到力量……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 1, 0, false,
@"科技的下一次进步关键点应该就在这里了。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 1, 0, false,
@"还有，把小型『存在支持度』实验机项目的安全等级拉到最高，
除了我们两人之外，其他任何人不可访问相关资料和数据。")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 2, 0, false,
@"另外两位负责人也不能吗？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 1, 0, false,
@"不能。")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 2, 0, false,
@"博士，我还是想问一下，让全人类都进到虚拟世界真的是好事吗？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 1, 0, true,
@"……我不知道。")
#endregion
#region 仓库办公室
prg=2 inx=0
//新闻
thread_talk(prg, inx, TALK_INX.both, -1, TALK_SHOTO.player, PLAYER_SHOTO.normal, 1)
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 1, false,
@"和平纪念日临，近各区域住民有条不紊的准备着庆典仪式，交通路况日渐繁忙，
各位住民请务必注意出行安全。
道路千万条，安全第一条，行驶不规范，亲人两行泪。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.normal, 1, false,
@"庆典啊……看来最近有的要忙了呢。")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 1, false,
@"随着注册"+TXT_KEY+@"PRO经营者"+TXT_W+@"的申请日渐增多， 
NEO巴比伦政府发起了“关于规范化经营者申请注册流程的题案”研讨。
望广大经营者群体周知，积极参与，提供您的宝贵建议。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.normal, 1, false,
@"啊……看来注册认证要变得更麻烦了的样子……
还好上个月提交过申请了， 但愿这次能过吧。")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 1, false,
@"近日K区域暴乱事件发生频率有所提高，
望附近住民提高警惕。建议减少非必要情况下的出行。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kuMen, 1, true,
@"K区……旧街区那边嘛……希望物流跟货物不要出什么问题吧……")
//物语电话
thread_talk(prg, inx, TALK_INX.both, -1, TALK_SHOTO.player, PLAYER_SHOTO.normal, 1)
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"您好，我叫物语stor，您可以称呼我为物语，是您本次管理委托任务的联络人。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jingXi, 1, false,
@"啊……是"+TXT_KEY+@"『NEO巴比伦』"+TXT_W+@"委托的那件嘛？")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"是的。本次任务的完成情况将直接关系到您的PRO经营者认证评定。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, false,
@"这样啊，窝大概了解了……
委托内容的货物是叫……"+TXT_KEY+@"『虚拟驱动器』"+TXT_W+@"？
好奇怪的名字……")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, true,
@"是的，"+TXT_KEY+@"货物对『NEO巴比伦』非常重要"+TXT_W+@"。
相沢加奈，一定要保护好货物的安全，我会看……着……")
//信号中断
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.ziXin, 1, true,
@"咦，信号不好吗？
放心~安全的不得了，那个跟游戏机一样的东西就在手边，窝可是看得好好的……")
//爆炸
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.huangZhang, 1, false,
@"刚才是爆炸？怎么回事……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.huangZhang, 1, true,
@"有点不妙，得先看下监控镜头……弄清楚状况……")
//监控器
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"这是……暴乱体！
怎么会跑到我这里来？
可恶……都已经快到这里了嘛……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"大门那边情况怎么样……")
//监控切到大门
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"没信号……连接不上大门的监控设备……
难道刚才的爆炸是那群家伙突入大门么……真是疯狂……")
//关闭监控
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jianDing, 1, false,
@"我这里又没有什么贵重货物，他们怎么会到这里来？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jianDing, 1, false,
@"等一下……他们的目标不会是这个东西吧？
『虚拟驱动器』……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jianDing, 1, false,
@"不管怎么样，再这样下去他们就要到这里来了。
我得出去主动“排除危险”了，到大门那边看看到底怎么回事。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jianDing, 1, true,
@"这个货物……为确保货物安全还是带在身上为妙！")
//仓库办公室门口
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jianDing, 1, false,
@"对了，先联系一下联络人……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jianDing, 1, true,
@"紧急呼叫，物语stor！
K.A.N.A.资源管理所确认遭受到不明暴乱袭击，请求战术支援！
重复，请求战术支援！")
//信号中断
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"这是通讯干扰嘛……
这群暴乱体准备的还挺充分。
等一会到了大门那边再试试联系吧！")
#endregion
#region 通风管道
prg=3 inx=0
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"可恶……偏偏这个时候门坏了！
也是那群家伙干得好事嘛？
其他路线……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.ziXin, 1, true,
@"有了！"+TXT_KEY+@"上面有通风管道"+TXT_W+@"！
想困住窝可没有那么容易。")
#endregion
#region 仓库大门外
prg=4 inx=0
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"这些家伙果然是从大门突入的，赶紧联系物语做紧急维护处理！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jianDing, 1, false,
@"紧急呼叫，物语stor，
K.A.N.A.资源管理所确认遭受到不明暴乱袭，仓库大门遭到破坏！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jianDing, 1, true,
@"目前已携带货物抵达仓库大门，请求紧急维护与战术支援！
重复一遍，请求紧急维护与战术支援！")
//通信中断
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"怎么还是这样，难道不只是简单屏蔽了仓库的电波吗？
这怎么办……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"可恶，怎么偏偏是窝碰上这种事……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"再往前走走看看吧！")
//暴徒冒出
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.huangZhang, 1, false,
@"咦……咦？！！
怎么突然冒出来这么多暴乱体！
到底是从哪里跑出来的！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"糟了！被包围了！
这么多的数量窝可打不过啊！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"到此为止了嘛……")
//腰带闪光
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 3, 3, true,
@"Virtua Ride System……
Accessing……CodeName:AizawaKana……
Ride On！")
//变身
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, false,
@"呼……呼……
刚刚……发生了什么了……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, false,
@"感觉身体好轻，
体内又像是有什么在涌动似的……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, false,
@"这个腰带……是那个货物变的？
还有这些卡片跟装甲……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jingXi, 1, true,
@"这都什么跟什么嘛……
不管了！先离开这里，联系上物语要紧！
得汇报货物的情况。")
#endregion
#region BOSS
prg=5 inx=0
thread_talk(prg, inx, TALK_INX.both, 1, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1)
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.boss, 1, 1, false,
@"一群杂碎……连个看仓库的女人都摆不平，还得本大爷亲自出马。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"这……这不是窝上个月刚买的ES-02型么！
乃们这些家伙……太过份了！")
#endregion
#region BOSS结束
prg=6 inx=0
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.meiShuiXing, 1, false,
@"总算是……结束了……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.meiShuiXing, 1, true,
@"好累……
身体……没有力气了……")
//趴下
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 3, 2, false,
@"……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 6, 2, false,
@"这种程度的力量……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.npc, 7, 2, false,
@"可用之材……")
#endregion
}