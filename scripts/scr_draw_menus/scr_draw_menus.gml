/// @desc 绘制头部页签
/// @arg x
/// @arg y
function scr_draw_menu_tab(dx, dy, index){
	var cenx = dx+VIEW_W_UI/2;
	var preinx = index-1,
		nextinx = index+1;
	if preinx<0 preinx=menu_page_count-1
	if nextinx>=menu_page_count nextinx=0
	draw_sprite(spr_menu_tab, 0, dx, dy)
	draw_sprite(spr_menu_tab_lr_name, preinx, dx+408, dy+64)
	draw_sprite(spr_menu_tab_lr_name, nextinx, dx+VIEW_W_UI-408, dy+64)
	//L
	draw_sprite_ext(spr_menu_tab_lr, 0, dx, dy, 1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_menu_tab_lr_txt, 0, dx+96, dy+80, 1, 1, 0, c_white, 1)
	//R
	draw_sprite_ext(spr_menu_tab_lr, 0, dx+VIEW_W_UI, dy, -1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_menu_tab_lr_txt, 1, dx+VIEW_W_UI-96, dy+80, 1, 1, 0, c_white, 1)
	//name
	draw_sprite(spr_menu_tab_center, 0, cenx, dy)
	draw_sprite(spr_nemu_tab_center_name, index, cenx, dy+64)
	//箭头
	var af = sin(global.fps_curr*pi/30);
	draw_sprite_ext(spr_menu_arrow, 0, cenx-336-8*af, dy+64, -1, 1, 0, c_white, 1)
	draw_sprite_ext(spr_menu_arrow, 0, cenx+336+8*af, dy+64, 1, 1, 0, c_white, 1)
}
/// @desc 绘制状态页
/// @arg x
/// @arg y
function scr_draw_menu_status(dx, dy){
	var drawx=dx, drawy=dy, page=0, msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	#region 左侧
	{
		draw_sprite(spr_menu_status_left_bgs, 0, dx+368, dy+592)
		//时间金币卡
		drawx=dx+368 drawy=dy+384
		draw_sprite(spr_menu_status_left_timeec_bgs, 0, drawx, drawy)
		drawx=dx+368 drawy=dy+384
		var txtstruts=global.txt_menu[0].left;
		//时间
		scr_draw_text_ext(UIPINK, 1, 0, font_puhui_32, 0.5, 0.5, txtstruts.PLAY_TIME, drawx, drawy-28-56, 1, 1, -1, -1, -1, 0)
		var timestr=date_format("HH:mm:ss", [0, 0, 0, global.hour, global.minute, global.second])
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, timestr, drawx, drawy-28, 1, 1, -1, -1, -1, 0)
		//金币
		scr_draw_text_ext(UIPINK, 1, 0, font_puhui_32, 0.5, 0.5, txtstruts.CYBER_ES, drawx, drawy+28, 1, 1, -1, -1, -1, 0)
		var esstrs=["[", "ES]"];
		scr_draw_text_ext(UIPINK, 1, 0, font_puhui_32, 0, 0.5, esstrs[0], drawx-112, drawy+28+56, 1, 1, -1, -1, -1, 0)
		scr_draw_text_ext(UIPINK, 1, 0, font_puhui_32, 1, 0.5, esstrs[1], drawx+112, drawy+28+56, 1, 1, -1, -1, -1, 0)
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, global.player_es, drawx-24, drawy+28+56, 1, 1, -1, -1, -1, 0)
	
		//头像
		drawx=dx+368 drawy=dy+624
		draw_sprite(spr_menu_status_left_shoto_iframe, 0, drawx, drawy)
		draw_sprite(spr_menu_status_left_shoto, global.model, drawx, drawy)
		draw_sprite(spr_menu_status_left_shoto_iframe, 1, drawx, drawy)
		//血条
		drawx=dx+128 drawy=dy+752
		var hpifw=sprite_get_width(spr_menu_status_left_hp_iframe),
			hpifh=sprite_get_height(spr_menu_status_left_hp_iframe),
			hpifxcenlen=hpifw*(30*(global.player_hp_up/64))-2*hpifw,
			hpcenlen=hpifw*(30*(global.player_hp/64));
		draw_sprite(spr_menu_status_left_hp_iframe, 0, drawx, drawy)
		draw_sprite_ext(spr_menu_status_left_hp_iframe, 1, drawx+hpifw, drawy, hpifxcenlen/hpifw, 1, 0, c_white, 1)
		draw_sprite(spr_menu_status_left_hp_iframe, 2, drawx+hpifw+hpifxcenlen, drawy)
	
		draw_sprite_part(spr_menu_status_left_hp, 0, 0, 0, clamp(hpcenlen, 0, hpifw), hpifh, drawx, drawy-hpifh/2)
		draw_sprite_ext(spr_menu_status_left_hp, 1, drawx+hpifw, drawy, clamp(hpcenlen-hpifw, 0, hpifxcenlen)/hpifw, 1, 0, c_white, 1)
		draw_sprite_part(spr_menu_status_left_hp, 2, 0, 0, clamp(hpcenlen-hpifw-hpifxcenlen, 0, hpifw), hpifh, drawx+hpifw+hpifxcenlen, drawy-hpifh/2)
		//mp
		drawx=dx+128 drawy=dy+816
		var mpifw=sprite_get_width(spr_menu_status_left_mp_iframe),
			mpifh=sprite_get_height(spr_menu_status_left_hp_iframe),
			mpifxcenlen=mpifw*(30*(global.player_mp_up/64))-2*mpifw,
			mpcenlen=mpifw*(30*(global.player_mp/64));
		draw_sprite(spr_menu_status_left_mp_iframe, 0, drawx, drawy)
		draw_sprite_ext(spr_menu_status_left_mp_iframe, 1, drawx+mpifw, drawy, mpifxcenlen/mpifw, 1, 0, c_white, 1)
		draw_sprite(spr_menu_status_left_mp_iframe, 2, drawx+mpifw+mpifxcenlen, drawy)

		draw_sprite_part_ext(spr_menu_status_left_mp, 0, 0, 0, clamp(mpcenlen, 0, mpifw), mpifh, drawx, drawy-mpifh/2, 1, 1, UIPINK, 1)
		draw_sprite_ext(spr_menu_status_left_mp, 1, drawx+mpifw, drawy, clamp(mpcenlen-mpifw, 0, mpifxcenlen)/mpifw, 1, 0, UIPINK, 1)
		draw_sprite_part_ext(spr_menu_status_left_mp, 2, 0, 0, clamp(mpcenlen-mpifw-mpifxcenlen, 0, mpifw), mpifh, drawx+mpifw+mpifxcenlen, drawy-mpifh/2, 1, 1, UIPINK, 1)
		//羁绊
		drawx=dx+464 drawy=dy+936
		var supstr="MAX";
		if global.player_support<100 {
			supstr=string(global.player_support)+"%"
			if global.player_support<10 supstr=" "+supstr;
		}
		scr_draw_text_ext(UIPINK, 1, 0, font_jam_80, 0.5, 0.5, supstr, drawx, drawy, 1, 1, -1, -1, -1, 0)
	}
	#endregion
	#region 右侧
	{
		var txtstruts=global.txt_menu[0].right,
			desctxt="", //下方注释文本
			selectalpha=0.5+0.5*sin(global.fps_curr*pi/30)
		drawx=dx+1248 drawy=dy+592
		draw_sprite(spr_menu_status_right_bgs, 0, drawx, drawy)
		//按钮
		drawx=dx+1248 drawy=dy+592
		for(var i=0;i<array_length(txtstruts.option);i++) {
			var drawx=dx+832,drawy=dy+516+128*(i-1),imy=1
			if i==0 {
				drawy=dy+256
				imy=-1
			}
			draw_sprite_ext(spr_menu_status_right_option, 0, drawx, drawy, 1, imy, 0, c_white, 1)
			//脱出三角
			//if i==3 draw_sprite(spr_menu_status_right_tag, 0, drawx+64, drawy+8)
			//选中
			if msel[0]==i {
				var alpha=selectalpha
				if menu_type>0 alpha=1
				draw_sprite_ext(spr_menu_status_right_option, 1, drawx, drawy, 1, imy, 0, c_white, alpha)
			}
			var txtshfy=8*imy
			if imy==-1 txtshfy=0
			scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, txtstruts.option[i].name, drawx-12, drawy+txtshfy, 1, 1, -1, -1, -1, 0)
		}
		#region 卡片
			drawx=dx+896 drawy=dy+256
			var circuit_blend=c_white
			if msel[0]!=0 circuit_blend=c_gray
			draw_sprite_ext(spr_menu_status_right_circuit_card, 0, drawx, drawy, 1, 1, 0, circuit_blend, 1)
			drawx=dx+816 drawy=dy+384
			draw_sprite(spr_menu_status_right_card_bgs, 0, drawx, drawy)
			if msel[0]==0 && menu_type!=0 {
				for(var i=0;i<global.model_number;i++) {
					var imx=1, imy=1, xof=i*88
					if menu_type==0.1 {
						xof*=1-menutime/15
					} else if menu_type==0.9 {
						xof*=menutime/15
					}
					draw_sprite(spr_menu_status_right_cards, i, drawx+xof, drawy)
				}
				//当前选中
				if menu_type!=0 {
					var imx=1+0.2*(1-menutime/10),
						xof=msel[1]*88
					if menu_type==0.1 {
						xof*=1-menutime/15
					} else if menu_type==0.9 {
						xof*=menutime/15
					}
					draw_sprite_ext(spr_menu_status_right_cards, msel[1], drawx+xof, drawy, imx, imx, 0, c_white, 1)
				}
			} else {
				draw_sprite(spr_menu_status_right_cards, global.model, drawx, drawy)
			}
			//下方文本
			if msel[0]==0 {
				if menu_type==0 {
					if scr_player_change_trim() desctxt=txtstruts.option[msel[0]].desc[0]
					else desctxt=txtstruts.option[msel[0]].desc[1]
				} else {
					if scr_model_isget(msel[1])
						desctxt=txtstruts.option[msel[0]].itemdesc[msel[1]]
					else desctxt=txtstruts.option[msel[0]].desc[2]
				}
			}
		#endregion
		#region 武器
			drawx=dx+912 drawy=dy+512
			var circuit_blend=c_white
			if msel[0]!=1 circuit_blend=c_gray
			draw_sprite_ext(spr_menu_status_right_circuit_weapon, 0, drawx, drawy, 1, 1, 0, circuit_blend, 1)
			drawx=dx+1264 drawy=dy+512
			draw_sprite(spr_menu_status_right_weapon_bgs, 0, drawx, drawy)
			//箭头
			var arrowxof=8*(menutime/10)
			draw_sprite_ext(spr_menu_status_right_weapon_arrow, 0, drawx+arrowxof, drawy, 1, 1, 0, c_white, 1)
			draw_sprite_ext(spr_menu_status_right_weapon_arrow, 0, drawx-arrowxof, drawy, 1, 1, 180, c_white, 1)
			var weap1=-1, weap2=-1
			if global.model==0 {
				weap1=0
			} else {
				weap1=1
				weap2=0
			}
			if global.main_sub_exchange[global.model]==1 {
				var tmp=weap1
				weap1=weap2
				weap2=tmp
			}
			drawx=dx+1168 drawy=dy+512
			if weap1>=0 draw_sprite(spr_menu_status_right_weapons, weap1, drawx, drawy)
			drawx=dx+1360 drawy=dy+512
			if weap2>=0 draw_sprite(spr_menu_status_right_weapons, weap2, drawx, drawy)
			//下方文本
			if msel[0]==1 {
				if obj_staff.player_sub_unuse[global.model] 
					desctxt=txtstruts.option[msel[0]].desc[1]
				else desctxt=txtstruts.option[msel[0]].desc[0]
			}
		#endregion
		#region Rtank
			drawx=dx+896 drawy=dy+640
			var circuit_blend=c_white
			if msel[0]!=2 circuit_blend=c_gray
			draw_sprite_ext(spr_menu_status_right_circuit_rtank, 0, drawx, drawy, 1, 1, 0, circuit_blend, 1)
			drawx=dx+1264 drawy=dy+640
			draw_sprite(spr_menu_status_right_rtank_bgs, 0, drawx, drawy)
			drawx=dx+1232 drawy=dy+640
			var sprval=spr_menu_status_right_rtankval,
				sprvalw=sprite_get_width(sprval),
				sprvalh=sprite_get_height(sprval)
			for(var i=0;i<ds_list_size(global.rtanklist);i++) {
				var inx=global.rtanklist[| i], imx=2.5,
					rate=global.rtank_val[inx]/global.rtank_val_max
				draw_sprite_ext(spr_menu_status_right_rtank, 0, drawx+96*i, drawy, imx, imx, 0, c_white, 1)
				draw_sprite_part_ext(sprval, 0, 0, (1-rate)*sprvalh, sprvalw, rate*sprvalh, drawx+96*i-sprvalw/2*imx, drawy-30+(1-rate)*sprvalh*imx, imx, imx, c_white, 1)
				//选中罐子
				if msel[0]==2
				&& menu_type!=0 
				&& msel[1]==i {
					scr_draw_sprite_white(spr_menu_status_right_rtank, 0, drawx+96*i, drawy, imx, imx, 0, c_white, 0.25+0.25*sin(global.fps_curr*pi/15))
				}
			}
			//下方文本
			if msel[0]==2 {
				if menu_type==0 {
					if global.player_hp>=global.player_hp_up
						desctxt=txtstruts.option[msel[0]].desc[2]
					else if ds_list_size(global.rtanklist)==0
						desctxt=txtstruts.option[msel[0]].desc[1]
					else 
						desctxt=txtstruts.option[msel[0]].desc[0]
				} else {
					var inx=global.rtanklist[| msel[1]],
						val=global.rtank_val[inx]
					desctxt=string_format_vals(txtstruts.option[msel[0]].desc[3], [val])
				}
			}
		#endregion
		#region 紧急脱出
			//下方文本
			if msel[0]==3 {
				desctxt=txtstruts.option[msel[0]].desc[0]
			}
		#endregion
		//下方文本
		drawx=dx+752 drawy=dy+848
		scr_draw_text(c_white, 1, 0, font_puhui_32, 0, 0, desctxt, drawx, drawy, 1, 1, -1, -1, -1, 0)
	}
	#endregion
}
/// @desc 绘制道具页
/// @arg x
/// @arg y
function scr_draw_menu_item(dx, dy){
	var drawx=dx, drawy=dy, page=1, msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	
}
/// @desc 绘制设置页
/// @arg x
/// @arg y
function scr_draw_menu_option(dx, dy){
	var drawx=dx, drawy=dy, page=2, msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	scr_menu_option_draw(dx, dy)
}
/// @desc 绘制任务页
/// @arg x
/// @arg y
function scr_draw_menu_mission(dx, dy){
	var drawx=dx, drawy=dy, page=3, msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	
}
/// @desc 绘制技能页
/// @arg x
/// @arg y
function scr_draw_menu_skill(dx, dy){
	var drawx=dx, drawy=dy, page=4, msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	
}