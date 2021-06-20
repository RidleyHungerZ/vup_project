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
ds_list_clear(global.modellist)
for(var i=0;i<array_length(global.model_number);i++) {
	if scr_model_isget(i)
		ds_list_add(global.modellist, i)
}
ds_list_clear(global.rtanklist)
for(var i=0;i<array_length(global.rtank_gain);i++) {
	if global.rtank_gain[i]==1
		ds_list_add(global.rtanklist, i)
}
#endregion
#region 玩家数值控制
//血量控制
if global.player_hp>global.player_hp_up
	global.player_hp=global.player_hp_up
else if global.player_hp<0
	global.player_hp=0
//血量红条
if scr_menu_trem() {
	if global.player_hp_aft<global.player_hp
		global.player_hp_aft=global.player_hp
	else if global.player_hp_aft>global.player_hp {
		global.player_hp_aft-=1/5
	}
}
//mp控制
if global.player_mp>global.player_mp_up
	global.player_mp=global.player_mp_up
else if global.player_mp<0
	global.player_mp=0
//羁绊值控制
if global.player_support>100
	global.player_support=100
else if global.player_support<0
	global.player_support=0
//if global.player_life<0 
//	global.player_life=0
//else if global.player_life>9 
//	global.player_life=9
if global.operate==1
&& global.player_operate==1 
&& scr_menu_trem() {
	//buff
	if global.player_buff_time>0 {
		global.player_buff_time--
	} else {
		scr_player_buff(PLAYER_BUFF.none, 0)
	}
	//debuff
	if global.player_debuff_time>0 {
		global.player_debuff_time--
	} else {
		scr_player_debuff(PLAYER_DEBUFF.none, 0)
	}
	//连击羁绊加成
	if global.combo_time>0 global.combo_time--
	else {
		global.combo_time=0
		global.combo=0
		global.support_mult=1
	}
	global.combo=min(100, global.combo)
	if global.combo>0 {
		//每击中3下，羁绊获得倍率就会提升1倍，最大不超过5倍
		//每造成5点伤害，羁绊获取倍率就会提升50%
		//global.support_mult=1+1*(global.combo div 3)
		global.support_mult=1+0.5*(global.combo div 5)
		global.support_mult=min(5, global.support_mult)
	}
	//自动回复
	if global.player_mp<global.player_mp_up 
	&& !scr_player_debuff_is(PLAYER_DEBUFF.losses) {
		if auto_sp_time<90 auto_sp_time++
		else {
			global.player_mp++
			auto_sp_time=0
		}
	} else auto_sp_time=0
	//流失
	if global.player_mp>0
	&& scr_player_debuff_is(PLAYER_DEBUFF.losses) {
		if loss_sp_time<30 loss_sp_time++
		else {
			global.player_mp--
			loss_sp_time=0
		}
	} else loss_sp_time=0
}
#endregion
#region BOSS数值控制
//血量控制
if global.boss_hp<0
	global.boss_hp=0
//血量红条
if scr_menu_trem() {
	if global.boss_hp_aft<global.boss_hp
		global.boss_hp_aft=global.boss_hp
	else if global.boss_hp_aft>global.boss_hp {
		global.boss_hp_aft-=1/5
}
}
#endregion

#region 玩家换卡
if player_change_action==0 {
	if scr_menu_trem() 
	&& scr_player_change_trim() {
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
			//选定或者自动变身
			if keystate_check_pressed(global.trans_state) 
			|| keystate_check_pressed(global.A_state) 
			|| player_change_atonce {
				if player_change_select==player_change_last
				&& !player_change_atonce {
					action_type=-1
					scr_sound_play(se_player_change_true)
				} else {
					if scr_model_isget(player_change_select) {
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
			//取消
			else if keystate_check_pressed(global.B_state) {
				action_type=-1
				player_change_cancle=true
				scr_sound_play(se_player_change_cancle)
			} else if keystate_check_pressed(global.Left_state) {
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
			if !player_change_atonce
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
			if !player_change_atonce
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
			player_change_atonce=false
		}
	}
	//////////////////
	
	//缓动，统一为15帧
	player_change_outsert_rate = player_change_time/15
}
#endregion
#region 快速换卡，仅限装甲之间
if scr_menu_trem() 
&& global.operate==1
&& global.player_operate==1 
&& global.player_hp>0
&& global.player_saber.sprite_index==spr_none 
&& global.model_get_number>=3 
&& !instance_exists(obj_player_change_circle) {
	var changedir = 0, 
		card = global.model
	if keystate_check_pressed(global.tformL_state) {
		changedir=-1
	} else if keystate_check_pressed(global.tformR_state) {
		changedir=1
	}
	//在变为已获得并且不是人形的装甲前会一直切换
	if changedir!=0 {
		do {
			card+=changedir
			if card<=0 card=global.model_number-1
			if card>=global.model_number card=1
		} until(scr_model_isget(card) && card!=0)
		global.model=card
		instance_create_depth(obj_player.x, obj_player.y, obj_player.depth-50, obj_player_change_circle)
	}
}
#endregion