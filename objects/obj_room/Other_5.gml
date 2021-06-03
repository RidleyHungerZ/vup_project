#region 保存道具情况
if item_not_set = 1{
	item_not_set = 0
	//清除道具情况
	var map = global.item_area_map,
		key = ds_map_find_first(map),
		size = ds_map_size(map)
	repeat(size){
		var list = map[? key]
		ds_list_destroy(list)
		key = ds_map_find_next(map, key)
	}
	ds_map_clear(map)
	exit
}
instance_activate_object(obj_item)
var map = global.item_area_map,list
if ds_map_exists(map, room) list = map[? room]
else{
	list = ds_list_create()
	map[? room] = list
}
ds_list_clear(list)
with obj_item{
	if !inst_of(id, obj_item_special) && destory_time==-1 {
		ds_list_add(list, [xstart, ystart, object_index])
	}
}
#endregion