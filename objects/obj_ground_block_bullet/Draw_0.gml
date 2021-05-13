if view_current!=0 exit
drawSelf()
//无敌闪
if(flash==1) {
	flash=0;
	var shader_curr=shader_current();
	shader_reset();
	scr_draw_sprite_white(sprite_index,floor(image_index),round(x),round(y),image_xscale,image_yscale,image_angle,c_white,1);
	shader_set(shader_curr);
}