/// @desc 序关文本
function scr_txt_area0(){
var prg=0, inx=0
#region BOSS
thread_talk(prg, TALK_INX.both, 1, TALK_SHOTO.boss, 0, 0)
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, 0, 0, false,
@"这是……什么东西？")
thread_talk_txt(prg, inx++, TALK_INX.up, TALK_SHOTO.boss, 0, 0, false,
@"监测到人员侵入，启动防御系统！")
thread_talk_txt(prg, inx++, TALK_INX.down, TALK_SHOTO.player, 0, 0, true,
@"可恶……只能上了！")
#endregion
}