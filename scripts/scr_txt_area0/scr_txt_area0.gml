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
@"和平纪念日临近，各区域住民有条不紊的准备着庆典仪式，
交通路况日渐繁忙，各位住民请务必注意出行安全，
道路千万条，安全第一条，行驶不规范，亲人两行泪。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.normal, 1, false,
@"这样嘛……看来最近有的要忙了呢。")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 1, false,
@"随着注册PRO经营者的申请日渐增多，
NEO巴比伦政府发起了"+TXT_KEY+@"“关于规范化PRO经营者申请注册流程的题案”"+TXT_W+@"研讨。
望广大经营者群体周知，积极参与，提供您的宝贵建议。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kuMen, 1, false,
@"啊……看来注册认证要变得更麻烦了的样子……
还好上个月提交过申请了，但愿这次能过吧。")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 1, false,
@"近日K区域电子暴乱事件发生频率有所提高，望周遭住民提高警惕，
建议减少非必要情况下的出行。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kuMen, 1, true,
@""+TXT_KEY+@"K区……旧街区"+TXT_W+@"那边嘛……希望物流跟货物不要出什么问题吧……")
//物语电话
thread_talk(prg, inx, TALK_INX.both, -1, TALK_SHOTO.player, PLAYER_SHOTO.normal, 1)
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"加奈最近过得怎么样，作息正常了么？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.wuNai, 1, false,
@"还不是就那样……嘛嘛……这都很正常……
联系窝是有什么情况么？还是新委托？")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"倒也没什么，贺电而已，你之前提交的PRO经营者认证申请通过了。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jingXi, 1, false,
@"是嘛？！好耶！！可算是熬出头了XD！")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"瞧把你高兴的，之后政府会派专人来办理后续手续的，可别得意忘形了啊。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kaiXin, 1, false,
@"了解～")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"话说"+TXT_KEY+@"货物"+TXT_W+@"安全嘛？上次跟你强调过的那件。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jingXi, 1, false,
@"放心，安全的不得了，就在手边。
是叫什么来着……"+TXT_KEY+@"『虚拟驱动器』"+TXT_W+@"是吧！")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"不是叮嘱过你！给我存放在安全级别最高的保险区域的嘛！那可是政府的……")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"滋滋……滋滋……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.kuMen, 1, true,
@"嗯？信号不好吗？
真是的，有那么夸张吗……窝可是看得好好的……")
//爆炸
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.huangZhang, 1, false,
@"怎么回事？……刚才是爆炸？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.huangZhang, 1, true,
@"先看下监控镜头……")
//监控器
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"这是……有"+TXT_KEY+@"电子暴徒"+TXT_W+@"跑到仓库里来了！
这群蟑螂怎么到处跑！
刚才的爆炸声是他们搞的吗？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"大门那边情况怎么样……")
//监控切到大门
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"没信号……仓库大门的监控器被破坏了！
难道刚才的爆炸是发生在大门那里？")
//关闭监控
thread_talk(prg, inx, TALK_INX.down, -1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"有点不妙……得出去看看，弄清楚状况……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"这个东西……先带在身上吧，防止这群家伙溜到办公室来！")
//仓库办公室门口
thread_talk(prg, inx, TALK_INX.both, 1, TALK_SHOTO.npc, 0, 2)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"对了，先叫物语stor帮忙支援一下！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"紧急呼叫，物语stor，
K.A.N.A.资源管理所确认遭受到不明暴乱袭击，请求战术支援！
重复，请求战术支援！")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"滋滋……滋滋……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"怎么还没好……难道网络也被那群电子暴徒给切断了？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"真是烦人，只能亲自清理一下这群家伙了！")
#endregion
#region 通风管道
prg=3 inx=0
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"可恶……怎么偏偏这个时候门坏了！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"其他路线……有了！
通风管道连接着那一边，希望没有被堵住……
就从"+TXT_KEY+@"上面的通风管道"+TXT_W+@"过去吧！")
#endregion
#region 仓库大门外
prg=4 inx=0
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"果然……仓库大门被强行打开了，监控器也被他们炸飞了。
都到这里了，应该可以用外面的网络联络一下物语stor了吧。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"紧急呼叫，物语stor，K.A.N.A.资源管理所确认遭受到不明暴乱袭击，
目前已到达仓库大门，请求战术支援！
重复，请求战术支援！")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 0, 2, false,
@"滋滋……滋滋……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"怎么还是这样……难道是电波被屏蔽了？
莫非那群电子暴徒还带了有电波干扰能力的暴徒过来？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"啊！好烦！怎么偏偏是窝碰上这种事！")
//暴徒冒出
thread_talk(prg, inx, TALK_INX.down, 1, -1, -1, -1)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.huangZhang, 1, false,
@"咦……咦？！！
怎么突然冒出来这么多蟑螂！
到底是从哪里跑出来的！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"完了完了！被包围了！
这么多的数量窝可打不过啊！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"到底是怎么回事……这群家伙的行动也太反常了，
怎么会如此大规模的跑来袭击窝的仓库……")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
@"难道……他们是来找什么东西的？
可窝这里哪有什么贵重的货物？")
//腰带闪光
thread_talk(prg, inx, TALK_INX.both, 1, TALK_SHOTO.npc, 0, 2)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"物语stor交给窝的这玩意怎么开始闪光了？
……难道说，这群家伙是来找这个的？")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"说起来物语stor有提到过让窝把这玩意放到安全级别最高的区域……
"+TXT_KEY+@"『虚拟驱动器』"+TXT_W+@"……这到底是什么东西？")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 3, 3, true,
@"Virtua Ride System……Standing By……")
//变身

#endregion


#region BOSS
prg=0 inx=0
//thread_talk(prg, inx, TALK_INX.both, 1, TALK_SHOTO.boss, 0, 0)
//thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.yiHuo, 1, false,
//@"这是……什么东西？")
//thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.boss, 0, 0, false,
//@"监测到人员侵入，启动防御系统！")
//thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, true,
//@"可恶……只能上了！")
#endregion
}