if view_current!=1 exit
/// @desc 使用镜头0内容覆盖app
with obj_view {
	if surface_exists(view0_surface_temp) {
		var apsw = surface_get_width(application_surface), 
			apsh = surface_get_height(application_surface), 
			v0sw = surface_get_width(view0_surface_temp), 
			v0sh = surface_get_height(view0_surface_temp),
			xsc = apsw/v0sw,
			ysc = apsh/v0sh;
		//surface_set_target(application_surface)
		draw_clear_alpha(c_black, 0.5)
		gpu_set_blendmode(bm_normal)
		//模糊
		if global.pix_filter==1 {
			gpu_set_texfilter(true)
		} 
		//扫描线
		else if global.pix_filter==2 {
			scr_shader_CRT(v0sw, v0sh, 
						false, 0,
						false, 0, 0, 
						false, 0, 
						true, true, 1)
			//shader_set(shd_CRT_shader);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_crt_sizes"),                apsw, apsh, apsw, apsh);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_radial_distortion_amount"), 0);  
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_use_radial_distortion"),    False);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_use_border"),               False);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_use_RGB_separation"),       False);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_use_scanlines"),            True);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_border_corner_size"),       0);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_border_corner_smoothness"), 0);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_brightness"),				 0);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_use_noise"),				 False);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_noise_strength"),			 0);
			//shader_set_uniform_f(shader_get_uniform(shd_CRT_shader, "uni_timer"),					 get_timer());
		} 
		//柔化
		else if global.pix_filter==3 {
			
		}
		draw_surface_ext(view0_surface_temp, 0, 0, xsc, ysc, 0, c_white, 1)
		if shader_current()!=-1 shader_reset()
		//滤镜划线
		//var pixFilter = global.pix_filter,
		//	pixAlpha = 0.2
		//if pixFilter{
		//	draw_set_color_alpha(c_black, pixAlpha)
		//	for(var i=0;i<apsw;i+=xsc) {
		//		draw_line(i, 0, i, apsh)
		//		//scr_draw_line(c_black, pixAlpha, 1, false, i, 0, i, apsh)
		//	}
		//	for(var i=0;i<apsh;i+=ysc) {
		//		//scr_draw_line(c_black, pixAlpha, 1, false, 0, i, apsw, i)
		//		draw_line(0, i, apsw, i)
		//	}
		//	draw_set_color_alpha_init()
		//}
	}
}
//绘制UI时开启模糊
gpu_set_texfilter(true)