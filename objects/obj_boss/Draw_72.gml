/// @description 真实坐标对其
if(view_current!=0) exit;
if(!is_war_boss) exit;
if(global.boss_war==1
|| global.player_hp<=0) {
	x=rx+_xl;
	y=ry+_yt;
	rpos=false;
}