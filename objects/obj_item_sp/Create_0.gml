event_inherited();
spr_loopinx=2
itemval=16
//吃到后执行
execute=function() {
	if action==-1 {
		if global.player_mp<global.player_mp_up
		|| global.player_es<global.player_es_max{
			action=-2
		} else {
			action=-10
		}
	} else if action=-2 && time==0 {
		if itemval>0 
		&&(global.player_mp<global.player_mp_up
		|| global.player_es<global.player_es_max){
			itemval--
			if global.player_mp<global.player_mp_up
				global.player_mp++
			if global.player_es<global.player_es_max
				global.player_es++
			scr_sound_play(se_item_mp)
			time=2
		} else {
			action=-3
		}
	} else if action==-3 {
		instance_destroy()
	}
}