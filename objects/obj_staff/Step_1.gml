x=obj_player.x
y=obj_player.y
gpu_set_texfilter(false)
////////////////////////////////////////
///////////////按键控制//////////////////
////////////////////////////////////////
scr_staff_key_state()
#region 自带计帧
if scr_menu_trem(){
	global.fps_currmenu++
	global.fps_roommenu++
}
global.fps_curr++
global.fps_60+=1
global.fps_30+=1
global.fps_20+=1
global.fps_15+=1
global.fps_12+=1
global.fps_10+=1
global.fps_6+=1
global.fps_5+=1
global.fps_4+=1
global.fps_3+=1
global.fps_2+=1
global.fps_1+=1
////////////////////////////////////////
if global.fps_60>=1 global.fps_60=0
if global.fps_30>=2 global.fps_30=0
if global.fps_20>=3 global.fps_20=0
if global.fps_15>=4 global.fps_15=0
if global.fps_12>=5 global.fps_12=0
if global.fps_10>=6 global.fps_10=0
if global.fps_6>=10 global.fps_6=0
if global.fps_5>=12 global.fps_5=0
if global.fps_4>=15 global.fps_4=0
if global.fps_3>=20 global.fps_3=0
if global.fps_2>=30 global.fps_2=0
if global.fps_1>=60{
	global.fps_1=0
	global.second++
}
if global.second>=60{
	global.second=0
	global.minute++
}
if global.minute>=60{
	global.minute=0
	global.hour++
}
global.hour=global.hour mod 100
#endregion
#region 根据道具数核对hpmp上限
//var oldmap=global.player_mp_up
//global.player_hp_up=16+4*scr_item_hpup_count()
//global.player_mp_up=16+4*scr_item_mpup_count()
#endregion
#region 玩家数值控制
if global.player_hp>global.player_hp_up
	global.player_hp=global.player_hp_up
else if global.player_hp<0
	global.player_hp=0
	
if global.player_hp_aft<global.player_hp
	global.player_hp_aft=global.player_hp
else if global.player_hp_aft>global.player_hp {
	global.player_hp_aft-=1/5
}

if global.player_mp>global.player_mp_up
	global.player_mp=global.player_mp_up
else if global.player_mp<0
	global.player_mp=0
	
if global.player_life<0 
	global.player_life=0
else if global.player_life>9 
	global.player_life=9
#endregion
#region 游戏暂停
switch(global.stop){
	case 0.5:{
		global.stop=1
		break
	}
	case -0.5:{
		global.stop=0
		break
	}
}
#endregion

