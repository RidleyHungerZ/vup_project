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
	var tabcenum=sprite_get_number(spr_menu_tab_center),
		tabceinx=scr_image_index_fpscurr(false, 0.25, tabcenum);
	draw_sprite(spr_menu_tab_center, tabceinx, cenx, dy)
	draw_sprite(spr_menu_tab_center_frame, 0, cenx, dy)
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
	var drawx=dx, drawy=dy, page=0, txtstu=global.txt_menu[page], msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	#region 左侧
	{
		draw_sprite(spr_menu_status_left_bgs, 0, dx+368, dy+592)
		//时间金币卡
		drawx=dx+368 drawy=dy+384
		draw_sprite(spr_menu_status_left_timeec_bgs, 0, drawx, drawy)
		drawx=dx+368 drawy=dy+384
		var txtstruts=txtstu.left;
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
		var txtstruts=txtstu.right,
			desctxt="", //下方注释文本
			selectalpha=0.5+0.5*sin(global.fps_curr*pi/30),
			elecspd=0.25;
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
		{
			drawx=dx+896 drawy=dy+256
			var circuit_blend=c_white,
				circuit_index=0;
			if msel[0]!=0 circuit_blend=c_gray
			else { //if menu_type>0 
				var cirnum=sprite_get_number(spr_menu_status_right_circuit_card);
				//circuit_index=(menu_curr[1] mod (cirnum/elecspd))*elecspd
				circuit_index=scr_image_index_fpscurr(false, elecspd, cirnum);
			}
			draw_sprite_ext(spr_menu_status_right_circuit_card, circuit_index, drawx, drawy, 1, 1, 0, circuit_blend, 1)
			drawx=dx+816 drawy=dy+384
			draw_sprite(spr_menu_status_right_card_bgs, 0, drawx, drawy)
			if msel[0]==0 && menu_type!=0 {
				for(var i=0;i<global.model_number;i++) {
					var imx=1, imy=1, xof=i*88, sprinx=i
					if menu_type==0.1 {
						xof*=1-menu_time/15
					} else if menu_type==0.9 {
						xof*=menu_time/15
					}
					//未获得卡片用11帧
					if !scr_model_isget(sprinx) sprinx=11
					draw_sprite(spr_menu_status_right_cards, sprinx, drawx+xof, drawy)
				}
				//当前选中
				if menu_type!=0 {
					var imx=1+0.2*(1-menu_time/10),
						xof=msel[1]*88, 
						sprinx=msel[1]
					if menu_type==0.1 {
						xof*=1-menu_time/15
					} else if menu_type==0.9 {
						xof*=menu_time/15
					}
					//未获得卡片用11帧
					if !scr_model_isget(sprinx) sprinx=11
					draw_sprite_ext(spr_menu_status_right_cards, sprinx, drawx+xof, drawy, imx, imx, 0, c_white, 1)
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
		}
		#endregion
		#region 武器
		{
			drawx=dx+912 drawy=dy+512
			var circuit_blend=c_white,
				circuit_index=0;
			if msel[0]!=1 circuit_blend=c_gray
			else {
				var cirnum=sprite_get_number(spr_menu_status_right_circuit_weapon);
				//circuit_index=(menu_curr[0] mod (cirnum*elecspd))/elecspd
				circuit_index=scr_image_index_fpscurr(false, elecspd, cirnum);
			}
			draw_sprite_ext(spr_menu_status_right_circuit_weapon, circuit_index, drawx, drawy, 1, 1, 0, circuit_blend, 1)
			drawx=dx+1264 drawy=dy+512
			draw_sprite(spr_menu_status_right_weapon_bgs, 0, drawx, drawy)
			//箭头
			var arrowxof=0
			if msel[0]==1 arrowxof=8*(menu_time/10)
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
		}
		#endregion
		#region Rtank
		{
			drawx=dx+896 drawy=dy+640
			var circuit_blend=c_white,
				circuit_index=0;
			if msel[0]!=2 circuit_blend=c_gray
			else { //if menu_type>0
				var cirnum=sprite_get_number(spr_menu_status_right_circuit_rtank);
				//circuit_index=(menu_curr[1] mod (cirnum*elecspd))/elecspd
				circuit_index=scr_image_index_fpscurr(false, elecspd, cirnum);
			}
			draw_sprite_ext(spr_menu_status_right_circuit_rtank, circuit_index, drawx, drawy, 1, 1, 0, circuit_blend, 1)
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
		}
		#endregion
		#region 紧急脱出
		if msel[0]==3 {
			//弹窗
			if menu_type>0 {
				var infoysc=1, _struct=txtstruts.option[msel[0]]
				if menu_type==0.1 infoysc=1-menu_time/15
				else if menu_type==0.9 infoysc=menu_time/15
				drawx=VIEW_W_UI/2 drawy=VIEW_H_UI/2
				draw_sprite_ext(spr_menu_status_right_info, 0, drawx, drawy, 1, infoysc, 0, c_white, 1)
				
				drawx=VIEW_W_UI/2-18*16 drawy=VIEW_H_UI/2-48
				var infotxt=_struct.desc[1]
				if menu_type==1.9 {
					if msel[1]==0 infotxt=_struct.desc[2]
					else if msel[1]==1 infotxt=_struct.desc[3]
				}
				if menu_type>=1 
					scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0.5, infotxt, drawx, drawy, 1, 1, -1, -1, -1, 0)
				//选项
				if between(menu_type, 1, true, 1.5, false) {
					for(var i=0;i<array_length(_struct.itemdesc);i++) {
						var txtx=drawx+48, txty=drawy+56*(i+1)
						scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0.5, _struct.itemdesc[i], txtx, txty, 1, 1, -1, -1, -1, 0)
						//箭头
						if msel[1]==i 
							draw_sprite(spr_ui_grd_talk_point, 0, txtx-16, txty)
					}
				}
			}
			//下方文本
			desctxt=txtstruts.option[msel[0]].desc[0]
		}
		#endregion
		//下方文本
		drawx=dx+752 drawy=dy+848
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0, desctxt, drawx, drawy, 1, 1, -1, -1, -1, 0)
	}
	#endregion
}
/// @desc 绘制道具页
/// @arg x
/// @arg y
function scr_draw_menu_item(dx, dy){
	var drawx=dx, drawy=dy, page=1, txtstu=global.txt_menu[page], msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	var itstruts=txtstu.items,
		itemlist=global.itemlist[msel[0]],
		itemcount=ds_list_size(itemlist),
		itemnowinx=msel[1],
		itemnow=itemlist[| itemnowinx],
		itemnowst=undefined,
		flashaph = 0.5+0.5*sin(global.fps_curr*pi/15);
	if !is_undefined(itemnow)
		itemnowst = itstruts[msel[0]].list[itemnow]
	#region 左侧详情
	drawx=dx+90 drawy=dy+262
	draw_sprite(spr_menu_item_bgs, 0, drawx, drawy)
	//tab
	drawx=dx+271 drawy=dy+260
	for(var i=0;i<array_length(itstruts);i++) {
		var selected = msel[0]==i, 
			tabinx=1,
			txtselup=12;
		if selected tabinx=0
		else txtselup=0
		draw_sprite(spr_menu_item_tab, tabinx, drawx+256*i, drawy)
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, itstruts[i].name, drawx+256*i+8, drawy-16-txtselup, 1, 1, -1, -1, -1, 0)
	}

	//道具图像
	if msel[0]==ITEM.A {
		drawx=dx+480 drawy=dy+512
		if !is_undefined(itemnow)
			draw_sprite_ext(spr_menu_item_icon_a_big, itemnow, drawx, drawy, 1, 1, 0, c_white, 1)
	} else if msel[0]==ITEM.B {
		//蜂窝格子
		drawx=dx+304 drawy=dy+352
		var bytemax=global.item2_byte_max;
		if !is_undefined(itemnowst)
			bytemax+=itemnowst.byte
		var bytemaxgrp = (bytemax div 3), //3个一组，总组数
			bytemaxline = (bytemaxgrp div 4), //4组一行，行数
			byteinx = 0 //记录当前第几个
		for(var line=0;line<=bytemaxline;line++) {
			for(var lgp=0;lgp<4;lgp++) {
				for(var lginx=0;lginx<3;lginx++) {
					if byteinx>=bytemax break;
					var drx=drawx+112*lgp-56*line, 
						dry=drawy+96*line;
					if lginx==1 {
						drx+=56
						dry-=32
					} else if lginx==2 {
						drx+=56
						dry+=32
					}
					//黑底
					if byteinx<global.item2_byte_max 
						draw_sprite(spr_menu_item_hex, 0, drx, dry)
					//已占用格子
					if byteinx<menu_item_byte_sum {
						if menu_type==1
						&& global.item[ITEM.B][itemnow]==ITEMB_STATUS.open 
						&& byteinx>=menu_item_byte_sum-itemnowst.byte {
							draw_sprite_ext(spr_menu_item_hex, 1, drx, dry, 1, 1, 0, c_white, 0.5)
						}
						else draw_sprite(spr_menu_item_hex, 1, drx, dry)
					}
					//待占用格子
					else if menu_type==1 
					&& global.item[ITEM.B][itemnow]==ITEMB_STATUS.close
					&& byteinx<menu_item_byte_sum+itemnowst.byte
						draw_sprite_ext(spr_menu_item_hex, 1, drx, dry, 1, 1, 0, c_white, flashaph)
					byteinx++;
				}
			}
		}
		//计数
		drawx=dx+752 drawy=dy+672
		draw_sprite(spr_menu_item_line, 0, drawx, drawy)
		scr_draw_text(UIPINK, 1, 0, font_jam_80, 1, 0.5, menu_item_byte_sum, drawx, drawy-40, 1, 1, -1, -1, -1, 0)
		scr_draw_text(UIPINK, 1, 0, font_jam_80, 0, 0.5, global.item2_byte_max, drawx, drawy+40, 1, 1, -1, -1, -1, 0)
	} else if msel[0]==ITEM.C {
		drawx=dx+480 drawy=dy+512
		if !is_undefined(itemnow)
			draw_sprite_ext(spr_menu_item_icon_c_big, itemnow, drawx, drawy, 1, 1, 0, c_white, 1)
	}
	//道具说明
	drawx=dx+128 drawy=dy+768
	var desctxt=itstruts[msel[0]].desc
	if menu_type==1 {
		if !is_undefined(itemnowst)
			desctxt = itemnowst.desc
	}
	scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0, desctxt, drawx, drawy, 1, 1, -1, -1, -1, 0)
	#endregion
	#region 右侧列表
	drawx=dx+1368 drawy=dy+232
	var btncol=c_white;
	if menu_type==0 btncol=c_gray
	for(var i=menu_item_list_begin; i<min(menu_item_list_end+1, itemcount); i++) {
		var itinx=itemlist[| i],
			btninx=0, 
			yshift=(i-menu_item_list_begin)*80;
		if i==itemnowinx && menu_type>=1
			btninx=1;
		draw_sprite_ext(spr_menu_item_items, btninx, drawx, drawy+yshift, 1, 1, 0, btncol, 1)
		scr_draw_text_ext(btncol, 1, 0, font_puhui_32, 0, 0.5, itstruts[msel[0]].list[itinx].name, drawx-192, drawy+yshift+4, 1, 1, -1, -1, -1, 0)
		if msel[0]==ITEM.B {
			//scr_draw_text_ext(btncol, 1, 0, font_puhui_32, 0, 0.5, "["+string(itstruts[msel[0]].list[itinx].byte)+"]", drawx-224, drawy+yshift+8, 1, 1, -1, -1, -1, 0)
			if global.item[ITEM.B][itinx]==ITEMB_STATUS.open
				scr_draw_text_ext(btncol, 1, 0, font_puhui_32, 0, 0.5, itstruts[msel[0]].tag, drawx-272, drawy+yshift+4, 1, 1, -1, -1, -1, 0)
		} else if msel[0]==ITEM.C {
			scr_draw_text_ext(btncol, 1, 0, font_puhui_32, 0, 0.5, "[x"+string(global.item[ITEM.C][itemnow])+"]", drawx-272, drawy+yshift, 1, 1, -1, -1, -1, 0)
		}
	}
	//滚动条
	drawx=dx+1792 drawy=dy+204
	if itemcount>menu_item_list_max {
		scr_draw_menu_scroll(drawx, drawy, 1, 49, itemnowinx, menu_item_list_begin, menu_item_list_max, itemcount, btncol, 1)
	}
	#endregion
}
/// @desc 绘制设置页
/// @arg x
/// @arg y
function scr_draw_menu_option(dx, dy){
	var drawx=dx, drawy=dy, page=2, txtstu=global.txt_menu[page], msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	scr_menu_option_draw(dx, dy)
}
/// @desc 绘制任务页
/// @arg x
/// @arg y
function scr_draw_menu_mission(dx, dy){
	var drawx=dx, drawy=dy, page=3, txtstu=global.txt_menu[page], msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	var missstruts=[txtstu.main, txtstu.sub],
		misslist=global.mission_list[msel[0]],
		misscount=ds_list_size(misslist),
		missnowinx=msel[1],
		missnow=misslist[| missnowinx],
		flashaph = 0.5+0.5*sin(global.fps_curr*pi/15);
	#region 左侧详情
	drawx=dx+90 drawy=dy+262
	draw_sprite(spr_menu_mission_bgs, 0, drawx, drawy)
	//tab
	drawx=dx+528 drawy=dy+263
	for(var i=0;i<2;i++) {
		var selected = msel[0]==i, 
			tabinx=1,
			txtselup=12;
		if selected tabinx=0
		else txtselup=0
		draw_sprite(spr_menu_mission_tab, tabinx, drawx+256*i, drawy)
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, missstruts[i].name, drawx+256*i+8, drawy-12-txtselup, 1, 1, -1, -1, -1, 0)
	}
	//任务说明
	if !is_undefined(missnow) {
		var missnowst = missstruts[msel[0]].list[missnow],
			desctxt = missnowst.desc,
			reward = missnowst.reward,
			stmodel = txtstu.status,
			rwmodel = txtstu.reward,
			rewardtxt = rwmodel.desc,
			itemst = global.txt_menu[1].items;
		//任务详情
		drawx=dx+160 drawy=dy+304
		var statuscol="ffffff",
			missnowstatus=global.mission[msel[0]][missnow]
		if missnowstatus==MISSION_STATIS.unstart statuscol="ffffff"
		else if missnowstatus==MISSION_STATIS.inProcess statuscol="fff200"
		else if missnowstatus==MISSION_STATIS.waitReport statuscol="FB8E19"
		else if missnowstatus==MISSION_STATIS.complete statuscol="00a651"
		desctxt = stmodel.desc + "[$="+statuscol+"]" + stmodel.list[missnowstatus] + "[$=ffffff]\n" + desctxt
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0, desctxt, drawx, drawy, 1, 1, -1, -1, -1, 0)
		//任务报酬
		drawx=dx+160 drawy=dy+768
		//rewardtxt = rewardtxt + "\n"
		//if reward.es>0 {
		//	rewardtxt += rwmodel.es + string(reward.es) + "\n"
		//}
		//for(var i=0;i<array_length(reward.item);i++){
		//	var ri = reward.item[i]
		//	rewardtxt += rwmodel.item[ri[0]] + itemst[ri[0]].list[ri[1]].name + "\n"
		//}
		//scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0, rewardtxt, drawx, drawy, 1, 1, -1, -1, -1, 0)
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0.5, rewardtxt, drawx, drawy, 1, 1, -1, -1, -1, 0)
		//ES
		drawx=dx+544 drawy=dy+768
		draw_sprite(spr_menu_mission_item_es, 0, drawx, drawy)
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0.5, rwmodel.es + string(reward.es), drawx+48, drawy, 1, 1, -1, -1, -1, 0)
		//道具
		drawx=dx+160 drawy=dy+848
		for(var i=0;i<array_length(reward.item);i++){
			var ri = reward.item[i],
				ispr = spr_menu_mission_item_es,
				iinx = ri[1],
				shifx = (i mod 2)*384,
				shify = (i div 2)*80;
			if ri[0]==ITEM.A ispr=spr_menu_mission_item_a_small
			else if ri[0]==ITEM.C ispr=spr_menu_mission_item_c_small
			else if ri[0]==ITEM.B {
				ispr=spr_menu_mission_item_formula
			}
			draw_sprite(ispr, ri[1], drawx+shifx, drawy+shify)
			scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0.5, itemst[ri[0]].list[ri[1]].name, drawx+48+shifx, drawy+shify, 1, 1, -1, -1, -1, 0)
		}
	}
	#endregion
	#region 右侧列表
	drawx=dx+1368 drawy=dy+232
	var btncol=c_white;
	if menu_type==0 btncol=c_gray
	for(var i=menu_miss_list_begin; i<min(menu_miss_list_end+1, misscount); i++) {
		var itinx=misslist[| i],
			btninx=0, 
			yshift=(i-menu_miss_list_begin)*80,
			statuscol=c_white;
		if i==missnowinx && menu_type>=1
			btninx=1;
		draw_sprite_ext(spr_menu_mission_items, btninx, drawx, drawy+yshift, 1, 1, 0, btncol, 1)
		var missst = global.mission[msel[0]][itinx]
		if missst==MISSION_STATIS.unstart statuscol=c_white
		else if missst==MISSION_STATIS.inProcess statuscol=c_yellow
		else if missst==MISSION_STATIS.waitReport statuscol=c_orange
		else if missst==MISSION_STATIS.complete statuscol=c_green
		statuscol=color_blend(statuscol, btncol)
		scr_draw_text_ext(statuscol, 1, 0, font_puhui_32, 0, 0.5, missstruts[msel[0]].list[itinx].name, drawx-192, drawy+yshift+4, 1, 1, -1, -1, -1, 0)
	}
	//滚动条
	drawx=dx+1792 drawy=dy+204
	if misscount>menu_miss_list_max {
		scr_draw_menu_scroll(drawx, drawy, 1, 49, missnowinx, menu_miss_list_begin, menu_miss_list_max, misscount, btncol, 1)
	}
	#endregion
}
/// @desc 绘制技能页
/// @arg x
/// @arg y
function scr_draw_menu_skill(dx, dy){
	var drawx=dx, drawy=dy, page=4, txtstu=global.txt_menu[page], msel=menu_select[page]
	scr_draw_menu_tab(dx, dy, page)
	var skstruts=txtstu.skills,
		skillcount=ds_list_size(menu_skill_list),
		skillnowinx=msel[0],
		skillnow=menu_skill_list[| skillnowinx];
	#region 左侧详情
	drawx=dx+96 drawy=dy+208
	draw_sprite(spr_menu_skill_bgs, 0, drawx, drawy)
	//动作图像
	drawx=dx+496 drawy=dy+400
	scr_draw_menu_skill_image(skillnow.index, drawx, drawy, 2)
	//技能说明
	drawx=dx+128 drawy=dy+608
	scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0, 0, skillnow.desc, drawx, drawy, 1, 1, -1, -1, -1, 0)
	#endregion
	#region 右侧列表
	drawx=dx+1368 drawy=dy+232
	for(var i=menu_skill_list_begin; i<min(menu_skill_list_end+1, skillcount); i++) {
		var btninx=0, yshift=(i-menu_skill_list_begin)*80;
		if i==skillnowinx btninx=1;
		draw_sprite(spr_menu_skill_items, btninx, drawx, drawy+yshift)
		scr_draw_text_ext(c_white, 1, 0, font_puhui_32, 0.5, 0.5, menu_skill_list[| i].txt, drawx, drawy+yshift+4, 1, 1, -1, -1, -1, 0)
	}
	//滚动条
	drawx=dx+1792 drawy=dy+204
	if skillcount>menu_skill_list_max {
		scr_draw_menu_scroll(drawx, drawy, 1, 49, skillnowinx, menu_skill_list_begin, menu_skill_list_max, skillcount, c_white, 1)
	}
	#endregion
}
/// @desc 绘制技能详情
/// @arg x
/// @arg y
/// @arg skinx
function scr_draw_menu_skill_image(skinx, dx, dy, scl) {
	var inx=0
	#region 人形
	if global.model==PLAYER_MODEL.HU {
		#region 爬行
		if skinx==(inx++) {
			draw_sprite_ext(spr_ground_all, 0, dx-48*scl, dy-64*scl, 6*scl, 3*scl, 0, c_white, 1)
			draw_sprite_ext(spr_ground_all, 0, dx-48*scl, dy+32*scl, 6*scl, 3*scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_hu_creeping, 0, dx, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 射击
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_hu_idle_shoot, 0, dx-48*scl, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_hu_bullet01, 0, dx+16*scl, dy-16*scl, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_hu_bullet01, 0, dx+64*scl, dy-16*scl, scl, scl, 0, c_white, 1)
		}
		#endregion
	} 
	#endregion
	#region 装甲
	else {
		#region 冲刺
		if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_dash, 2, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_dash_boost, 3, dx-16*scl, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 踢墙跳
		else if skinx==(inx++) {
			draw_sprite_ext(spr_ground_all, 0, dx+16*scl, dy-64*scl, 4*scl, 8*scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_crawjump, 1, dx-16*scl, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 速降飞踢
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_kick_down, 1, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_dash_boost, 3, dx, dy-32*scl, scl, scl, 270, c_white, 1)
		}
		#endregion
		#region 斜下飞踢
		if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_kick_below, 1, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_dash_boost, 3, dx-32*scl, dy-32*scl, scl, scl, 315, c_white, 1)
		}
		#endregion
		#region 斩击
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_idle_chop1_part, 1, dx-32*scl, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_idle_chop1, 1, dx-32*scl, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_idle_chop1_saber, 1, dx-32*scl, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 蓄力斩
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_idle_chop_charge_part, 4, dx-32*scl, dy+32*scl, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_idle_chop_charge, 4, dx-32*scl, dy+32*scl, scl, scl, 0, c_white, 1)
			var saberele=scr_player_saber_element()
			if saberele==ELEMENTS.none
				draw_sprite_ext(spr_player_armor_idle_chop_charge_saber, 4, dx-32*scl, dy+32*scl, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.fire
				draw_sprite_ext(spr_player_armor_idle_chop_charge_saber_fire, 4, dx-32*scl, dy+32*scl, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.ice
				draw_sprite_ext(spr_player_armor_idle_chop_charge_saber_ice, 4, dx-32*scl, dy+32*scl, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.elec
				draw_sprite_ext(spr_player_armor_idle_chop_charge_saber_elec, 4, dx-32*scl, dy+32*scl, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 回旋斩
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_fall_spin_chop_part, 2, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_fall_spin_chop, 2, dx, dy, scl, scl, 0, c_white, 1)
			var saberele=scr_player_saber_element()
			if saberele==ELEMENTS.none
				draw_sprite_ext(spr_player_armor_fall_spin_chop_saber, 2, dx, dy, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.fire
				draw_sprite_ext(spr_player_armor_fall_spin_chop_saber_fire, 2, dx, dy, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.ice
				draw_sprite_ext(spr_player_armor_fall_spin_chop_saber_ice, 2, dx, dy, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.elec
				draw_sprite_ext(spr_player_armor_fall_spin_chop_saber_elec, 2, dx, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 射击
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_idle_shoot, 0, dx-48*scl, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_bullet01, 0, dx+16*scl, dy-16*scl, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_bullet01, 0, dx+64*scl, dy-16*scl, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 一段蓄力射击
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_idle_shoot, 0, dx-48*scl, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_bullet_charge01, 0, dx+64*scl, dy-16*scl, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 二段蓄力射击
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_idle_shoot, 0, dx-48*scl, dy, scl, scl, 0, c_white, 1)
			var saberele=scr_player_saber_element()
			if saberele==ELEMENTS.none
				draw_sprite_ext(spr_player_armor_bullet_charge02, 0, dx+64*scl, dy-16*scl, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.fire
				draw_sprite_ext(spr_player_armor_bullet_charge02_fire, 2, dx+64*scl, dy-16*scl, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.ice
				draw_sprite_ext(spr_player_armor_bullet_charge02_ice, 2, dx+64*scl, dy-16*scl, scl, scl, 0, c_white, 1)
			else if saberele==ELEMENTS.elec
				draw_sprite_ext(spr_player_armor_bullet_charge02_elec, 2, dx+64*scl, dy-16*scl, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 冰霜六星
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_idle_shoot, 0, dx, dy, scl, scl, 0, c_white, 1)
			for(var i=0;i<6;i++) {
				var len=48*scl,
					dir=60*i,
					icx=lengthdir_x(len, dir),
					icy=lengthdir_y(len, dir);
				draw_sprite_ext(spr_player_armor_bullet_ice_cone, 0, dx+icx, dy+icy, scl, scl, dir, c_white, 1)
			}
		}
		#endregion
		#region 镭射光线
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_idle_shoot, 0, dx-48*scl, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_bullet_elec_laser_ball, 1, dx+32*scl, dy-16*scl, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_bullet_elec_laser_top, 1, dx+32*scl, dy-16*scl, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_bullet_elec_laser_line, 1, dx+(32+64)*scl, dy-16*scl, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 二段跳
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_jump_double, 1, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_dash_boost, 3, dx, dy+16*scl, scl, scl, 90, c_white, 1)
		}
		#endregion
		#region 空中冲刺
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_dash, 2, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_dash_boost, 3, dx-16*scl, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 滑翔
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_glide, 2, dx, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 升龙斩
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_fly_choping_part, 0, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_fly_choping, 0, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_fly_choping_saber, 0, dx, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
		#region 升龙斩
		else if skinx==(inx++) {
			draw_sprite_ext(spr_player_armor_fly_choping_part, 0, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_fly_choping, 0, dx, dy, scl, scl, 0, c_white, 1)
			draw_sprite_ext(spr_player_armor_fly_choping_saber_fire, 0, dx, dy, scl, scl, 0, c_white, 1)
		}
		#endregion
	}
	#endregion
}