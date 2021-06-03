/// @function rgb(red,green,blue)
/// @arg red
/// @arg green
/// @arg blue
function rgb(red, green, blue) {
	return make_color_rgb(red,green,blue)
}
/// @function rgb(hue,saturation,value)
/// @arg hue
/// @arg saturation
/// @arg value
function hsv(hue, saturation, value) {
	return make_color_hsv(hue,saturation,value)
}
/// @arg color
function getRGB(col) {
	return [color_get_red(col), color_get_green(col), color_get_blue(col)]
}
/// @arg color
function getHSV(col) {
	return [color_get_hue(col), color_get_saturation(col), color_get_value(col)]
}
/// @desc 两个颜色混合
/// @arg col1
/// @arg col2
function color_blend(col1, col2) {
	var rgb1=getRGB(col1),
		rgb2=getRGB(col2);
	return rgb(max(0, rgb1[0]-(255-rgb2[0])), 
				max(0, rgb1[1]-(255-rgb2[1])), 
				max(0, rgb1[2]-(255-rgb2[2])))
}