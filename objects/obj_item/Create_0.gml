event_inherited();
action=0
sprite=sprite_index
spr_loopinx=0 //动画开始循环帧
destory_time=-1 //消失计时，-1不计时
itemval=0 //道具有效值
//有时限创建道具
create=function() {
	scr_sprite_change(-2, 0, 0)
	destory_time=240
	vspeed=-4
	gravity=GRAV
	action=1
}
//吃到后执行
execute=function() {}
//吃到后执行(无视菜单)
executeNoStop=function() {}