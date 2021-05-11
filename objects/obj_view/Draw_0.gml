if view_current!=1 exit
#region 使用镜头0内容覆盖app
if surface_exists(view0_surface_temp) {
	var apsw = surface_get_width(application_surface), 
		apsh = surface_get_height(application_surface), 
		v0sw = surface_get_width(view0_surface_temp), 
		v0sh = surface_get_height(view0_surface_temp),
		xsc = apsw/v0sw,
		ysc = apsh/v0sh;
	surface_set_target(application_surface)
	draw_clear_alpha(c_black, 0.5)
	gpu_set_blendmode(bm_normal)
	draw_surface_ext(view0_surface_temp, 0, 0, xsc, ysc, 0, c_white, 1)
	surface_reset_target()
	//滤镜划线
	var pixFilter = global.pix_filter,
		pixAlpha = 0.2
	//pixFilter=true
	if pixFilter{
		draw_set_color_alpha(c_black, pixAlpha)
		for(var i=0;i<apsw;i+=xsc) {
			draw_line(i, 0, i, apsh)
			//scr_draw_line(c_black, pixAlpha, 1, false, i, 0, i, apsh)
		}
		for(var i=0;i<apsh;i+=ysc) {
			//scr_draw_line(c_black, pixAlpha, 1, false, 0, i, apsw, i)
			draw_line(0, i, apsw, i)
		}
		draw_set_color_alpha_init()
	}
}
#endregion
//绘制UI时开启模糊
gpu_set_texfilter(true)
#region 界面内容
#region 驾驶舱
if operate_rate>0 {
	var ifx=32, ify=80*operate_rate;
	//发卡
	draw_sprite(spr_ui_grd_board_bgs, 0, ifx, ify)
	//hp 对应血条64=3倍长度
	#region HP
	if true {
		//血条框架
		var hpx=ifx+112, hpy=ify+42, hprate=8;
		//黑背景
		var hpifx=hpx+16+12,hpify=hpy-2,
			hpifw=sprite_get_width(spr_ui_grd_hp_iframe),
			hpifh=sprite_get_height(spr_ui_grd_hp_iframe),
			hpifcenlen=global.player_hp_up*hprate-16;
		draw_sprite_ext(spr_ui_grd_hp_iframe, 0, hpifx, hpify, hpifcenlen/hpifw, 1, 0, c_white, 1)
		draw_sprite(spr_ui_grd_hp_iframe, 1, hpifx+hpifcenlen, hpify)
		//红血条
		var hpaftsurf=get_hp_surface(global.player_hp_aft, global.player_hp_up, hprate);
		if surface_exists(hpaftsurf) {
			draw_surface_ext(hpaftsurf, hpx+0, hpy+8, 1, 1, 0, $130ecc, 11)
			surface_free(hpaftsurf)
		}
		//血条
		var hpsurf=get_hp_surface(global.player_hp, global.player_hp_up, hprate);
		if surface_exists(hpsurf) {
			draw_surface(hpsurf, hpx+0, hpy+8)
			surface_free(hpsurf)
		}
		//血条外白条
		var hptopx=hpx-4, hptopy=hpy,
			hptopw=sprite_get_width(spr_ui_grd_hp_top),
			hptopcenlen=global.player_hp_up*hprate-hptopw;
		draw_sprite(spr_ui_grd_hp_top, 0, hptopx, hptopy)
		draw_sprite_ext(spr_ui_grd_hp_top, 1, hptopx+hptopw, hptopy, hptopcenlen/hptopw, 1, 0, c_white, 1)
		draw_sprite(spr_ui_grd_hp_top, 2, hptopx+hptopw+hptopcenlen, hptopy)
	}
	#endregion
	#region MP
	if true {
		//能量条框架
		var mpx=ifx+120, mpy=ify+72, mprate=2;
		//黑条
		var mpifx=mpx, mpify=mpy,
			mpifw=sprite_get_width(spr_ui_grd_mp_iframe),
			mpifh=sprite_get_height(spr_ui_grd_mp_iframe),
			mpifcenlen=global.player_mp_up*hprate-16;
		draw_sprite(spr_ui_grd_mp_iframe, 0, mpifx, mpify)
		draw_sprite_ext(spr_ui_grd_mp_iframe, 1, mpifx+mpifw, mpify, mpifcenlen/mpifw, 1, 0, c_white, 1)
		draw_sprite(spr_ui_grd_mp_iframe, 2, mpifx+mpifw+mpifcenlen, mpify)
		//能量条
		var mppointx=mpx+6, mppointy=mpy+4,
			mppointw=sprite_get_width(spr_ui_grd_mp),
			mppointcount=global.player_mp_up/mprate;
		for(var i=0;i<mppointcount;i++) {
			var pointval = global.player_mp mod mprate;
			if (i+1)*mprate<=global.player_mp pointval=mprate;
			else if i*mprate>global.player_mp pointval=0;
			draw_sprite_ext(spr_ui_grd_mp, 0, mppointx+16*i, mppointy, 1, 1, 0, c_white, pointval/mprate)
		}
	}
	#endregion
	#region 支援槽
	var supifx=ifx+132, supify=ify+21;
	draw_sprite(spr_ui_grd_support_iframe, 0, supifx, supify)
	if global.player_support<100 {
		draw_sprite(spr_ui_grd_support_iframe, 1, supifx, supify)
	} else {
		if (global.fps_currmenu mod 60)<=30 {
			var rate=(global.fps_currmenu mod 30)/30,
				scale=1+1*rate,
				alpha=1-rate;
			draw_sprite_ext(spr_ui_grd_support_iframe, 0, supifx, supify, scale, scale, 0, c_white, alpha)
		}
	}
	var supstr="MAX",
		strcol=UIPINK;
	if global.player_support<100 {
		supstr=string(global.player_support)+"%"
		if global.player_support<10 supstr=" "+supstr;
	} else {
		strcol=c_black
	}
	scr_draw_text_ext(strcol, 1, 0, font_jam_24, 0.5, 0.5, supstr, supifx, supify+1, 1, 1, -1, -1, c_black, 1);
	#endregion
	
	var bx=288, by=VIEW_H_UI-120*operate_rate
	#region 腰带
	with obj_menu {
		//纹路底
		draw_sprite(spr_ui_grd_cards_in, 0, bx, by)
		with obj_staff {
			//非换卡时
			if player_change_action==0 
			|| player_change_atonce {
				if(global.model!=PLAYER_MODEL.HU)
					draw_sprite(spr_ui_grd_cards, global.model, bx, by)
				draw_sprite(spr_ui_grd_cards_in, global.model, bx, by)
			} 
			//换卡中
			else {
				var cardinxs=[], 
					cardimx=1, 
					cardshx=0, 
					insertshy=0;
				for(var i=-2, j=0;i<=2;{i++ j++}){
					cardinxs[j]=player_change_select+i
					while cardinxs[j]<0 
						cardinxs[j]+=global.model_number;
					while cardinxs[j]>=global.model_number 
						cardinxs[j]-=global.model_number;
				}
				//卡片缩放：出现、消失
				if player_change_action==2{
					cardimx=1-player_change_outsert_rate
				} else if player_change_action==6 {
					cardimx=player_change_outsert_rate
				}
				//卡片x位移
				if player_change_action==3 {
					if player_change_select_dir==1 
						cardshx=player_change_outsert_rate
					else if player_change_select_dir==-1 
						cardshx=-player_change_outsert_rate
				}
				//卡片y位移，针对插卡拔卡
				//拔卡
				if player_change_action==4 
				|| player_change_action==5.5 {
					insertshy=1-player_change_outsert_rate
				}
				//插卡
				if player_change_action==5 {
					insertshy=player_change_outsert_rate
				}
				//消失之前卡片才会出现
				if between(player_change_action, 1, false, 6, true) {
					//卡片列表
					for(var i=-2, j=0;i<=2;{i++ j++}){
						var alpha=1-abs((i+cardshx)*120)/240,
							cspr=spr_ui_grd_cards,
							cinx=cardinxs[j],
							cinxde=cinx,
							cardimy=1;
						//当前使用的卡片位置做空缺
						if player_change_last==cinx 
						&& player_change_last!=PLAYER_MODEL.HU{
							cspr=spr_ui_grd_card_pull
							cinx=0
							cardimy=-1
						}
						//拔卡后，该位置显示拔出来的卡
						if player_change_action>=5 && i==0 {
							if !player_change_cancle
								cinx=player_change_last
							if cinx==PLAYER_MODEL.HU alpha=0
							//恢复人形拔卡时空缺该位置
							if player_change_action==5.5 alpha=0
						} else {
							//选中人形时，提示拔卡箭头
							if player_change_select==PLAYER_MODEL.HU {
								if cardshx==0 && insertshy==0 && cardimx==1 {
									draw_sprite(spr_ui_grd_card_pull, 0, bx, by-144+8*sin(global.fps_curr*pi/30))
									if cinxde==PLAYER_MODEL.HU alpha=0
								}
							}
						}
						//人形没有卡片
						if cinx==PLAYER_MODEL.HU {
							cspr=spr_ui_grd_card_pull
							cinx=0
							//alpha=0
						}
						//未获得的卡片使用第8帧
						if !scr_model_isget(cinx) cinx=8
						draw_sprite_ext(cspr, cinx, bx+(i+cardshx)*112, by-144, cardimx, cardimy, 0, c_white, alpha)
					}
				}
				//目前插卡
				if(global.model!=PLAYER_MODEL.HU)
					draw_sprite(spr_ui_grd_cards, global.model, bx, by-144*insertshy)
				//卡在机器里时，显示屏幕
				if insertshy==0 
					draw_sprite(spr_ui_grd_cards_in, global.model, bx, by)
				//选卡箭头
				if player_change_action==3{
					for(var i=-1;i<=1;i+=2){
						draw_sprite_ext(spr_ui_grd_card_arrow, 0, bx+i*(128+8*sin(global.fps_curr*pi/30)), by, i, 1, 0, c_white, 1)
					}
				}
			}
		}
		//腰带变身器
		draw_sprite(spr_ui_grd_belt, 0, bx, by)
	}
	#endregion
	
	var bifx=1888, bify=VIEW_H_UI-120*operate_rate
	#region BOSS血条
	if global.boss_war==1 {
		var hpupmax=96
		//黑背景
		draw_sprite(spr_ui_grd_bosshp_bgs, 0, bifx, bify)
		//图标
		draw_sprite(spr_ui_grd_bosshp_icon, global.boss_icon, bifx-32, bify-10)
		//血条框架
		var hpx=bifx-46, hpy=bify+37, hprate=8;
		var hpifx=hpx-8,hpify=hpy+2,
			hpifw=sprite_get_width(spr_ui_grd_hp_iframe),
			hpifh=sprite_get_height(spr_ui_grd_hp_iframe),
			hpifcenlen=hpupmax*hprate-16;
		draw_sprite_ext(spr_ui_grd_hp_iframe, 0, hpifx, hpify, -hpifcenlen/hpifw, 1, 0, c_white, 1)
		draw_sprite_ext(spr_ui_grd_hp_iframe, 1, hpifx-hpifcenlen, hpify, -1, 1, 0, c_white, 1)
		var hpcounts=(global.boss_hp div hpupmax),
			hpcols=array_create(hpcounts+1, c_white)
		hpcols[0]=c_white
		hpcols[1]=$a0c53c
		hpcols[2]=$bd7843
		for(var i=0;i<=hpcounts;i++) {
			var _hp=min(global.boss_hp-i*hpupmax, hpupmax),
				_hpaft=min(global.boss_hp_aft-i*hpupmax, hpupmax);
			//红血条
			var bhpaftsurf=get_hp_surface(_hpaft, hpupmax, hprate);
			if surface_exists(bhpaftsurf) {
				draw_surface_ext(bhpaftsurf, hpx+19, hpy+12, -1, 1, 0, $130ecc, 11)
				surface_free(bhpaftsurf)
			}
			//血条
			var bhpsurf=get_hp_surface(_hp, hpupmax, hprate);
			if surface_exists(bhpsurf) {
				draw_surface_ext(bhpsurf, hpx+19, hpy+12, -1, 1, 0, hpcols[i], 11)
				surface_free(bhpsurf)
			}
		}
		//血条外白条
		draw_sprite(spr_ui_grd_bosshp_top, 0, bifx-23, bify+3)
		var hptopx=hpx-106, hptopy=hpy+4,
			hptopw=sprite_get_width(spr_ui_grd_hp_top),
			hptopcenlen=hpupmax*hprate-4*hptopw;
		draw_sprite_ext(spr_ui_grd_hp_top, 1, hptopx, hptopy, -hptopcenlen/hptopw, 1, 0, c_white, 1)
		draw_sprite_ext(spr_ui_grd_hp_top, 2, hptopx-hptopcenlen, hptopy, -1, 1, 0, c_white, 1)
	}
	#endregion
}
#endregion
#region 对话框
if global.talk!=0 {
	draw_set_font(font_puhui_32)
	var pos={
		frame : [0, 0],
		shoto : [198, 194],
		namef : [348, 267],
		name  : [400, 292],
		txtpx : [480, 64],
		txtpy : [40, 864],
	}, tfx=0, tfy=0, 
	xmirror=function(px, xsc) {
		if xsc==1 return px
		else return VIEW_W_UI-px
	}, 
	yflip=function(py, ysc) {
		if ysc==-1 return py
		else return VIEW_H_UI-py
	};
	//黑幕
	scr_draw_rectangle_view(c_black, 0.5*talk_rate, 1)
	//1上2下
	for(var i=1;i<=2;i++) {
		if global.talk_inx!=0 && global.talk_inx!=i continue
		var ysc=sign(i-1.5),
			xsc=ysc*global.talk_inx_xscale,
			blend=c_white
		tfy=-(400*(1-talk_rate))
		if i!=global.talk_now blend=merge_color(c_black, c_white, 0.5)
		//名字
		var namefw=sprite_get_width(spr_ui_grd_talk_name),
			nametxt=global.txt_names[global.talk_name[i]],
			nametxtw=string_width(nametxt),
			drawx=pos.namef[0],
			txtleft=(xsc==1) ? 0 : 1;
		draw_sprite_ext(spr_ui_grd_talk_name, 0, xmirror(tfx+drawx, xsc), yflip(tfy+pos.namef[1], ysc),
						xsc, ysc, 0, blend, 1);
		drawx+=namefw
		draw_sprite_ext(spr_ui_grd_talk_name, 1, xmirror(tfx+drawx, xsc), yflip(tfy+pos.namef[1], ysc),
						xsc*(ceil(nametxtw/namefw)-1), ysc, 0, blend, 1);
		drawx+=(ceil(nametxtw/namefw)-1)*namefw
		draw_sprite_ext(spr_ui_grd_talk_name, 2, xmirror(tfx+drawx, xsc), yflip(tfy+pos.namef[1], ysc),
						xsc, ysc, 0, blend, 1);
		scr_draw_text(blend, 1, 0, font_puhui_32, txtleft, 0.5, nametxt, 
						xmirror(tfx+pos.name[0], xsc), yflip(tfy+pos.name[1], ysc)+(ysc==-1 ? 8 : 0), 1, 1, -1, -1, -1, 0);
		//框架
		draw_sprite_ext(spr_ui_grd_talk, 0, xmirror(tfx+pos.frame[0], xsc), yflip(tfy+pos.frame[1], ysc), 
						xsc, ysc, 0, blend, 1);
		//头像
		var shotospr
		if global.talk_shoto_type[i]==TALK_SHOTO.player 
			shotospr=spr_ui_grd_talk_shoto_player
		else if global.talk_shoto_type[i]==TALK_SHOTO.boss
			shotospr=spr_ui_grd_talk_shoto_boss
		else if global.talk_shoto_type[i]==TALK_SHOTO.npc
			shotospr=spr_ui_grd_talk_shoto_npc
		draw_sprite_ext(shotospr, global.talk_shoto[i], xmirror(tfx+pos.shoto[0], xsc), yflip(tfy+pos.shoto[1], ysc), 1, 1, 0, blend, 1);
		//对话内容
		var txtx, txty, txtdx, txtdy;
		if xsc==1 txtx=pos.txtpx[0]
		else txtx=pos.txtpx[1]
		if ysc==1 txty=pos.txtpy[1]
		else txty=pos.txtpy[0]
		txtdx=tfx+txtx
		txtdy=tfy*-ysc+txty
		scr_draw_text(blend, 1, 0, font_puhui_32, 0, 0, global.talk_print[i], 
						txtdx, txtdy, 1, 1, -1, -1, -1, 0);
		//对话选项
		if array_length(global.talk_options[i])>0 
		&& scr_talk_print_over(){
			var printh=string_height(global.talk_print[i]),
				optiondy=0;
			//默认最多两个选项
			for(var o=0;o<min(array_length(global.talk_options[i]), talk_select_begin+2);o++) {
				var optiontxt=global.talk_options[i][o];
				scr_draw_text(blend, 1, 0, font_puhui_32, 0, 0, optiontxt, 
								txtdx+128, txtdy+optiondy, 1, 1, -1, -1, -1, 0);
				//游标
				if global.talk_select[i]==o {
					draw_sprite_ext(spr_ui_grd_talk_point, 0, txtdx+96, txtdy+optiondy, 1, 1, 0, blend, 1)
				}
				optiondy+=string_height(optiontxt);
			}
		}
	}
}
#endregion
#endregion