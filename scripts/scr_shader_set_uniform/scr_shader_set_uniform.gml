function scr_shader_set_uniform_f(shader, uname, value){
	var uniform = shader_get_uniform(shader, uname);
	shader_set_uniform_f(uniform, value)
}
function scr_shader_set_uniform_f_array(shader, uname, value){
	var uniform = shader_get_uniform(shader, uname);
	shader_set_uniform_f_array(uniform, value)
}
function scr_shader_set_uniform_i(shader, uname, value){
	var uniform = shader_get_uniform(shader, uname);
	shader_set_uniform_i(uniform, value)
}
function scr_shader_set_uniform_i_array(shader, uname, value){
	var uniform = shader_get_uniform(shader, uname);
	shader_set_uniform_i_array(uniform, value)
}