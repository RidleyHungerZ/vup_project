event_inherited();
if(!scr_menu_trem()) exit;
#region BOSS战开始或两方都空血或使用死亡系统
if((global.boss_hp<=0 || hp<=0)
&& global.boss_war==1
&& use_death_system_boss)
	speed=0;
#endregion
#region 爆炸动画
if(boom_time>0) boom_time-=1;
else boom_time=0;
//死亡未爆炸
if(global.boss_hp<=0 
&& boom<=0
&& !deathTriggerExecuted) {
	deathTriggerExecuted=true;
	deathTrigger();
}
#endregion
