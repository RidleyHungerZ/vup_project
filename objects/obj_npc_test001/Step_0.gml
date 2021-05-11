event_inherited();
if !scr_menu_trem() exit
if talk_ing() {
	if scr_talk_print_over() 
	&& scr_talk_next() {
		if txt_inx<array_length(txts1)+array_length(txts2)-1 {
			txt_inx++
			var now, 
				txt,
				inx=txt_inx div 2
			if txt_inx mod 2 == 0 {
				now=TALK_INX.down
				txt=txts1[inx]
			} else {
				now=TALK_INX.up
				txt=txts2[inx]
			}
			scr_talk(now, txt, shoto_type, 0, 0, image_xscale, [])
		} else {
			talk_end()
		}
	}
}