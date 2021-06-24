event_inherited()

select=[0] //当前选项
select_type=0 //选择进度
action=0
time=0
black_start=1

operate_setting_display=false

bgm_time=0
//bgm_T=110
bgm_t=10

startVars=function() {
	scr_model_get(PLAYER_MODEL.HU)
	scr_item_gain(ITEM.C, ITEMC.belt)
	scr_item_gain(ITEM.C, ITEMC.esGun)
}

testmode=function() {
	global.player_hp_up=32
	global.player_hp=global.player_hp_up
	global.player_mp_up=32
	global.player_mp=global.player_mp_up
	//global.player_es=62345
	global.model_get_number=3
	scr_model_get(PLAYER_MODEL.ARMOR)
	scr_model_get(PLAYER_MODEL.YANZX)
	scr_model_get(PLAYER_MODEL.ICE)
	scr_model_get(PLAYER_MODEL.TAILS)
	global.model=PLAYER_MODEL.ARMOR
	global.rtank_get[1]=1
	global.rtank_get[2]=1
	global.item2_byte_max=30
	global.player_support=100
	
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

	//scr_mission_add(MISSION_TYPE.main, 0)
	//scr_mission_add(MISSION_TYPE.sub, 0)
	//scr_mission_add(MISSION_TYPE.sub, 1)
	
	scr_boss_get(0)
	
	scr_room_goto(room_area0_test)
	with obj_player {
		x=64
		y=512-GRDY
		scr_relife_set_point(x, y+GRDY, 1)
		scr_sprite_change(SS_idle, 0, 0.25)
	}
	scr_thread_over(0)
	scr_thread_over(2)
	scr_thread_over(3)
	scr_thread_over(4)
	
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