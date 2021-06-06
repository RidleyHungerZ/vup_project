/// @desc 电视屏幕效果
/// @arg surfw 
/// @arg surfh 
/// @arg use_radial 曲面屏
/// @arg radial 曲面曲率
/// @arg use_border 黑边
/// @arg border_size 黑边圆角尺寸
/// @arg border_smoothness 黑边圆角平滑度
/// @arg use_noise 暗光处理
/// @arg noise_strengt 扫描线
/// @arg RGB_separation 亮度
/// @arg scanlines 噪音雪花
/// @arg brightness 噪音尺寸
function scr_shader_CRT(surfw, surfh, 
					use_radial, radial, 
					use_border, border_size, border_smoothness, 
					use_noise, noise_strengt,
					RGB_separation, scanlines, brightness){
	var shader=shd_CRT_shader, 
		vwp0=view_get_wport(1), 
		vhp0=view_get_hport(1);
	shader_set(shader);
	shader_set_uniform_f(shader_get_uniform(shader,	"uni_crt_sizes"), surfw, surfh, vwp0, vhp0);
	//曲面屏
	scr_shader_set_uniform_f(shader,	"uni_use_radial_distortion",	 use_radial); //曲面屏
	scr_shader_set_uniform_f(shader,	"uni_radial_distortion_amount",	 radial); //曲面曲率
	//曲面屏黑边
	scr_shader_set_uniform_f(shader,	"uni_use_border",				 use_border); //曲面屏黑边
	scr_shader_set_uniform_f(shader,	"uni_border_corner_size",		 border_size); //曲面屏黑边圆角尺寸
	scr_shader_set_uniform_f(shader,	"uni_border_corner_smoothness",	 border_smoothness); //曲面屏黑边圆角平滑度
	//噪音
	scr_shader_set_uniform_f(shader,	"uni_use_noise",				 use_noise); //噪音雪花
	scr_shader_set_uniform_f(shader,	"uni_noise_strength",			 noise_strengt); //噪音尺寸
	//其他
	scr_shader_set_uniform_f(shader,	"uni_use_RGB_separation",		 RGB_separation); //暗光处理
	scr_shader_set_uniform_f(shader,	"uni_use_scanlines",			 scanlines); //扫描线
	scr_shader_set_uniform_f(shader,	"uni_brightness",				 brightness); //亮度
	scr_shader_set_uniform_f(shader,	"uni_timer",					 get_timer());
}