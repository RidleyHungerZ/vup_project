if view_current!=0 exit
draw_sprite_ext(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
//无敌闪
if(flash==1) {
	if flash==1 flash=0;
	scr_draw_sprite_white(sprite_index,image_index,round(x),round(y),image_xscale,image_yscale,image_angle,c_white,1);
}