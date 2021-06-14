if view_current!=0 exit
#region 残影
if(afimg_count_now>0) {
	//var alpha=((afterimageflash && global.fps_30!=0)||!afterimageflash) ? 1 : 0;
	var alpha=afteralpha;
	for(var i=afimg_count;i>0;i-=1){
		if((i mod afimg_step)==0) 
			draw_sprite_ext(sprite_index,image_index,afimg_x[i],afimg_y[i],image_xscale,image_yscale,image_angle,image_blend,image_alpha*alpha);
	}
}
#endregion
draw_self()