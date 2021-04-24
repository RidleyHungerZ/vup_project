/// @desc 获得道具
/// @type
/// @inx
function scr_item_get(type, inx){
	if type==ITEM.A {
		global.item[type][inx]=1
	} else if type==ITEM.B {
		if global.item[type][inx]==ITEMB.null {
			global.item[type][inx]=ITEMB.close
		}
	} else if type==ITEM.C {
		if global.item[type][inx]<99
			global.item[type][inx]++
	}
	if !ds_list_exists(global.itemlist[type], inx)
		ds_list_add(global.itemlist[type], inx)
}
/// @desc 使用道具
/// @type
/// @inx
function scr_item_use(type, inx) {
	if type==ITEM.A {
		global.item[type][inx]=0
		ds_list_remove(global.itemlist[type], inx)
	} else if type==ITEM.B {
		global.item[type][inx]=ITEMB.close
	} else if type==ITEM.C {
		if global.item[type][inx]>0
			global.item[type][inx]--
		if global.item[type][inx]==0
			ds_list_remove(global.itemlist[type], inx)
	}
}
/// @desc 存在道具
/// @type
/// @inx
function scr_item_exist(type, inx) {
	if type==ITEM.A {
		return ds_list_exists(global.itemlist[type], inx) && global.item[type][inx]==1
	} else if type==ITEM.B {
		return ds_list_exists(global.itemlist[type], inx) && global.item[type][inx]!=ITEMB.null
	} else if type==ITEM.C {
		return ds_list_exists(global.itemlist[type], inx) && global.item[type][inx]>0
	}
}