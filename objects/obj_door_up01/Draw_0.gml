if view_current!=0 exit
event_inherited();
var frameinx=0;
if sprite_index==SS_closing frameinx=0;
else if sprite_index==SS_opening frameinx=2;
else frameinx=1;
draw_sprite(SS_frame, frameinx, x, y);