#region 玩家换卡
if player_change_action==0 {
	if scr_player_change_trim() {
		if keystate_check_pressed(global.trans_state) {
			player_change_action=1
			player_change_last=global.model
			player_change_select=global.model
			player_change_cancle=false
			player_change_over=false
			global.stop=0.5
		}
	}
} else {
	if player_change_time>0 player_change_time--
	else player_change_time=0
	//进入换卡动作
	if player_change_action==1 {
		with obj_player {
			scr_player_charge_clear()
			clearBullets()
			afterdash=99
			if jump==0 scr_sprite_change(SS_change_idle_start, 0, 0.25)
			else scr_sprite_change(SS_change_fall_start, 0, 0.25)
			walk=0
			dash=0
			vsp=0
		}
		scr_sound_play(se_player_change_open)
		player_change_action=2
		player_change_time=15
	} 
	//卡片出现
	else if player_change_action==2 {
		if player_change_time==0
			player_change_action=3
	} 
	//选择卡片
	else if player_change_action==3 {
		if player_change_time==0 {
			var action_type=0
			player_change_select_dir=0
			if keystate_check_pressed(global.Left_state) {
				player_change_select_dir=-1
				player_change_time=15
				player_change_select--
				if player_change_select<0 
					player_change_select=global.model_number-1
				scr_sound_play(se_player_change_select)
			} else if keystate_check_pressed(global.Right_state) {
				player_change_select_dir=1
				player_change_time=15
				player_change_select++
				if player_change_select>=global.model_number 
					player_change_select=0
				scr_sound_play(se_player_change_select)
			} 
			//取消
			else if keystate_check_pressed(global.B_state) {
				action_type=-1
				player_change_cancle=true
				scr_sound_play(se_player_change_cancle)
			} 
			//选定
			else if keystate_check_pressed(global.trans_state) 
			|| keystate_check_pressed(global.A_state) {
				if player_change_select==player_change_last {
					action_type=-1
					scr_sound_play(se_player_change_true)
				} else {
					if global.model_get[player_change_select] {
						if global.player.model==0 {
							action_type=2
						} else if player_change_select==0 {
							action_type=3
						} else action_type=1
						scr_sound_play(se_player_change_true)
					}
					else scr_sound_play(se_player_change_error)
				}
			}
			//取消或保持原样
			if action_type==-1 {
				with obj_player {
					if jump==0 scr_sprite_change(SS_change_idle_cancle, 0, 0.25)
					else scr_sprite_change(SS_change_fall_cancle, 0, 0.25)
				}
				player_change_action=6
				player_change_time=15
			}
			//切换，比变为装甲多走一步拔卡4
			else if action_type==1 {
				with obj_player {
					if jump==0 scr_sprite_change(SS_change_idle_selected, 0, 0.25)
					else scr_sprite_change(SS_change_fall_selected, 0, 0.25)
				}
				player_change_action=4
				player_change_time=15
			}
			//变为装甲直接5
			else if action_type==2 {
				with obj_player {
					if jump==0 scr_sprite_change(SS_change_idle_selected, 0, 0.25)
					else scr_sprite_change(SS_change_fall_selected, 0, 0.25)
				}
				//global.model=player_change_select
				player_change_action=4
				player_change_time=15
			}
			//变回人形
			else if action_type==3 {
				with obj_player {
					if jump==0 scr_sprite_change(spr_player_armor_change_idle_pull_st, 0, 0.25)
					else scr_sprite_change(spr_player_armor_change_fall_pull_st, 0, 0.25)
				}
				player_change_action=5.5
				player_change_time=15
			}
		}
	} 
	
	//////变为形态//////
	//换卡时先出卡
	else if player_change_action==4 {
		if(player_change_time==0) {
			with obj_player {
				if jump==0 scr_sprite_change(SS_change_idle_ed, 0, 0.25)
				else scr_sprite_change(SS_change_fall_ed, 0, 0.25)
			}
			global.model=player_change_select
			player_change_action=5
			player_change_time=15
		}
	}
	//插卡
	else if player_change_action==5 {
		//with obj_player {
		//	if in(sprite_index, [SS_change_idle_ed, SS_change_fall_ed]) && image_index>=4 {
		//		//global.player_change_flash=1
		//		scr_sound_play(se_player_change_flash)
		//		//other.player_change_action=8
		//	} 
		//}
		if(player_change_time==0) {
			global.player_change_flash=1
			scr_sound_play(se_player_change_flash)
			player_change_action=6
			player_change_time=15
		}
	} 
	//变回人形先出卡
	else if player_change_action==5.5 {
		if(player_change_time==0) {
			global.model=player_change_select
			with obj_player {
				if jump==0 scr_sprite_change(spr_player_armor_change_idle_pull, 0, 0.25)
				else scr_sprite_change(spr_player_armor_change_fall_pull, 0, 0.25)
			}
			player_change_action=6
			player_change_time=15
		}
	}
	//收卡
	else if player_change_action==6 {
		if(player_change_time==0) {
			with obj_player {
				if in(sprite_index, [spr_player_armor_change_idle_pull, spr_player_armor_change_fall_pull]) {
					//scr_sprite_change(-2, -2, 0.25)
					global.player_change_flash=1
					scr_sound_play(se_player_change_flash)
				}
			}
			player_change_action=7
		}
	} 
	//收卡完成后便可以解除暂停
	else if player_change_action>=7 {
		if player_change_over {
			global.stop=-0.5
			player_change_action=0
		}
	}
	//////////////////
	
	//缓动，统一为15帧
	player_change_outsert_rate = player_change_time/15
}
#endregion