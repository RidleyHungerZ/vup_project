event_inherited();
if !scr_menu_trem() exit
rad+=radxscsp
image_xscale=rad+wave*sin(global.fps_currmenu*pi/(T/2))
image_xscale=max(0, image_xscale)
image_yscale=image_xscale