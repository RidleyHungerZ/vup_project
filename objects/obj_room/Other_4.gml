#region 设置道具情况
instance_activate_object(obj_item)
var map = global.item_area_map
if ds_map_exists(map, room){
	var list = map[? room]
	with obj_item{
		if !inst_of(id, obj_item_special) && destory_time==-1 {
			var have = false
			for(var i=0;i<ds_list_size(list);i++){
				var pos = list[| i]
				if xstart = pos[0] && ystart = pos[1] && object_index = pos[2]{
					have = true
					break
				}
			}
			if !have instance_destroy()
		}
	}
}
#endregion