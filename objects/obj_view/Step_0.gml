if global.full_screen==1 {
	window_set_fullscreen(true)
	global.resolution=1
} else {
	window_set_fullscreen(false)
	window_set_size(ui.winsize[global.resolution].w, ui.winsize[global.resolution].h)
	window_set_caption(CAPTION);
}