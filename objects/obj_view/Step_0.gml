if global.full_screen==1 {
	window_set_fullscreen(true)
	global.resolution=1
} else {
	window_set_fullscreen(false)
	window_set_size(ui.winsize[global.resolution].w, ui.winsize[global.resolution].h)
	window_set_caption(CAPTION);
	if window_size_change==0 {
		if last_resolution!=global.full_screen {
			window_size_change=1
			last_resolution=global.full_screen
		}
		if last_full_screen!=global.resolution {
			window_size_change=1
			last_full_screen=global.resolution
		}
	} else if window_size_change==1 {
		window_center()
		window_size_change=0
	}
}