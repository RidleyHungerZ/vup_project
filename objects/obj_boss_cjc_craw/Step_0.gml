if action_type==-1 {
	if enemy.sprite_index==spr_boss_cjc_forearm_frt {
		scr_sprite_change(spr_boss_cjc_crawcen_idle_frt, 0, 0)
		action_type=0
	}
	else if enemy.sprite_index==spr_boss_cjc_forearm_back {
		scr_sprite_change(spr_boss_cjc_crawcen_idle_back, 0, 0)
		action_type=1
	}
}
//damage_agent=enemy
event_inherited();
if !scr_menu_trem() exit
#region 抓人
if action_type==0 {
	//准备抓人
	if action==1 {
		scr_sprite_change(spr_boss_cjc_crawcen_turn_frt, 0, 0.25)
		scr_sound_play(se_boss_cjc_craw_turn)
		action=2
	}
	//伸出
	if action==10 {
		have_dmg=false
		scr_sound_play(se_boss_cjc_craw_extend)
		action=11
	} else if action==11 {
		if place_meeting(x, y, obj_player) {
			scr_sprite_change(spr_boss_cjc_crawcen_catch_get_frt, 0, 0)
			scr_sound_play(se_boss_cjc_craw_catch)
			with obj_player {
				walk=0
				jump=PYJUMP.catched
			}
			catch_player=true
			action=30
		} else if abs(x-(boss._xl+boss._xr)/2)>=VIEW_W/2-48 {
			scr_sprite_change(-2, 1, 0)
			scr_sound_play(se_boss_cjc_craw_catch)
			action=20
			have_dmg=true
		} else {
			enemy.exrod_len+=6
		}
	}
	//没抓到
	else if action==20 {
		action=21
		time=30
	} else if action==21 && time==0 {
		scr_sound_play(se_boss_cjc_craw_extend)
		action=22
	} else if action==22 {
		enemy.exrod_len-=4
		if enemy.exrod_len<=0 {
			enemy.exrod_len=0
			scr_sound_play(se_boss_cjc_craw_catch)
			action=23
			time=30
		}
	} else if action==23 && time==0 {
		boss.craw_catch_empty()
		action=0
	}
	//抓到
	else if action==30 {
		action=31
		time=30
	} else if action==31 && time==0 {
		scr_sound_play(se_boss_cjc_craw_extend)
		action=32
	} else if action==32 {
		enemy.exrod_len-=6
		if enemy.exrod_len<=0 {
			enemy.exrod_len=0
			scr_sound_play(se_boss_cjc_craw_catch)
			action=33
		}
	} else if action==33 {
		boss.craw_catch_player()
		action=34
	}
	//释放
	if action==40 {
		scr_sprite_change(spr_boss_cjc_crawcen_catch_release_frt, 0, 0)
		scr_sound_play(se_boss_cjc_craw_catch)
		with obj_player {
			jump=PYJUMP.tripFall
		}
		catch_player=false
		action=41
	}
	//转回
	if action==50 {
		scr_sprite_change(spr_boss_cjc_crawcen_turned_frt, 0, 0.25)
		scr_sound_play(se_boss_cjc_craw_turn)
		action=51
	} else if action==51 {
		action=0
	}
}
#endregion
#region 抓箱子
if action_type==1 {
	//让箱子保持位置
	if action==1 {
		if !blockExists() {
			boss.craw_block_boom()
			action=2
		}
	}
	//丢下箱子
	if action==10 {
		if blockExists() {
			with catch_block {
				var block
				if object_index==obj_boss_cjc_block_bomb01
					block=obj_ground_block_bomb01
				else if object_index==obj_boss_cjc_block_bomb02
					block=obj_ground_block_bomb02
				//玩家和箱子重叠，则不创建了直接爆炸
				if collision_rectangle(bbox_right, bbox_bottom, bbox_left, bbox_top-GRDY, obj_player, 1, 1) {
					hp=0
				} else {
					with instance_create_depth(x, y, depth, block) {
						hp=other.hp
						attack=other.attack
						action=1
					}
				}
			}
			instance_destroy(catch_block)
			catch_block=noone
		}
		if sprite_index==spr_boss_cjc_crawcen_catch_get_back
			scr_sprite_change(spr_boss_cjc_crawcen_catch_back, 0, 0)
		if sprite_index==spr_boss_cjc_crawcen_catch_get2_back
			scr_sprite_change(spr_boss_cjc_crawcen_catch_back, 1, 0)
		action=11
	}
	//恢复
	if action==20 {
		if image_index==0 {
			action=21
		} else {
			scr_sprite_change(spr_boss_cjc_crawcen_catch_back, 0, 0)
			action=21
			time=5
		}
	} else if action==21 && time==0 {
		scr_sprite_change(spr_boss_cjc_crawcen_idle_back, 0, 0)
		scr_sound_play(se_boss_cjc_craw_catch)
		action=0
	}
}
#endregion