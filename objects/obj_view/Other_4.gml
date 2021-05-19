x=view_xcenpos(0)
y=view_ycenpos(0)

room_set_view_enabled(room, true)
view_visible[0]=true
camera_set_view_size(view_camera[0], view.width, view.height)
camera_set_view_border(view_camera[0], view.width/2, view.height/2)
camera_set_view_target(view_camera[0], self.id)
view_set_xport(0, view.xport)
view_set_yport(0, view.yport)
view_set_wport(0, view.wport)
view_set_hport(0, view.hport)
view_visible[1]=true
camera_set_view_size(view_camera[1], ui.width, ui.height)
view_set_xport(1, ui.xport)
view_set_yport(1, ui.yport)
view_set_wport(1, ui.wport)
view_set_hport(1, ui.hport)

global.room_xl=0
global.room_xr=room_width
global.room_yt=0
global.room_yb=room_height

//获取所有房间范围
ds_list_clear(room_range_list)
with obj_viewroom_real {
	if use {
		ds_list_add(other.room_range_list, id)
	}
}
ds_list_sort(room_range_list, true)
//镜头聚焦中心
if instance_exists(obj_player)
	scr_view_set_with_inst(obj_player)
//背景刷新
scr_background_get();