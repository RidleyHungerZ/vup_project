///@desc 剧情演绎管理
event_inherited();
action=0
time=0
bosswar_bgm=noone
restart_bgm=noone
direct=0

for(var i=0;i<4;i++) {
	layerInstFront[i]="front_inst"+string_real_supply0(i, 2)
	layerTileFront[i]="front_tile"+string_real_supply0(i, 2)
	layerBgsFront[i]="front_bgs"+string_real_supply0(i, 2)
	layerInst[i]="inst"+string_real_supply0(i, 2)
	layerTile[i]="tile"+string_real_supply0(i, 2)
	layerBgs[i]="bgs"+string_real_supply0(i, 2)
	layerInstBack[i]="back_inst"+string_real_supply0(i, 2)
	layerTileBack[i]="back_tile"+string_real_supply0(i, 2)
	layerBgsBack[i]="back_bgs"+string_real_supply0(i, 2)
}

#region 文本
//设置剧情演绎
global.txt_thread_set=array_create(100, {})
//具体演绎文本
global.txt_thread=array_create(100, [])
//演绎变量
talk_action=0
talk_txt_thread=-1
talk_txt_index=0
#endregion

/// @desc 门关闭后可移动
function scr_room_doorclose_canoper() {
	if(global.operate==0.9 && global.player_hp>0) return true;
	else return false;
}
/// @desc 清空玩家操作按键情况
function scr_room_player_keystatus_clear() {
	global.left_state=0
	global.right_state=0
	global.up_state=0
	global.down_state=0
	global.jump_state=0
	global.att_state=0
	global.dash_state=0
	global.sub_state=0
	global.true_state=0
	global.trans_state=0
	global.select_state=0
	global.start_state=0
}
/// @desc 玩家是否需要变为下落
function scr_room_player_needfall() {
	//特殊漂浮情况的中断
	with obj_player{
		if jump=PYJUMP.glide
		|| jump=PYJUMP.kick {
			scr_sprite_change(SS_jumped,0,0.25)
			jump=PYJUMP.fall
			vsp=0
			hsp=0
		}
	}
	scr_room_player_keystatus_clear()
}
/// @desc 判断玩家脚下是否有能站立的地面
function scr_room_player_ground_under() {
	var placey=1;
	while(obj_player.bbox_bottom+placey<global.room_yb) {
		var oground=collision_rectangle(obj_player.bbox_left, obj_player.bbox_bottom, obj_player.bbox_right, obj_player.bbox_bottom+placey, obj_soild, 1, 1);
		if oground && !oground.inst_of(obj_prick)
			return true;
		placey+=16;
	}
	return false;
}
/// 剧情开始前落地和变身的过程
/// @arg idle=0;walk=1;dusn=2
/// @arg bgm[""不变;"s"停止;bgm_a0变化]
function scr_room_fall_after(status, bgm) {
	var chg = 0
	//主角落地
	if action==0.5 && time==0{
		scr_room_player_needfall()
		if obj_player.jump==0 
		&& obj_player.walk==0{
			action=0.6
			time=30
		}
	}
	//判断状态
	else if action==0.6 && time==0{
		//bgm
		if is_string(bgm) {
			if string_pos("s",bgm)>0
				audio_bgm_stop()
		} else if audio_exists(bgm)
			audio_bgm_change(bgm)
		action=0.7
	}
	//变身完成
	else if action==0.7{
		if obj_player.sprite_index==obj_player.SS_idle
		|| obj_player.sprite_index==obj_player.SS_idle2{
			action=1
			time=30
		}
	}
	//开始下一步
	else if action==1 && time==0{
		//idle
		if status=0{}
		//walk
		else if status==1
			codekey_Hdirect(direct)
		//dash
		else if status==2
			codekey_dash(1)
		action=2
	}
	//结束
	else if action==2 && time==0 {
		return true
	}
	return false
}
/// @desc 玩家立刻停止
/// @arg xpos
function scr_room_player_xstop(xpos) {
	obj_player.hspeed=0
	obj_player.hsp=0
	obj_player.x=xpos
	obj_player.v_ice=0
}
