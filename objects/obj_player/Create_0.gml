event_inherited()
global.player=id
#region 初始化配置，可重复
#region 区别配置项
	hspd=1;
	vspd=9;
	lspd=3; //爬梯子速度
	cspd=2.5;
	walkspd=3;
	dashspd=6;
	G_noliq=GRAV; //非水下重力
	G_liq=GRAV/2; //水下重力
	G=G_noliq;
	vspmaxrate=24; //下落最大速度是G的多少倍
	A_up=0;
	H=1;
	V=1;
	grav=G-A_up;
	dash_can=1; //可以冲刺
	craw_can=1; //可以爬墙
	swim_can=1; //可以下水
	ice_free=0; //不打滑
	water_free=0; //水下速度自由
	lightrad=96; //黑暗中光圈直径
	bbox_ground_yup=0; //检测墙壁时冲刺特殊情况用
	
	enemylist=ds_list_create()
	bulletlist=ds_list_create()
	//bosslist=ds_list_create()
	pricklist = ds_list_create()
	windlist = ds_list_create()
#endregion
#region 精灵
	var modelname
	if object_index==obj_player_hu modelname="hu"
	else if object_index==obj_player_armor modelname="armor"
	/*else if object_index==obj_player_xz modelname="x"
	else if object_index==obj_player_hz modelname="h"
	else if object_index==obj_player_lz modelname="l"
	else if object_index==obj_player_fz modelname="f"
	else if object_index==obj_player_pz modelname="p"
	else if object_index==obj_player_oz modelname="o"*/
	#region 基础动作
		SS_idle=asset_get_index(string_replace("spr_player_@_idle","@",modelname))
		SS_idle2=asset_get_index(string_replace("spr_player_@_idle2","@",modelname))
		SS_walk=asset_get_index(string_replace("spr_player_@_walk","@",modelname))
		SS_dash=asset_get_index(string_replace("spr_player_@_dash","@",modelname))
		SS_dashed=asset_get_index(string_replace("spr_player_@_dashed","@",modelname))
		SS_jump=asset_get_index(string_replace("spr_player_@_jump","@",modelname))
		SS_jumping=asset_get_index(string_replace("spr_player_@_jumping","@",modelname))
		SS_jumped=asset_get_index(string_replace("spr_player_@_jumped","@",modelname))
		SS_fall=asset_get_index(string_replace("spr_player_@_fall","@",modelname))
		SS_fallover=asset_get_index(string_replace("spr_player_@_fallover","@",modelname))
		SS_craw=asset_get_index(string_replace("spr_player_@_craw","@",modelname))
		SS_crawing=asset_get_index(string_replace("spr_player_@_crawing","@",modelname))
		SS_crawjump=asset_get_index(string_replace("spr_player_@_crawjump","@",modelname))
		//SS_ladupst=asset_get_index(string_replace("spr_player_@_ladupst","@",modelname))
		//SS_laddownst=asset_get_index(string_replace("spr_player_@_laddownst","@",modelname))
		//SS_lad=asset_get_index(string_replace("spr_player_@_lad","@",modelname))
		//SS_ladupover=asset_get_index(string_replace("spr_player_@_ladupover","@",modelname))
		//SS_laddownover=asset_get_index(string_replace("spr_player_@_laddownover","@",modelname))
		SS_injure_fall=asset_get_index(string_replace("spr_player_@_injure_fall","@",modelname))
		SS_injure1=asset_get_index(string_replace("spr_player_@_injure1","@",modelname))
		SS_injure2=asset_get_index(string_replace("spr_player_@_injure2","@",modelname))
		SS_death=asset_get_index(string_replace("spr_player_@_death","@",modelname))
		SS_talk=asset_get_index(string_replace("spr_player_@_talk","@",modelname))
		SS_talking=asset_get_index(string_replace("spr_player_@_talking","@",modelname))
		SS_talked=asset_get_index(string_replace("spr_player_@_talked","@",modelname))
		SS_doorup=asset_get_index(string_replace("spr_player_@_doorup","@",modelname))
		SS_squat=asset_get_index(string_replace("spr_player_@_squat","@",modelname))
		//SS_squating=asset_get_index(string_replace("spr_player_@_squating","@",modelname))
		//SS_squating2=asset_get_index(string_replace("spr_player_@_squating2","@",modelname))
		SS_squated=asset_get_index(string_replace("spr_player_@_squated","@",modelname))
		SS_trip=asset_get_index(string_replace("spr_player_@_trip","@",modelname))
		SS_climb=asset_get_index(string_replace("spr_player_@_climb","@",modelname))
		//SS_drop=asset_get_index(string_replace("spr_player_@_drop","@",modelname))
		//SS_droping=asset_get_index(string_replace("spr_player_@_droping","@",modelname))
		//SS_droped=asset_get_index(string_replace("spr_player_@_droped","@",modelname))
		SS_change_idle_start=asset_get_index(string_replace("spr_player_@_change_idle_start","@",modelname))
		SS_change_idle_ing=asset_get_index(string_replace("spr_player_@_change_idle_ing","@",modelname))
		SS_change_idle_selected=asset_get_index(string_replace("spr_player_@_change_idle_selected","@",modelname))
		SS_change_idle_ed=asset_get_index(string_replace("spr_player_@_change_idle_ed","@",modelname))
		SS_change_idle_cancle=asset_get_index(string_replace("spr_player_@_change_idle_cancle","@",modelname))
		SS_change_fall_start=asset_get_index(string_replace("spr_player_@_change_fall_start","@",modelname))
		SS_change_fall_ing=asset_get_index(string_replace("spr_player_@_change_fall_ing","@",modelname))
		SS_change_fall_selected=asset_get_index(string_replace("spr_player_@_change_fall_selected","@",modelname))
		SS_change_fall_ed=asset_get_index(string_replace("spr_player_@_change_fall_ed","@",modelname))
		SS_change_fall_cancle=asset_get_index(string_replace("spr_player_@_change_fall_cancle","@",modelname))
	#endregion
	#region 人类动作
		SS_creep=asset_get_index(string_replace("spr_player_@_creep","@",modelname))
		SS_creeping=asset_get_index(string_replace("spr_player_@_creeping","@",modelname))
		SS_creeped=asset_get_index(string_replace("spr_player_@_creeped","@",modelname))
		SS_float=asset_get_index(string_replace("spr_player_@_float","@",modelname))
		SS_swim=asset_get_index(string_replace("spr_player_@_swim","@",modelname))
		SS_swiming=asset_get_index(string_replace("spr_player_@_swiming","@",modelname))
		SS_injure3=asset_get_index(string_replace("spr_player_@_injure3","@",modelname))
		SS_lwalk=asset_get_index(string_replace("spr_player_@_lwalk","@",modelname))
	#endregion
	#region 枪击动作
		SS_idle_shoot=asset_get_index(string_replace("spr_player_@_idle_shoot","@",modelname))
		SS_idle_shoot2=asset_get_index(string_replace("spr_player_@_idle_shoot2","@",modelname))
		SS_walk_shoot=asset_get_index(string_replace("spr_player_@_walk_shoot","@",modelname))
		SS_walk_shoot1=asset_get_index(string_replace("spr_player_@_walk_shoot1","@",modelname))
		SS_walk_shoot2=asset_get_index(string_replace("spr_player_@_walk_shoot2","@",modelname))
		SS_dash_shoot=asset_get_index(string_replace("spr_player_@_dash_shoot","@",modelname))
		SS_jump_shoot=asset_get_index(string_replace("spr_player_@_jump_shoot","@",modelname))
		SS_fall_shoot=asset_get_index(string_replace("spr_player_@_fall_shoot","@",modelname))
		SS_craw_shoot=asset_get_index(string_replace("spr_player_@_craw_shoot","@",modelname))
		//SS_lad_shoot=asset_get_index(string_replace("spr_player_@_lad_shoot","@",modelname))
	#endregion
	#region 
	#endregion
	scr_sprite_change(SS_idle,0,0.25)
