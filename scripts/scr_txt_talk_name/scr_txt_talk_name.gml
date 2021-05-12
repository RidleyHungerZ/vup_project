function scr_txt_talk_name() {
var stype
#region 主角
stype=TALK_SHOTO.player
global.txt_names[stype][0]="？？？"
global.txt_names[stype][1]="相沢加奈"
#endregion
#region BOSS
stype=TALK_SHOTO.boss
global.txt_names[stype][0]="？？？"
global.txt_names[stype][1]="杂兵队长"
#endregion
#region npc
stype=TALK_SHOTO.npc
global.txt_names[stype][0]="？？？"
global.txt_names[stype][1]="物语stor"
#endregion
}