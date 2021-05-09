/// @arg color
/// @arg lumin[0-1]
function scr_shader_rendering(color, lumin) {
	var 
	red=color_get_red(color),
	green=color_get_green(color),
	blue=color_get_blue(color);

	var shader=shd_set_rendering;
	shader_set(shader)
	var colSet = [red/255 , green/255 , blue/255 , lumin]
	shader_set_uniform_f_array(shader_get_uniform(shader, "colSet"), colSet)
}
