function scr_txt_area_test(){
var prg=0, inx=0
#region 阿燕BOSS
prg=10 inx=0
thread_talk(prg, inx, TALK_INX.both, 1, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1)
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 15, 6, false,
@"呀哈~意外吗，关底的BOSS其实是我。")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.fenNu, 1, false,
@"……阿燕？
为什么乃会在这里？")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 15, 6, false,
@"世界的旅行者可以出现在任何地方。
不过比起聊这个……")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 16, 6, true,
@"既然能到达这里，
加奈，就准备好迎接挑战吧！")
#endregion
#region 打败阿燕
prg=11 inx=0
thread_talk(prg, inx, TALK_INX.both, 1, TALK_SHOTO.npc, 15, 6)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jingXi, 1, false,
@"赢，赢了！")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 15, 6, false,
@"呼……很厉害嘛，加奈。
恭喜你，顺利通过了哦~")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, PLAYER_SHOTO.jingXi, 1, false,
@"哎，到这里就结束了么？")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 15, 6, false,
@"后面就是我们的行动据点了，
蓝蓝和物语都在里面等着你，
你先去和他们见面吧。")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.npc, 15, 6, true,
@"那么，我先告辞了！")
#endregion
}