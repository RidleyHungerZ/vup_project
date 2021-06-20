event_inherited()
gpu_set_texfilter(true)
#region init脚本
//宏初始化
scr_macros()
//枚举初始化
scr_enums()
//音效设置等级容纳200
audio_channel_num(200)
audio_se_inti()
audio_dpl_inti()
audio_bgm_inti()
#endregion
#region ini变量初始化
var initaryinx=0
#region 键盘
global.left_key		=ord("A")
global.right_key	=ord("D")
global.up_key		=ord("W")
global.down_key		=ord("S")
global.select_key	=vk_space
global.start_key	=vk_enter

global.A_key	=ord("J")
global.B_key	=ord("K")
global.L_key	=ord("Q")
global.R_key	=ord("E")
global.X_key	=ord("U")
global.Y_key	=ord("I")

global.att_key		=	ord("J")
global.jump_key		=	ord("K")
global.dash_key		=	ord("L")
global.sub_key		=	ord("U")
global.trans_key	=	ord("I")
global.true_key		=	ord("O")
global.tformL_key	=	ord("Q")
global.tformR_key	=	ord("E")
//初始化记录存入
global.option_init_ary[initaryinx++]=[
	"left_key", "right_key", "up_key", "down_key", 
	"select_key", "start_key",
	"A_key", "B_key", "L_key", "R_key", "X_key", "Y_key",
	"jump_key", "att_key", "dash_key", "sub_key", "trans_key", "true_key", "tformL_key", "tformR_key",
	
	"jump_joy", "att_joy", "dash_joy", "sub_joy", 
	"trans_joy", "true_joy", "tformL_joy", "tformR_joy",
]
#endregion
#region 手柄
global.joy=-4//当前手柄
global.jump_joy =	gp_a
global.true_joy =	gp_b
global.att_joy =	gp_x
global.trans_joy =	gp_y
global.dash_joy =	gp_l
global.sub_joy =	gp_r
global.tformL_joy =	gp_zl
global.tformR_joy =	gp_zr
global.select_joy =	gp_select
global.start_joy =	gp_start
//初始化记录存入
//global.option_init_ary[initaryinx++]=[
//	"jump_joy", "att_joy", "dash_joy", "sub_joy", 
//	"trans_joy", "true_joy", "tformL_joy", "tformR_joy",
//]
#endregion
#region 动作
global.joy_ab_invert=0 //AB倒置
global.sub_type=0//0双键，1双按，2切换
global.dash_order=1//冲刺指令
global.alert_type=1//系统提示
//初始化记录存入
global.option_init_ary[initaryinx++]=[
	"joy_ab_invert", "sub_type", "dash_order", "alert_type", 
]
#endregion
#region 显示读取
global.full_screen=0
global.resolution=0
global.pix_filter=0
global.language=LANG.CHS
//初始化记录存入
global.option_init_ary[initaryinx++]=[
	"full_screen", "resolution", "pix_filter", "language"
]
#endregion
#region 音量读取
global.volume_se=1
global.volume_bgm=1
global.volume_all=1
global.volume_menu=0.5//菜单音量
//初始化记录存入
global.option_init_ary[initaryinx++]=[
	 "volume_all","volume_se", "volume_bgm",
]
#endregion
#region 设置初始化和上版本记录map
for(var i=0;i<array_length(global.option_init_ary);i++){
	global.option_init_map[i]=ds_map_create() //记录初始按键
	global.option_last_map[i]=ds_map_create() //记录上一次按键
	var ary = global.option_init_ary[i],
		map = global.option_init_map[i]
	for(var j=0;j<array_length(ary);j++){
		var key = ary[j], 
			val = variable_global_get(key)
		map[? key] = val
	}
}
#endregion
#endregion
#region ini读取
have_file_config = file_exists(FILE_CONFIG)
ini_open(FILE_CONFIG)
#region 键盘
global.left_key =	ini_read_real("key", "left",	global.left_key)
global.right_key =	ini_read_real("key", "right",global.right_key)
global.up_key =		ini_read_real("key", "up",	global.up_key)
global.down_key =	ini_read_real("key", "down",global.down_key)
global.select_key =	ini_read_real("key", "select",global.select_key)
global.start_key =	ini_read_real("key", "start", global.start_key)

