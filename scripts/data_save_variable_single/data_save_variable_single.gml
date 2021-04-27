function data_save_variable_single(){
	global.start_current=0//存档开始时间
	global.second=0
	global.minute=0
	global.hour=0
	global.game_cleared=false//已通关
#region 玩家区
	global.mode=1//当前模式
	/////////////////////////
	global.player_hp=32
	global.player_hp_aft=global.player_hp	//受伤红血
	global.player_hp_up=32
	global.player_hp_ex=0	//一次性扩展血条
	global.player_mp=32
	global.player_mp_up=32
	global.player_mp_ex=0	//一次性扩展能量
	global.player_support=0 //羁绊值
	//global.player_life=2
	global.player_es=0
	/////////////////////////
	global.model=PLAYER_MODEL.HU
	global.model_get_number=1//获得模块数量
	global.model_number=11
	global.model_get=array_create(global.model_number, 0)
	global.main_sub_exchange=array_create(global.model_number, 0)
	global.sub_change=array_create(global.model_number, 0)
	global.model_get[PLAYER_MODEL.HU]=1 //默认拥有人形
	global.exskill=array_create(8, 0)
#endregion
#region 道具
	//上限道具
	for(var i=0;i<4;i++) {
		global.hpup[i]=0 //生命上限
		global.mpup[i]=0 //能量上限
		global.rtank[i]=0 //坦克上限
		global.rtank_val[i]=0 //坦克存储量
	}
	global.itemlist=[
		ds_list_create(), //消耗品
		ds_list_create(), //装备品
		ds_list_create(), //贵重品
	]
	//道具获取数量/状态等，每种道具上限50个
	for(var i=0;i<3;i++) {
		for(var t=0;t<50;t++) {
			//消耗品、贵重品数量
			//装备品0未获得，1获得未开启，2开启
			global.item[i][t]=0
		}
	}
	global.item2_byte_max=10 //装备品总插槽数
#endregion
#region 剧情
	//击败的boss和subboss记录
	for(var i=0;i<=30;i++){
		global.boss[i]=0
		for(var j=0;j<=8;j++){
			global.sub_bosses[i][j]=0
		}
	}
	/////////////////////////
	//各种剧情是否进行过
	for(var i=0;i<=500;i++){
		global.thread[i]=0 //剧情已经开启过了
		global.threaded[i]=0 //第一次进行时开启，以后可跳过
	}
	global.mission[MISSION_TYPE.main]=array_create(20, 0)
	global.mission_list[MISSION_TYPE.main]=ds_list_create()
	global.mission[MISSION_TYPE.sub]=array_create(20, 0)
	global.mission_list[MISSION_TYPE.sub]=ds_list_create()
#endregion
}