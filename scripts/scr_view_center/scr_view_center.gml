/// @desv 将玩家完全放在中心的镜头设置
/// @arg id
function scr_view_set_with_inst_center(inst) {
	obj_view.x=inst.x
	obj_view.y=inst.y
	view_setx(inst.x-view_wpos(0)/2)
	view_sety(inst.y-view_hpos(0)/2)
}
/// @desc 根据玩家位置将镜头直接移动到位
/// @arg id
function scr_view_set_with_inst(inst) {
	scr_viewroom_inroom()
	scr_view_set_with_inst_center(inst)
	if obj_view.x-view_wpos(0)/2<global.room_xl 
		obj_view.x=global.room_xl+view_wpos(0)/2
	if obj_view.x+view_wpos(0)/2>global.room_xr 
		obj_view.x=global.room_xr-view_wpos(0)/2
	if obj_view.y-view_hpos(0)/2<global.room_yt 
		obj_view.y=global.room_yt+view_hpos(0)/2
	if obj_view.y+view_hpos(0)/2>global.room_yb 
		obj_view.y=global.room_yb-view_hpos(0)/2
	if view_xpos(0)<global.room_xl 
		view_setx(global.room_xl)
	if view_xpos(0)+view_wpos(0)>global.room_xr 
		view_setx(global.room_xr-view_wpos(0))
	if view_ypos(0)<global.room_yt 
		view_sety(global.room_yt)
	if view_ypos(0)+view_hpos(0)>global.room_yb 
		view_sety(global.room_yb-view_hpos(0))
}