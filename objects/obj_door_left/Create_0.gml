event_inherited();
SS_open=asset_get_index(SS+"_open")
SS_opening=asset_get_index(SS+"_opening")
SS_close=asset_get_index(SS+"_close")
SS_closing=asset_get_index(SS+"_closing")
SE_open=se_door_open
SE_close=se_door_close
room_change=place_meeting(x, y, obj_room_change)
open_xscale=1
action=0
time=0

closeDoor=function() {
	scr_sprite_change(SS_close, 0, 0.25)
	scr_sound_play(SE_close)
}
//旧版过门（落地）
crossDoorOld=function() {
	//触发开门
	if action==0 {
		if can_open {
			if collision_rectangle(bbox_left-1, bbox_bottom, bbox_right+1, bbox_top, obj_player, 1, 1)
			&& obj_player.bbox_top>=bbox_top
			&& obj_player.bbox_bottom<=bbox_bottom 
			&& obj_player.jump==0 
			&& sprite_index==SS_closing {
				scr_sprite_change(SS_open, 0, 0.25)
				scr_sound_play(SE_open)
				global.player_operate=0
				open_xscale=sign(x-obj_player.x)
				with obj_player {
					uninjure_temp=1
					image_xscale=other.open_xscale
				}
				action=1
			}
		}
	} 
	//开门走入
	else if action==1 {
		if sprite_index==SS_opening {
			if obj_player.walk==0 {
				global.operate=0
				with obj_player {
					scr_sprite_change(SS_walk, 0, 0.25)
					hspeed=walkspd*hspd*image_xscale
				}
				action=2
			}
		}
	}
	else if action==2 {
		if(obj_player.x-x)*open_xscale>0 
		&& !room_change{
			action=3
		}
	}
	//镜头移动
	else if action==3 {
		scr_view_freedom(obj_player, true, true)
		//到达位置
		if(obj_player.x-x)*open_xscale>=64 {
			with obj_player {
				scr_sprite_change(SS_idle, 0, 0.25)
				hspeed=0
			}
			global.operate=1
			scr_sprite_change(SS_close, 0, 0.25)
			scr_sound_play(SE_close)
			action=4
		}
	}
	else if action==4 {
		if sprite_index==SS_closing {
			with obj_player {
				uninjure_temp=0
			}
			global.operate=0.8
			global.player_operate=1
			action=0
		}
	}
}