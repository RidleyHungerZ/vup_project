/// @desc 获得道具
/// @type
/// @inx
function scr_item_gain(type, inx){
	if type==ITEM.A {
		global.item[type][inx]=1
	} else if type==ITEM.B {
		if global.item[type][inx]==ITEMB_STATUS.null {
			global.item[type][inx]=ITEMB_STATUS.close
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
		global.item[type][inx]=ITEMB_STATUS.close
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
		return ds_list_exists(global.itemlist[type], inx) && global.item[type][inx]!=ITEMB_STATUS.null
	} else if type==ITEM.C {
		return ds_list_exists(global.itemlist[type], inx) && global.item[type][inx]>0
	}
}
/// @desc 存在道具
/// @type
/// @inx
function scr_itemb_isopen(inx) {
	return global.item[ITEM.B][inx]==ITEMB_STATUS.open
}
/// @desc 超载点数
function scr_itemb_overload(){
	return max(0, obj_menu.menu_item_byte_sum-global.item2_byte_max)
}