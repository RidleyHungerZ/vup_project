event_inherited();
if(!scr_menu_trem()) exit;
if(scr_boss_isget(bs) || hp<=0) exit;
if(!is_war_boss) exit;
var cenx=(_xl+_xr)/2,
	cenrx=(_xr-_xl)/2;
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
		//1-
		if(_p<100) action=1;
		//2-
		else if(_p<200) action=2;
		//3-
		else if(_p<300) action=3;
		//4-
		else action=4;
		
		if(skill_useall([1,2,3,4])) action=_a;
		
		if(action==_a*10)
			action=_a;
		
	}
	
	//5-咏唱超级爆破
	if(global.boss_hp<=hp_up/2) {
		if(action_round=0) action=5;
		if(action>=1) action_round=(action_round+1)mod 5;
	}
	
	//skill_addary();
}
#endregion
#region 1-
if(action==1 && time==0) {
	
}
#endregion