global.A_key = ini_read_real("key", "A", global.A_key)
global.B_key = ini_read_real("key", "B", global.B_key)
global.L_key = ini_read_real("key", "L", global.L_key)
global.R_key = ini_read_real("key", "R", global.R_key)
global.X_key = ini_read_real("key", "X", global.X_key)
global.Y_key = ini_read_real("key", "Y", global.Y_key)

global.jump_key =	ini_read_real("key", "jump",	global.jump_key)
global.att_key =	ini_read_real("key", "att",		global.att_key)
global.dash_key =	ini_read_real("key", "dash",	global.dash_key)
global.sub_key =	ini_read_real("key", "sub",		global.sub_key)
global.trans_key =	ini_read_real("key", "trans",	global.trans_key)
global.true_key =	ini_read_real("key", "true",	global.true_key)
global.tformL_key =	ini_read_real("key", "tformL",	global.tformL_key)
global.tformR_key =	ini_read_real("key", "tformR",	global.tformR_key)
#endregion
#region 手柄
global.jump_joy =	ini_read_real("joy", "jump",	global.jump_joy)
global.true_joy =	ini_read_real("joy", "true",	global.true_joy)
global.att_joy =	ini_read_real("joy", "att",		global.att_joy)
global.trans_joy =	ini_read_real("joy", "trans",	global.trans_joy)
global.dash_joy =	ini_read_real("joy", "dash",	global.dash_joy)
global.sub_joy =	ini_read_real("joy", "sub",		global.sub_joy)
global.tformL_joy =	ini_read_real("joy", "tformL",	global.tformL_joy)
global.tformR_joy =	ini_read_real("joy", "tformR",	global.tformR_joy)
#endregion
#region 动作
global.joy_ab_invert = ini_read_real("order", "joy_ab_invert",	global.joy_ab_invert)//AB倒置
global.sub_type =	ini_read_real("order", "sub",			global.sub_type)//0双键，1双按，2切换
global.dash_order =	ini_read_real("order", "dash_order",	global.dash_order)//冲刺指令
global.alert_type =	ini_read_real("order", "alert_type",	global.alert_type)//系统提示
#endregion
#region 显示读取
global.full_screen = ini_read_real("display", "full_screen",global.full_screen)
global.resolution = ini_read_real("display", "resolution",global.resolution)
global.pix_filter =	ini_read_real("display", "pix_filter",	global.pix_filter)
global.language =	ini_read_real("display", "language",	global.language)
#endregion
#region 音量读取
global.volume_se =	ini_read_real("volume", "se",	global.volume_se)
global.volume_bgm =	ini_read_real("volume", "bgm",	global.volume_bgm)
global.volume_all =	ini_read_real("volume", "all",	global.volume_all)
#endregion
ini_close()
#endregion
#region 键态区
//菜单按键
global.Left_state=0
global.Right_state=0
global.Up_state=0
global.Down_state=0
global.A_state=0
global.B_state=0
global.L_state=0
global.R_state=0
global.X_state=0
global.Y_state=0
global.Select_state=0
global.Start_state=0
global.pad_direct=-1 //根据方向键设定角度
global.axisL_direct=-1 //根据摇杆设定角度
global.axisR_direct=-1
global.axisL_position=0 //摇杆摆动幅度
global.axisR_position=0
global.Mleft_state=0
global.Mright_state=0
global.Mmiddle_state=0
global.Mwheel_state=0//-1up,1down
global.Mmouse_x=mouse_x
global.Mmouse_y=mouse_y
//玩家动作按键
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
global.tformL_state=0
global.tformR_state=0
//辅助按键
global.jump_cor=0
global.dash_cor=0
//程序自动按键(0代表没按下，1按下)
global.left=0
global.right=0
global.up=0
global.down=0
global.jump=0
global.att=0
global.dash=0
global.sub=0
global.true=0
global.trans=0
global.select=0
global.start=0
global.tformL=0
global.tformR=0
//按键状态集中/0-键盘，1-手柄
for(var i=0;i<2;i++){
	global.left_allstate[i]=0
	global.right_allstate[i]=0
	global.up_allstate[i]=0
	global.down_allstate[i]=0
	global.select_allstate[i]=0
	global.start_allstate[i]=0
		
	global.A_allstate[i]=0
	global.B_allstate[i]=0
	global.X_allstate[i]=0
	global.Y_allstate[i]=0
	global.L_allstate[i]=0
	global.R_allstate[i]=0
		
	global.att_allstate[i]=0
	global.jump_allstate[i]=0
	global.dash_allstate[i]=0
	global.sub_allstate[i]=0
	global.trans_allstate[i]=0
	global.true_allstate[i]=0
	global.tformL_allstate[i]=0
	global.tformR_allstate[i]=0
}
#endregion
#region 存档变量
global.game_start=0
data_save_variable_single()
data_save_variable_global()
/////////////////////////
global.re_x=0
global.re_y=0
global.re_xscale=0
global.player_es_max=99999
global.combo=0 //当前连击数
global.combo_time=0 //连击倒计时
global.support_mult=1 //羁绊值倍率
global.player_buff=PLAYER_BUFF.none
global.player_buff_time=0
global.player_debuff=PLAYER_DEBUFF.none
global.player_debuff_time=0
#endregion
#region 计时区
global.fps_60=0
global.fps_30=0
global.fps_20=0
global.fps_15=0
global.fps_12=0
global.fps_10=0
global.fps_6=0
global.fps_5=0
global.fps_4=0
global.fps_3=0
global.fps_2=0
global.fps_1=0
global.fps_curr=0//运行开始到现在共多少帧
global.fps_currmenu=0//运行开始到现在活动状态
global.fps_roommenu=0//房间开始到现在活动状态
#endregion
#region 暂停区
global.operate=0//完全代码操纵
global.player_operate=0//仅关闭按键操纵，依然可用自带移动体系
global.stop=0//暂停游戏
//打击感
global.saber_pause=0
global.boss_pause=0
boss_pause_time=0
//传送房间中
global.transing=0
#endregion
#region 其他变量
global.player_change_flash=0
global.player_change_flash_rate=0
global.room_change=0
global.room_change_rate=array_create(3,0)
global.skip=0
global.boss_war=0
global.boss_hp=0
global.boss_hp_aft=0
global.boss_icon=0
global.player_def=1//实际伤害百分比
global.prick_attack=16//尖刺伤害
global.player_reversed=0//上下倒立
global.floor_down_list=ds_list_create()//玩家半透板记录
player_death_action=0//重生控制变量
player_death_time=0//重生控制变量
player_change_action=0 //换卡动作
player_change_time=0 //换卡动作
player_change_last=0 //换之前上一张卡
player_change_select=0 //选中的卡
player_change_select_dir=0 //更改选择的方向
player_change_outsert_rate=0 //卡片拔出程度，0插卡中，1完全拔卡
player_change_cancle=false //是否是取消的
player_change_over=false //玩家动画已经走完
player_change_atonce=false //立刻变身
player_sub_unuse=array_create(global.model_number, false)
player_sub_unuse[0]=true
//一些方便使用的list
global.modellist=ds_list_create()
global.rtanklist=ds_list_create()
global.rtank_val_max=64
//自动回复sp
auto_sp_time=0
loss_sp_time=0
#endregion
#region 发射区
instance_create_depth(0, 0, -10000, obj_view)
instance_create_depth(0, 0, 0, obj_room)
instance_create_depth(0, 0, -20000, obj_menu)
player[PLAYER_MODEL.HU]=obj_player_hu
player[PLAYER_MODEL.ARMOR]=obj_player_armor
with instance_create_layer(x,y,"inst02",player[PLAYER_MODEL.HU]) {
	scr_sprite_change(spr_none, 0, 0)
	instance_create_depth(x,y,depth-10,obj_player_saber)
}
#endregion
#region 重生区
global.re_x=obj_player.x
global.re_y=obj_player.y
global.re_xscale=obj_player.image_xscale
global.room_prev=room
#endregion
#region 音乐区
global.music=-1//当前音乐
global.music_last=0//上一个音乐
global.music_now=noone
global.music_change=0//音乐变更
music_time=0//音乐更换计时
#endregion
#region 文本区
scr_txt()
#endregion
event_perform(ev_other, ev_game_start)