#endregion
#region 能否蓄力
	uncharge[1]=true
	uncharge[2]=true
	sub_unuse=obj_staff.player_sub_unuse[global.model]
	charge_dis=30//蓄力开始显示值
	charge_max=100//蓄力最大值，默认100，X150
#endregion
#region 身体替换颜色
	//base_cols=scr_color_mapping_get(0, 0)
	//需要替换的颜色，子对象具体设置
	//ex_cols=array_create(array_length(base_cols),$000000)
	//替换后的颜色
	//cols=noone
#endregion
#region 残影替换颜色
	//需要替换的颜色，子对象具体设置
	//after_ex_cols=array_copy_all(ex_cols)
	//替换出来的残影颜色，每种模式是不同的
	//after_cols=array_copy_all(ex_cols)
#endregion
#region 声音
	SE_dash=se_player_dash
	SE_jump=se_player_jump
	SE_crawjump=se_player_crawjump
	SE_injure1=se_player_injure1
	SE_injure2=se_player_injure2
	SE_death=se_player_death
	SE_transon=se_player_transon
#endregion
#region 快捷变身替换特殊精灵
	SS_EX_idle=[]
	SS_EX_walk=[]
	SS_EX_dash=[]
	SS_EX_jump=[]
	SS_EX_fall=[]
	SS_EX_craw=[]
	SS_EX_lad=[]
