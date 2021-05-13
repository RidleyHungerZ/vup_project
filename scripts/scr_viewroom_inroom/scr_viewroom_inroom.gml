//判定玩家所在房间
function scr_viewroom_inroom(){
	with obj_view {
		var outroom=true,
			last_range=[global.room_xl, global.room_yt, global.room_xr, global.room_yb]
		for(var i=0;i<ds_list_size(room_range_list);i++) {
			with room_range_list[| i] {
				if !use continue
				var range_in=[bbox_left, bbox_top, bbox_right+1, bbox_bottom+1],
					range_out=[bbox_left, bbox_top, bbox_right+1, bbox_bottom+1]
				if instance_exists(inst_in) 
					range_in=[inst_in.bbox_left, inst_in.bbox_top, inst_in.bbox_right+1, inst_in.bbox_bottom+1]
				if instance_exists(inst_out)
					range_out=[inst_out.bbox_left, inst_out.bbox_top, inst_out.bbox_right+1, inst_out.bbox_bottom+1]
				//房间边缘
				if range_in[0]==0 
					range_in[0]=0-VIEW_W
				if range_in[2]==room_width 
					range_in[2]=room_width+VIEW_W
				if range_in[1]==0 
					range_in[1]=0-VIEW_H
				if range_in[3]==room_height 
					range_in[3]=room_height+VIEW_H
				
				if range_out[0]==0 
					range_out[0]=0-VIEW_W
				if range_out[2]==room_width 
					range_out[2]=room_width+VIEW_W
				if range_out[1]==0 
					range_out[1]=0-VIEW_H
				if range_out[3]==room_height 
					range_out[3]=room_height+VIEW_H
				
				if between(obj_player.x, range_in[0], true, range_in[2], true)
				&& between(obj_player.y, range_in[1], true, range_in[3], true) {
					global.room_xl=bbox_left
					global.room_yt=bbox_top
					global.room_xr=bbox_right+1
					global.room_yb=bbox_bottom+1
					other.room_range_inst=id
				}
				if between(obj_player.x, range_out[0], true, range_out[2], true)
				&& between(obj_player.y, range_out[1], true, range_out[3], true) {
					outroom=false
				}
			}
		}
		if outroom {
			room_range_inst=noone
			global.room_xl=0
			global.room_yt=0
			global.room_xr=room_width
			global.room_yb=room_height
		}
		if last_range[0]>global.room_xl global.room_change_xl=1
		if last_range[1]>global.room_yt global.room_change_yt=1
		if last_range[2]<global.room_xr global.room_change_xr=1
		if last_range[3]<global.room_yb global.room_change_yb=1
	}
}