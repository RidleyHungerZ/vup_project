event_inherited();
if view_current!=1 exit
if bgs_alpha>0 {
	scr_draw_rectangle(bgs_color, bgs_alpha, bgs_bbox[0], bgs_bbox[1], bgs_bbox[2], bgs_bbox[3], false)
}
scr_draw_text_ext(image_blend, image_alpha, image_angle, 
				font, left, top, txt, 
				x, y, image_xscale, image_yscale, 
				-1, -1, stroke, strokew)