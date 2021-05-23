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
		draw_surface_ext(view0_surface_temp, 0, 0, xsc, ysc, 0, c_white, 1)
		//surface_reset_target()
		//滤镜划线
		var pixFilter = global.pix_filter,
			pixAlpha = 0.2
		//pixFilter=true
		if pixFilter{
			draw_set_color_alpha(c_black, pixAlpha)
			for(var i=0;i<apsw;i+=xsc) {
				draw_line(i, 0, i, apsh)
				//scr_draw_line(c_black, pixAlpha, 1, false, i, 0, i, apsh)
			}
			for(var i=0;i<apsh;i+=ysc) {
				//scr_draw_line(c_black, pixAlpha, 1, false, 0, i, apsw, i)
				draw_line(0, i, apsw, i)
			}
			draw_set_color_alpha_init()
		}
	}
}
//绘制UI时开启模糊
gpu_set_texfilter(true)