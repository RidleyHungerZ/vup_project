///@desc 将镜头0内容保留下来
if view_current==0 {
	with obj_view {
		view0_surface_temp=surface_set_target_fix(view0_surface_temp, view.width, view.height)
		shader_set(shd_surface_alpha1)
		draw_surface(application_surface, 0, 0)
		shader_reset()
		surface_reset_target()
	}
}
