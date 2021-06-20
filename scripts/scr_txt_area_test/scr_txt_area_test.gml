function scr_txt_area_test(){
var prg=0, inx=0
#region 神秘对话
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
}