#endregion
//以下部分不可重复
if(variable_instance_exists(id, "initized")) exit;
initized=1;
#endregion
#region 基础属性
sprite_set_speed(sprite_index,0.25,spritespeed_framespergameframe);
walk=0;
jump=0;
hsp=0;
vsp=0;
dash=0;
dash_time_l=0; //左冲刺指令
dash_time_r=0; //右冲刺指令
dash_time_t=0; //上冲刺指令
dash_time_b=0; //下冲刺指令
dash_order_time_H=0;
dash_order_time_V=0;
dash_order_alarm=15;
dash_boost_inst=noone; //冲刺环
w_j=0;
jump_dash=0;
jump_craw=0;
l_dash=0;
l_dashup=30;
can_dbjump=false; //是否可以二段跳
floordown=false; //是否从半透板落下
meet_prick=noone; //碰到的尖刺
injure_level=0; //无敌等级
injure_t=0; //受伤计时
uninjure=0; //无敌状态
uninjure_temp=0; //暂时无敌
injure_ingrd=false; //受伤动作中落地
injure_element=ELEMENTS.none; //被特殊攻击效果，值为none，ice，push，absorb
element=ELEMENTS.none; //自身属性
injure_attack_type=ATK_TYPE.bullet;
ice_time=0; //被冰冻时间
ice_time_up=60*3;
wind_spd=0; //风速
wind_spd_i=0; //风速外控接口
//wind_up=0; //是否遇到上升气流
ice=0;
v_ice=0;
h_ice=0.1; //精度
f_ice=0.1; //摩擦力
x_last=x; 
y_last=y; 
imx_last=image_xscale; 
imy_last=image_yscale; 
dis_x=0; 
dis_y=0; 
water=0; //是否入水
flyobj=-1; //接触飞行物体
waterboost=0; //是否接触水面时发生水花
underwater=0;
trip_time=0; //摔倒时间计时
trip_time_up=90; //摔倒时间上限
craw_trip_time=0; //爬墙震倒计算时间
cliff_protect=false; //悬崖保护
cliff_protect_time=0; //悬崖保护时间
twining_time=0; //蛛网缠绕时间
menu_stop_use=true; //使用菜单暂停动画播放

