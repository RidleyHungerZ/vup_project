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
	draw_clear_alpha(c_white, 1)
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
#region 界面内容
if global.operate==1
&& global.player_operate==1 {
	var ifx=16, ify=16;
	draw_sprite(spr_ui_grd_support_iframe, 0, ifx, ify)
	//hp 对应血条64=3倍长度
	if false{
		//血条框架
		var hpx=ifx+32, hpy=ify+13,
			hpifw=sprite_get_width(spr_ui_grd_hp_iframe),
			hpifh=sprite_get_height(spr_ui_grd_hp_iframe),
			hpiflen=(global.player_hp_up/64)*3*hpifw;
		draw_sprite(spr_ui_grd_hp_iframe, 0, hpx, hpy)
		draw_sprite_ext(spr_ui_grd_hp_iframe, 1, hpx+hpifw, hpy, (hpiflen-hpifw-32)/hpifw, 1, 0, c_white, 1)
		draw_sprite_ext(spr_ui_grd_hp_iframe, 2, hpx+hpiflen, hpy, -1, 1, 0, c_white, 1)
		var hpsurf = draw_hp(global.player_hp, hpiflen-1),
			hpaftsurf = draw_hp(global.player_hp_aft, hpiflen-1)
		draw_surface_ext(hpaftsurf, hpx+2, hpy+2, 1, 1, 0, $130ecc, 1)
		surface_free(hpaftsurf)
		draw_surface_ext(hpsurf, hpx+2, hpy+2, 1, 1, 0, c_white, 1)
		surface_free(hpsurf)
	}
	//mp
	if false{
		//能量条框架
		var mpx=ifx+36, mpy=ify+39,
			mpifw=sprite_get_width(spr_ui_grd_mp_iframe),
			mpifh=sprite_get_height(spr_ui_grd_mp_iframe),
			mpiflen=(global.player_mp_up/64)*3*mpifw;
		draw_sprite(spr_ui_grd_mp_iframe, 0, mpx, mpy)
		draw_sprite_ext(spr_ui_grd_mp_iframe, 1, mpx+mpifw, mpy, (mpiflen-mpifw-16)/mpifw, 1, 0, c_white, 1)
		draw_sprite_ext(spr_ui_grd_mp_iframe, 2, mpx+mpiflen, mpy, -1, 1, 0, c_white, 1)
		//能量条
		var mpsurf = draw_mp(global.player_mp, mpiflen-4)
		draw_surface_ext(mpsurf, mpx+2, mpy+2, 1, 1, 0, $f0ce00, 1)
		surface_free(mpsurf)
	}


	//var supportw = sprite_get_width(spr_ui_grd_support),
	//	supporth = sprite_get_height(spr_ui_grd_support),
	//	parth = floor(supporth*(1-global.player_support/100))
	//draw_sprite_part(spr_ui_grd_support, 0, 0, parth, supportw, supporth-parth, 39, 102+parth)
	////scr_draw_text(c_white, 1, 0, font_butter_support, 0.5, 0.5, "50", 60, 82, 1, 1, -1, -1, -1)
	//draw_set_font(font_butter_support)
	//draw_set_halign(fa_center)
	//draw_set_valign(fa_middle)
	//draw_set_color_alpha($5300f1, 1)
	//draw_text_ext_transformed(59, 81, global.player_support, -1, -1, 1, 1, 0)
	//draw_set_color_alpha_init()
	////血条
	//draw_sprite(spr_ui_grd_hp_iframe, 0, 81, 76)
	//draw_sprite_ext(spr_ui_grd_hp, 0, 83, 76, global.player_hp/global.player_hp_up, 1, 0, c_white, 1)
	////能量条
	//draw_sprite(spr_ui_grd_mp_iframe, 0, 89, 120)
	//draw_sprite_ext(spr_ui_grd_mp, 0, 92, 120, global.player_mp/global.player_mp_up, 1, 0, c_white, 1)
	
	#region 腰带
	with obj_menu {
		var bx=288, by=960
		//纹路底
		draw_sprite(spr_ui_grd_cards_in, 0, bx, by)
		with obj_staff {
			//非换卡时
			if player_change_action==0 {
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
						if !global.model_get[cinx] cinx=8
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
}
#endregion