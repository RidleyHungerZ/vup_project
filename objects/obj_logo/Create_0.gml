event_inherited()
select=[0] //当前选项
select_type=0 //选择进度
action=0
time=0

operate_setting_display=false

testmode=function() {
	global.player_hp_up=32
	global.player_hp=global.player_hp_up
	global.player_mp_up=32
	global.player_mp=global.player_mp_up
	//global.player_es=62345
	global.model_get_number=3
	global.model_get[PLAYER_MODEL.ARMOR]=1
	global.model_get[2]=1
	global.model_get[5]=1
	global.model_get[7]=1
	global.model=PLAYER_MODEL.ARMOR
	global.rtank[1]=1
	global.rtank[2]=1
	global.item2_byte_max=30
	
	scr_item_gain(ITEM.A, ITEMA.milk)
	scr_item_gain(ITEM.A, ITEMA.candy)
	scr_item_gain(ITEM.A, ITEMA.energy)
	scr_item_gain(ITEM.A, ITEMA.hpup)
	scr_item_gain(ITEM.A, ITEMA.mpup)
	scr_item_gain(ITEM.A, ITEMA.rtank)
	scr_item_gain(ITEM.A, ITEMA.byte)

	scr_item_gain(ITEM.B, ITEMB.dbjump)
	scr_item_gain(ITEM.B, ITEMB.airdash)
	scr_item_gain(ITEM.B, ITEMB.glide)
	//scr_item_gain(ITEM.B, ITEMB.kick)
	scr_item_gain(ITEM.B, ITEMB.defineBack)
	scr_item_gain(ITEM.B, ITEMB.invinEx)
	scr_item_gain(ITEM.B, ITEMB.prickGuard)
	scr_item_gain(ITEM.B, ITEMB.invinDash)
	scr_item_gain(ITEM.B, ITEMB.chargeQuick)
	scr_item_gain(ITEM.B, ITEMB.autoRecover)
	scr_item_gain(ITEM.B, ITEMB.supportGain)
	scr_item_gain(ITEM.B, ITEMB.nonslip)
	scr_item_gain(ITEM.B, ITEMB.fastRun)
	scr_item_gain(ITEM.B, ITEMB.overload)

	scr_item_gain(ITEM.C, ITEMC.esGun)
	scr_item_gain(ITEM.C, ITEMC.esSaber)
	scr_item_gain(ITEM.C, ITEMC.starGuard)

	scr_player_exskill_gain(PLAYER_SKILL.flyChop)

	scr_mission_add(MISSION_TYPE.main, 0)
	scr_mission_add(MISSION_TYPE.sub, 0)
	scr_mission_add(MISSION_TYPE.sub, 1)
	
	scr_room_goto(room_area0_test)
	with obj_player {
		x=64
		y=512-GRDY
		scr_relife_set_point(x, y+GRDY, 1)
		scr_sprite_change(SS_idle, 0, 0.25)
	}
	
	//scr_room_goto(room_test)
	//with obj_player {
	//	x=464
	//	y=512-GRDY
	//	scr_relife_set_point(x, y+GRDY, 1)
	//	scr_sprite_change(SS_idle, 0, 0.25)
	//}
	
	audio_bgm_change(bgm_area0)
	global.operate=0.5
	global.player_operate=1
}