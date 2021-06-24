function scr_txt_tips(){
var rom=0, inx=0
#region 序关
rom=0 inx=0
//发射子弹
global.txt_tips[rom][0]=[
@"按"+TXT_K+@"方向键"+TXT_D+@"移动角色，
按"+TXT_K+@"跳跃键"+TXT_D+@"可以跳起，",
@"按"+TXT_K+@"攻击键"+TXT_D+@"发射子弹，
子弹可以"+TXT_K+@"打破箱子障碍物"+TXT_D+@"。",]
//蹲下
global.txt_tips[rom][1]=[
@"地面按"+TXT_K+@"下键"+TXT_D+@"可以蹲下，
蹲下时按"+TXT_K+@"左右键"+TXT_D+@"可以爬行，",
@"爬行时可穿过"+TXT_K+@"狭窄"+TXT_D+@"缝隙。",]
//装甲技能
global.txt_tips[rom][2]=[
@"获得"+TXT_K+@"基础形态"+TXT_D+@"！",
@"可"+TXT_K+@"打开菜单"+TXT_D+@"进入"+TXT_K+@"技能页面"+TXT_D+@"查看
可以使用的技能！",]	
//飞踢
global.txt_tips[rom][3]=[
@"若无法通过移动躲避敌人的攻击，
可以尝试使用"+TXT_K+@"飞踢技能"+TXT_D+@"命中敌人！",
@"飞踢可以获取短暂的"+TXT_K+@"无敌效果"+TXT_D+@"！",]
//援护技能
global.txt_tips[rom][4]=[
@"当援护能量积攒满时，按"+TXT_K+@"援护技能键"+TXT_D+@"
即可发动援护技能，使用超强力的攻击！",
@"援护能量可以靠"+TXT_K+@"不断攻击敌人"+TXT_D+@"来获得！",]
#endregion
}