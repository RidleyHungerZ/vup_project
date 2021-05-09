/// @description 房间坐标矫正
if(!is_war_boss) exit;
if(hitedstp!=0) {
    hited=hitedstp;
    hitedstp=0; //清除hit记录
}
else{
	hp=ceil(hp); //停止连打后，hp向上取整
    if(hited!=0) 
        hited=0; //如果有值则清除hit
}
if(global.boss_war==1
|| global.player_hp<=0) {
	rx=x-_xl;
	ry=y-_yt;
	rpos=true;
	if(hp_only==1) 
		global.boss_hp=hp;
}
#region 精灵播放帧速修改区
if(scr_menu_trem())
	sprspd_adjust();
#endregion
if(!scr_menu_trem()) exit;
scr_time_alarm();