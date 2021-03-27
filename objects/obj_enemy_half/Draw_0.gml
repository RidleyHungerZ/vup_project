if(view_current!=0) exit;

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,dis_dir,image_blend,image_alpha);
if(flash==1) {
	flash=0;
	scr_draw_sprite_white(sprite_index,image_index,x,y,image_xscale,image_yscale,dis_dir,image_blend,image_alpha);
}