event_inherited()
#region 镜头设置
//场景镜头
view={
	//显示尺寸
	width : VIEW_W,
	height : VIEW_H,
	//实际尺寸
	xport : 0,
	yport : 0,
	wport : VIEW_W,
	hport : VIEW_H,
}
ui={
	width : VIEW_W_UI,
	height : VIEW_H_UI,
	xport : 0,
	yport : 0,
	wport : VIEW_W_UI,
	hport : VIEW_H_UI,
	winsize : [
		{w: VIEW_W*2, h: VIEW_H*2},
		{w: VIEW_W*3, h: VIEW_H*3},
		{w: VIEW_W_UI, h: VIEW_H_UI},
	],
}
view0_surface_temp=noone
/*
由于要采用场景UI分开的方式绘制，使用方案如下：
游戏运行时镜头尺寸为512x288
PreDraw时变更为1920x1080
绘制时使用surface，获得实际场景图，然后只截取512x288的部分，拉伸为1920x1080
完成后，绘制UI
PostDraw后变回512x288
*/
//window_size=0
window_set_size(ui.winsize[global.resolution].w, ui.winsize[global.resolution].h)
window_size_change=0
last_resolution=-1
last_full_screen=-1
#endregion
#region 小房间切分+镜头控制
global.room_xl=0
global.room_xr=room_width
global.room_yt=0
global.room_yb=room_height

global.view_control=0
global.view_shock=0
global.gaypad_shock=[0, 0]
global.gaypad_shock_time=-1
viewShock=0 //镜头震动计算

global.view_dx=0//镜头横向移速
global.view_dy=0//镜头纵向移速
global.view_xcen_shift=0//镜头中心偏移
global.view_ycen_shift=0//镜头中心偏移
prev_view_xcen_shift=0
prev_view_ycen_shift=0

view_oldx=view_xpos(0)
view_oldy=view_ypos(0)

view_shock_prex=view_xpos(0)
view_shock_prey=view_ypos(0)

lastroom_xl=0
lastroom_xr=0
lastroom_yt=0
lastroom_yb=0
global.room_change_xl=0
global.room_change_xr=0
global.room_change_yt=0
global.room_change_yb=0

global.view_hor=0
global.view_vor=0
_view_x=0
_view_y=0

global.player_dx=0
global.player_dy=0
player_x=0
player_y=0

_room_last=0

global.view_hsp=0
global.view_vsp=0

room_range_inst=noone //当前使用的房间范围实例
room_range_list=ds_list_create()
#endregion
#region 对话
global.talk=0 //对话
global.talk_inx=0 //对话，0全出，1上2下
global.talk_now=1 //当前对话框，0为同时
global.talk_inx_xscale=1 //方向，默认上右下左
global.talk_txt=array_create(2, "") //对话内容
global.talk_txt_len=array_create(2, 0) //对话内容
global.talk_print=array_create(2, "") //对话输出内容（打字机当前）
global.talk_print_len=array_create(2, 0) //对话输出内容长度
global.talk_shoto_type=array_create(2, 0) //头像类型
global.talk_shoto=array_create(2, 0) //头像
global.talk_name=array_create(2, 0) //名称
global.talk_options=array_create(2, []) //对话中的选项
global.talk_select=array_create(2, 0) //当前选中选项
talk_rate=0 //对话框位置
#endregion
#region 房间存储
room_range_inst=noone //当前房间对应对象
room_range_sets=ds_map_create()
#endregion
#region 黑幕
black_surface=noone//黑幕surface
black_display=false//黑幕是否显示
black_alpha=1//黑幕百分比
black_alpha_step=0//增减幅度
black_inst=noone//黑幕操控实例
black_depth=30000//深度
//配置在黑幕中自动获得光源的Obj
map_inst_cleared=true//清理过了map中的实例
black_light_insts_set=ds_map_create() //map[? obj]=rad，rad=-1时按照精灵设置
//大于0为固定半径，0为没有，-1为自动设置
black_light_insts_set[? obj_player]="lightrad"
black_light_insts_set[? obj_player_bullet]=-1
black_light_insts_set[? obj_enemy]="lightrad"
black_light_insts_set[? obj_bullet]="lightrad"
black_light_followed_insts_list=ds_list_create() //跟踪对象的id集合
//跟踪玩家的光圈
black_light_player=noone
#endregion
#region 绘制
operate_rate=0 //恢复操作驾驶舱缓动
//羁绊满时触发
support_max_trigger=function() {
	scr_sound_play(se_support_max)
}
//血条
get_hp_surface = function(hp, up, rate) {
	var hpw=sprite_get_width(spr_ui_grd_hp),
		hph=sprite_get_height(spr_ui_grd_hp),
		//hptopw=sprite_get_width(spr_ui_grd_hp_top),
		//hptoph=sprite_get_height(spr_ui_grd_hp_top),
		realenmax=up*rate, //只看上边的真实最大长度
		realen=hp*rate, //只看上边的真实长度
		hpsurf=surface_create(realenmax+hpw, hph);
	surface_set_target(hpsurf)
	draw_clear_alpha(c_white, 0)
	//绘制白条
	var hpx=0, hpy=0, cenlen=realenmax-hpw;
	draw_sprite(spr_ui_grd_hp, 0, hpx, hpy)
	draw_sprite_ext(spr_ui_grd_hp, 1, hpx+hpw, hpy, cenlen/hpw, 1, 0, c_white, 1)
	draw_sprite(spr_ui_grd_hp, 2, hpx+realenmax, hpy)
	//擦除扣血部分
	gpu_set_blendmode_ext(bm_src_alpha, bm_zero)
	draw_set_alpha(0)
	draw_primitive_begin(pr_trianglestrip)
	draw_vertex(hpx+realenmax+hpw, hpy)
	draw_vertex(hpx+realen, hpy)
	draw_vertex(hpx+realen+hpw, hpy+hph)
	draw_vertex(hpx+realenmax+hpw, hpy+hph)
	draw_vertex(hpx+realenmax+hpw, hpy)
	draw_primitive_end()
	draw_set_color_alpha_init()
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
	return hpsurf
}
#endregion
event_perform(ev_other, ev_room_start)