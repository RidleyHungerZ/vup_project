/// @desc 设置滚动条数值
/// @arg val
/// @arg beg
/// @arg end
/// @arg max
function scr_menu_scroll_set(val, _begin, _end, _max){
	if val<_begin {
		_begin=val
		_end=_begin+(_max-1)
	}
	else if val>=_end {
		_end=val
		_begin=_end-(_max-1)
	}
	return [val, _begin, _end, _max]
}
/// @desc 绘制滚动条
/// @arg x
/// @arg y
/// @arg imx 滚动条方向
/// @arg imy 滚动条长度/16
/// @arg begin 最上数字
/// @arg max 最大显示量
/// @arg allcount 实际总量
function scr_draw_menu_scroll(xx, yy, imx, imy, _begin, _max, allcount){
	draw_sprite_ext(spr_menu_option_scroll_line, 0, xx, yy, 1, imy, 0, c_white, 1)
	var rate=min(1, _begin/(allcount-_max)),
		scroll_button_h=sprite_get_height(spr_menu_option_scroll_button)
	draw_sprite_ext(spr_menu_option_scroll_button, 0, xx+16*imx, yy+(16*imy-scroll_button_h)*rate, imx, 1, 0, c_white, 1)
}