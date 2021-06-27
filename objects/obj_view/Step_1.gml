#region 记录玩家位移
global.player_dx=obj_player.x-player_x
global.player_dy=obj_player.y-player_y
player_x=obj_player.x
player_y=obj_player.y
#endregion
#region 镜头房间控制
var posxy={
	x : obj_player.x+global.view_xcen_shift,
	y : obj_player.y+global.view_ycen_shift
}
//镜头偏移
if(global.operate==1 && scr_menu_trem())
|| obj_player.death_cliff {
	if(global.view_xcen_shift!=prev_view_xcen_shift){
		global.room_change_xl=1
		global.room_change_xr=1
	}
	if(global.view_ycen_shift!=prev_view_ycen_shift){
		global.room_change_yt=1
		global.room_change_yb=1
	}
	scr_view_freedom(posxy,true,true)
	x=round(x)
	y=round(y)
	prev_view_xcen_shift=global.view_xcen_shift
	prev_view_ycen_shift=global.view_ycen_shift
}
//房间变换
if global.operate==1{
    if lastroom_xl>global.room_xl
        global.room_change_xl=1
    else if lastroom_xl<global.room_xl
        global.room_change_xr=1
    
    if lastroom_xr>global.room_xr
        global.room_change_xl=1
    else if lastroom_xr<global.room_xr
        global.room_change_xr=1

    if lastroom_yt>global.room_yt
        global.room_change_yt=1
    else if lastroom_yt<global.room_yt
        global.room_change_yb=1
    
    if lastroom_yb>global.room_yb
        global.room_change_yt=1
    else if lastroom_yb<global.room_yb
        global.room_change_yb=1
	if view_ycenpos(0)<=posxy.y
		global.room_change_yt=0
	if view_ycenpos(0)>=posxy.y
		global.room_change_yb=0
	if abs(view_xcenpos(0)-posxy.x)<=4{
		global.room_change_xl=0
		global.room_change_xr=0
	}
}
else{
    global.room_change_xl=1
    global.room_change_xr=1
    global.room_change_yt=1
    global.room_change_yb=1
}
lastroom_xl=global.room_xl
lastroom_xr=global.room_xr
lastroom_yt=global.room_yt
lastroom_yb=global.room_yb
#endregion
#region 大招动画
if unskill_action!=0 {
	if unskill_time>0 unskill_time--
	else unskill_time=0
} else {
	unskill_time=0
}
if unskill_action==1 {
	global.stop=0.5
	scr_sound_menu_play(se_unskill_appear)
	unskill_action=2
	unskill_time=150
} 
else if unskill_action==2 && unskill_time==0 {
	scr_sound_menu_play(se_title_disapper)
	unskill_action=3
	unskill_time=5
} 
//变白
else if unskill_action==3 && unskill_time==0 {
	unskill_action=4
	unskill_time=5
} 
//淡出
else if unskill_action==4 && unskill_time==0 {
	if unskill_endstop
		global.stop=-0.5
	unskill_action=0
	unskill_time=0
}
#endregion