event_inherited();
if(!scr_menu_trem()) exit;
if injure_element!=ELEMENTS.none
	injure_element=ELEMENTS.none
if hp<=0 
&& injure_type>=0 
&& flash==0 {
	scr_sprite_change(spr_none,0,0);
	scr_ice_boompart_ext(spr_ice_part, 4, x, y)
	injure_type=-1;
	speed=0;
	gravity=0;
	x=xstart;
	y=ystart;
}