death_action=0; //死亡动作
death_time=0;
death_cliff=false; //是否坠崖死亡

//上一帧的精灵
sprite_per=noone
sprite_part=noone
sprite_frtpart=noone

call_screen=false //对话屏幕

dyinghp=8 //受伤动作血量
unoperate_injure=false //非活动时是否可以受伤
operate_charge_release=false //非活动时可以释放蓄力
#endregion
#region 蓄力
//蓄力属性
charge[1]=0;
charge[2]=0;
charge_break[1]=0;
charge_break[2]=0;
charge_index[1]=0;
charge_index[2]=0;
#endregion
#region 残影
//残影位置
afterdash=8;
for(var i=8;i>=0;i-=1){
	px[i]=x;
	py[i]=y;
}
aftercolor=UIPINK
#endregion
#region 部分需要通用的变量
airdashed=0; //冲刺次数限制
#endregion
#region 事件
drawSelf = function() {
	var blend = image_blend
	//debuff变色
	if scr_player_debuff_is(PLAYER_DEBUFF.overheated) {
		image_blend=$7f7fff
	} else if scr_player_debuff_is(PLAYER_DEBUFF.losses) {
		image_blend=$7fffff
	} else if scr_player_debuff_is(PLAYER_DEBUFF.slow) {
		image_blend=$ffff7f
	}
	draw_sprite_ext(sprite_index, image_index, round(x), round(y), 
					image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	image_blend=blend
}
//清空子弹信息
clearBullets = function() {
	
}
//判断是否能射出子弹
canShootBullets = function() {
	return true
}
//空中根据是否冲刺设置速度
dashHspeed = function(dir) {
	if(dash==0) hsp=dir*walkspd*hspd;
	else if(dash==1) hsp=dir*dashspd*hspd;
}
//根据是否滑冰设置速度，icestart为滑冰初速度过低条件
iceHspeed = function(icestart) {
	if(ice==0) {
		dashHspeed(1);
	} else if(ice==1) {
		if(icestart) 
			hsp=1*hspd;
		else
			hsp=image_xscale*dis_x*hspd;
	}
}
#endregion
#region 动作
enum PYWALK {
	idle=0,
	walk=1,
	dash=2,
	attack=4,
	dashChop=5,
	creepe=8,
}
enum PYJUMP {
	ingrd=0,
	jump=1,
	fall=2,
	craw=3,
	crawjump=4,
	ladding=5,
	kickSt=6,
	kick=7,
	kickJump=8,
	glide=9,
	airdash=10,
	airDashChop=11,
	flyChop=17,
	tripFall=19,
	cliffProtect=20,
	catched=21, //被抓住
	
	supportSkill=100, //援护技能
}
#endregion
#region mask
enum PYMASK_TYPE {
	idle,
	dash,
	creep,
}
mask_index=spr_player_mask_idle
getMaskType=function() {
	if in(sprite_index, [spr_player_hu_creep, spr_player_hu_creeping, spr_player_hu_injure3])
		return PYMASK_TYPE.creep
	else if in(sprite_index, [spr_player_armor_dash, spr_player_armor_dash_shoot, spr_player_armor_dash_chop])
		return PYMASK_TYPE.dash
	else 
		return PYMASK_TYPE.idle
}
updateMask=function() {
	/// @description mask更新
	var mask_type=getMaskType();
	if mask_type==PYMASK_TYPE.creep
		mask_index=spr_player_mask_creep
	else if mask_type==PYMASK_TYPE.dash
		mask_index=spr_player_mask_dash
	else 
		mask_index=spr_player_mask_idle
}
#endregion
#region 变身传递变量
card_change_var=function(neo) {
	with neo {
		image_xscale=other.image_xscale
		image_yscale=other.image_yscale
		injure_t=other.injure_t
		waterboost=other.waterboost
		underwater=other.underwater
		jump=0
		walk=0
	}
}
#endregion