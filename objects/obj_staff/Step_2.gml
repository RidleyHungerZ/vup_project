#region 游戏暂停
switch(global.stop){
	case 0.5:{
		global.stop=1
		break
	}
	case -0.5:{
		global.stop=0
		break
	}
}
#endregion