/// @desc 返回标题界面
function scr_return_title(){
	audio_se_stop_all()
	scr_sound_stopall_dpl()
	scr_view_shock_stop()
	scr_room_goto(room_logo)
	//scr_data_save_global(noone,noone)
	//scr_data_set_note()
	data_save_variable_single()
	//scr_timecalcul_dis_close()
	global.operate=0
	global.player_operate=0
	global.game_start=0
	global.boss_war=0
	global.view_xcen_shift=0//镜头中心偏移
	global.view_ycen_shift=0//镜头中心偏移
	global.view_control=0
	with obj_player_saber {
		scr_sprite_change(spr_none, 0, 0)
	}
	with obj_player {
		scr_sprite_change(spr_none, 0, 0)
	}
	//道具记录清空
	with obj_room{
		//道具记录清空
		item_not_set = 1
		//进度清空
		action=0
		time=0
		//BOSS战函数清理
		bosswar_fail=noone
		bosswar_fail_room=noone
	}
	with obj_menu {
		menu_type=0
		for(var page=0;page<array_length(menu_select);page+=1) {
			for(var type=0;type<array_length(menu_select[page]);type+=1) {
				menu_select[page][type]=0
				menu_curr[type]=0
			}
		}
	}
}