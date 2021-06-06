event_inherited();
if(!scr_menu_trem()) exit;
if(scr_boss_isget(bs) || hp<=0) exit;
if(!is_war_boss) exit;
////////////////////////////////
/////////////动作分配/////////////
////////////////////////////////
#region 0-动作分配
if(action_distribution()) {
	if(action==0) time=30;
	else time=10;
	
	var _a=action;
	while(_a=action) {
		var _p=random(400);
		//1-导弹
		if(_p<100) action=1;
		//2-大导弹
		else if(_p<200) action=2;
		//3-丢爆破
		else if(_p<300) action=3;
		//4-抓人
		else action=4;
			
		if(skill_useall([1,2,3,4])) action=_a;
		
		if(action==_a*10)
			action=_a;
	}
	action=1

	//5-飞撞
	if(global.boss_hp<=hp_up/2) {
		if(action_round=0) action=5;
		if(action>=1) action_round=(action_round+1)mod 5;
	}
	
	//skill_addary();
}
#endregion
#region 1-导弹
if(action==1 && time==0) {
	lanuch[0].open(1)
	action=1.1
	time=30
}
if action==1.1 && time==0 {
	lanuch[0].lanuch()
	action=1.2
	time=120
}
if action==1.2 && time==0 {
	lanuch[0].close()
	action=1.3
	time=30
}
if action==1.3 && time==0 {
	action=0.1
}
#endregion
#region 2-大导弹
if(action==2 && time==0) {
	lanuch[0].open(2)
	action=2.1
	time=30
}
if action==2.1 && time==0 {
	lanuch[0].lanuch()
	action=2.2
	time=120
}
if action==2.2 && time==0 {
	lanuch[0].close()
	action=2.3
	time=30
}
if action==2.3 && time==0 {
	action=0.2
}
#endregion