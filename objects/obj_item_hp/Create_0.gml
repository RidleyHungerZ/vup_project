event_inherited();
spr_loopinx=2
itemval=16
needtank=-1
//吃到后执行（补血）
executeNoStop=function() {
	if action==-1 {
		if global.player_hp<global.player_hp_up
		&& global.stop==0 {
			global.stop=0.5
			action=-2
		} else {
			action=-10
		}
	} else if action=-2 {
		if time>0 time--
		else {
			if itemval>0 
			&& global.player_hp<global.player_hp_up {
				itemval--
				global.player_hp++
				scr_sound_play(se_item_hp)
				time=2
			} else {
				action=-3
			}
		}
	} else if action==-3 {
		global.stop=-0.5
		instance_destroy()
	}
}
//吃到后执行（E罐）
execute=function() {
	if action==-10 {
		//确认需要补充的tank
		for(var i=0;i<ds_list_size(global.rtanklist);i++) {
			var inx=global.rtanklist[| i]
			if global.rtank_val[inx]<global.rtank_val_max {
				needtank=inx
				break
			}
		}
		if needtank>=0 {
			action=-11
		} else {
			action=-13
		}
	} else if action==-11 && time==0 {
		if itemval>0 
		&& global.rtank_val[needtank]<global.rtank_val_max {
			itemval--
			global.rtank_val[needtank]++
			scr_sound_play(se_item_rtank)
			time=2
		} else {
			action=-13
		}
	} else if action==-13 {
		instance_destroy()
	}
}