event_inherited();
run=function() {
	if action==0 {
		global.operate=0
		global.menu_operate=0
		action=1
		menu_time=30
	} 
	//开启菜单
	else if action==1 && menu_time==0 {
		global.Start_state=1
		action=1.1
	} else if action==1.1 {
		global.Start_state=0
		action=2
		menu_time=60
	}
	//切换到技能页
	else if action==2 && menu_time==0 {
		global.L_state=1
		action=2.1
	} else if action==2.1 {
		global.L_state=0
		action=3
		menu_time=30
	}
	//结束操作
	else if action==3 && menu_time==0 {
		global.menu_operate=1
		scr_room_freedom()
		instance_destroy()
	}
}