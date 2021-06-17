updateMask()
if(!scr_player_stop_trem()) exit;
var ox=x,oy=y, mask_type=getMaskType();
//使用mask替代碰撞盒检测地面
if mask_type==PYMASK_TYPE.dash
	mask_index=spr_player_mask_idle
var hspdmit=1; //横向移动速度倍率
//缓慢状态下，移动速度降低25%
if scr_player_debuff_is(DEBUFF.slow) spdmit=(1-0.25);
#region 飓风吹飞
//滑翔才受影响
var //windlist = ds_list_create(),
	windcount = instance_place_list(x, y, obj_wind, windlist, false),
	nowind = true;
// 接触到风
if(windcount>0) {
	for(var i=0;i<windcount;i++) {
		var wind = windlist[| i];
		if(wind.can_wind && wind.wind_speed!=0) {
			nowind=false;
			//有纵方向分量 & 有风速
			if(sin(wind.wind_direct)!=0 && wind.wind_speed!=0 && jump==8) {
			    //wind_up=1;
				var wvsp=lengthdir_y(wind.wind_speed, wind.wind_direct);
			    A_up=G+(1/4)*G*-wvsp;
			} else {
				A_up=0;
			}
			//有横方向分量 & 有风速
			if(cos(wind.wind_direct)!=0 && wind.wind_speed!=0) {
			    //wind_up=1;
				wind_spd=lengthdir_x(wind.wind_speed, wind.wind_direct);
			} else {
				//wind_spd=0;
			}
		}
	}
}
if(nowind) {
    A_up=0;
	//wind_spd=0; //风速为0放在绘制开始
    //wind_up=0;
}
ds_list_clear(windlist)
//重力
grav=G-A_up;
#endregion
#region 传送带
if(instance_exists(obj_trans)) {
	var tran=collision_rectangle(bbox_right,bbox_bottom,bbox_left,bbox_top,obj_trans,1,1);
	if(tran && jump==0) 
		wind_spd=tran.trans_hsp;
	else wind_spd=0;
}
#endregion
#region 冰滑管理
if scr_player_ice()
&& jump==0 && ice_free==0
//钉鞋同时抵制冰滑和油滑
//&& !scr_itemb_isrun(ITEMB_STATUS.anti_ice)
//L可以抵御冰滑，但不能抵御油滑
//&& !(object_index==obj_player_lz))
	ice=1;
else{
	v_ice=abs(dis_x);
	ice=0;
}
if(ice==1 && jump==0) {
	if(hsp>0) {
		if(dis_x*image_xscale<0) 
			v_ice-=f_ice;
		else if(dis_x==0) 
			v_ice=f_ice;
		else if(dis_x*image_xscale>0) {
			if(abs(dis_x)<=abs(hsp*hspdmit*image_xscale+wind_spd)) 
				v_ice+=f_ice;
			else
				v_ice-=f_ice;
		}
	}
	else if(hsp==0) {
		if(v_ice>0) 
			v_ice-=f_ice;
		else
			v_ice=0;
	}
	else if(hsp<0) 
		v_ice=hsp;
}
#endregion
#region 移动管理
#region 纵向移动
if(jump!=0) {
	var fall=false,jumpup=false;
	#region 下降中
	if(in(jump, [PYJUMP.fall, PYJUMP.craw, PYJUMP.glide, PYJUMP.kick])
	||(in(jump, [-1]) && vsp>0)) {
		fall=true;
		/*if(!place_meeting(x,y+0.25*image_yscale*sign(vsp),obj_ground)
		&&!((image_yscale=1 && collision_rectangle(bbox_right,bbox_bottom+1,bbox_left,bbox_bottom,obj_floor,1,1) && !collision_rectangle(bbox_right,bbox_bottom,bbox_left,bbox_bottom-1,obj_floor,1,1))
		|| (image_yscale=-1 && collision_rectangle(bbox_right,bbox_top,bbox_left,bbox_top-1,obj_floor,1,1) && !collision_rectangle(bbox_right,bbox_top+1,bbox_left,bbox_top,obj_floor,1,1)))
		&& !place_meeting(x,y,obj_sink)) 
			y+=0.25*image_yscale*sign(vsp)*V;*/
		var flordown = collision_rectangle(bbox_right,bbox_bottom+GRDY+vsp+1,bbox_left,bbox_bottom+GRDY,obj_floor,1,1);
		if(scr_player_floordown_exists(flordown)) flordown=noone;
		if(!place_meeting(x,y+GRDY+vsp+1,obj_ground)
		&& !place_meeting(x,y+GRDY+4,obj_sink)
	    &&!(flordown && !collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-1,obj_floor,1,1))){
	        y+=vsp*V;
		} else {
	        y=floor(y);
			flordown = collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY,obj_floor,1,1);
			if(scr_player_floordown_exists(flordown)) flordown=noone;
	        while(!place_meeting(x,y+GRDY+1,obj_ground)
			&& !place_meeting(x,y+GRDY,obj_sink)
	        && !flordown) {
				y+=1;
				flordown = collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom+GRDY,obj_floor,1,1);
				if(scr_player_floordown_exists(flordown)) flordown=noone;
			}
		}
    }
	#endregion
	#region 上升中
	else {
		jumpup=true;
		if !place_meeting(x,y+vsp-image_yscale,obj_ground)
			y+=vsp*V;
		else{
			y=ceil(y);
			while(!place_meeting(x,y-image_yscale,obj_ground)) 
				y-=1*V;
		}
	}
	#endregion
	#region 重力作用
	if(jump!=PYJUMP.craw //滑墙
	&& jump!=PYJUMP.ladding //爬梯子
	&& jump!=PYJUMP.glide //悬浮
	&& jump!=PYJUMP.airdash //空冲
	&& jump!=PYJUMP.airDashChop //空冲砍
	&& jump!=PYJUMP.kick //斜下踢
	&& jump!=PYJUMP.cliffProtect //悬崖漂浮
	&& jump!=PYJUMP.catched //被抓住
	&& !(jump==-1 && injure_ingrd))//受伤且在地面上
	{
		if(vsp<vspmaxrate*grav*sign(grav)) 
				vsp+=grav;
			else
				vsp=vspmaxrate*grav;
	}
	#endregion
}
else vsp=0;
#endregion
#region 横向移动
if(hsp!=0 ||wind_spd!=0
||(ice==1 && v_ice!=0)) {
	if((jump==0 
	||(jump>0 && w_j==1)
	|| jump==-1
	|| wind_spd!=0)
	&& !in(jump, [PYJUMP.craw, PYJUMP.ladding])){
		var hhh;
		if(jump<=0) {
			var pe_wind=wind_spd; //暂存风速
			//if(scr_itemb_isrun(ITEMB_STATUS.anti_wind)
			//&& !place_meeting(x,y,obj_trans)) {
			if !place_meeting(x,y,obj_trans) {
				if((ice==0)||(ice==1 && v_ice==0)) {
					if(abs(wind_spd)<3) wind_spd=0;
					else wind_spd=1*sign(wind_spd);
				}
			}
			if(ice==0) {
				hhh=hsp*hspdmit*image_xscale+wind_spd;
			} else if(ice==1) {
				if(dis_x!=0) 
					hhh=(v_ice*sign(dis_x)+wind_spd)/h_ice;
				else
					hhh=(v_ice*image_xscale+wind_spd)/h_ice;
			}
			wind_spd=pe_wind; //恢复风速
		}
		else
			hhh=hsp*hspdmit*image_xscale*w_j+wind_spd;
		var dright=((sign(hhh)==1)?1:0),dleft=((sign(hhh)==-1)?-1:0);
		#region 地面或L潜水
		if(in(jump, [0])
		|| (jump==-1 && injure_ingrd)) {
			repeat(round(4*abs(hhh))){
				//var dashbox=(walk==2||walk==5)*8,dleft=dashbox*(image_xscale==-1)*-1,dright=dashbox*(image_xscale==1)*1;//冲刺的多余部分
				if(!(collision_rectangle(bbox_right+dright,bbox_bottom+GRDY-4,bbox_left+dleft,bbox_top,obj_ground,1,1) && image_yscale==1)
				&&!(collision_rectangle(bbox_right+dright,bbox_bottom,bbox_left+dleft,bbox_top-GRDY+4,obj_ground,1,1) && image_yscale==-1)) {
					if(ice==0) 
						x+=0.25*H*sign(hhh);
					else if(ice==1) 
						x+=0.25*H*sign(hhh)*h_ice;
				} else x=round(x)
				//斜坡上坡
				if(image_yscale==1) {
					while(collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_ground,1,1)
						&&!collision_rectangle(bbox_right,bbox_bottom+GRDY-4,bbox_left,bbox_top+8,obj_ground,1,1))
						y-=image_yscale;
					
					while(collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_floor,1,1)
						&&!collision_rectangle(bbox_right,bbox_bottom+GRDY-4,bbox_left,bbox_bottom+GRDY-8,obj_floor,1,1))
						y-=image_yscale;
				}
				else if(image_yscale==-1) {
					while(collision_rectangle(bbox_right,bbox_top-GRDY,bbox_left,bbox_top-GRDY+4,obj_ground,1,1)
						&&!collision_rectangle(bbox_right,bbox_top-GRDY+4,bbox_left,bbox_bottom-8,obj_ground,1,1))
						y-=image_yscale;
					
					while(collision_rectangle(bbox_right,bbox_top-GRDY+4,bbox_left,bbox_top-GRDY,obj_floor,1,1)
						&&!collision_rectangle(bbox_right,bbox_top-GRDY+8,bbox_left,bbox_top-GRDY+4,obj_floor,1,1))
						y-=image_yscale;
				}
				//斜坡下坡
				if(jump<=0) {
					for(var i=2;i>=1;i-=1){
						if(place_meeting(x,y+(1+i+GRDY)*image_yscale,obj_ground)
						&&!place_meeting(x,y+(0+i+GRDY)*image_yscale,obj_ground)) 
							y+=image_yscale;
					
						if(collision_rectangle(bbox_right,bbox_bottom+GRDY+(1+i),bbox_left,bbox_bottom+GRDY,obj_floor,1,1)
						&&!collision_rectangle(bbox_right,bbox_bottom+GRDY+(0+i),bbox_left,bbox_bottom+GRDY-4,obj_floor,1,1)
						&& image_yscale==1) 
							y+=image_yscale;
					
						if(collision_rectangle(bbox_right,bbox_top-GRDY,bbox_left,bbox_top-GRDY-(1+i),obj_floor,1,1)
						&&!collision_rectangle(bbox_right,bbox_top-GRDY+4,bbox_left,bbox_top-GRDY-(0+i),obj_floor,1,1)
						&& image_yscale==-1) 
							y+=image_yscale;
					}
				}
			}
		}
		#endregion
		#region 空中
		else if(abs(H*hhh)>0) {
			var xs=H*hhh,xsg=xs;
			xsg=ceil(abs(xsg))*sign(xsg);
			var precoll=collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_top,obj_ground,1,1);
			var flordown = collision_rectangle(bbox_right+xsg,bbox_bottom+GRDY+1,bbox_left+xsg,bbox_bottom+GRDY,obj_floor,1,1);
			if(scr_player_floordown_exists(flordown)) flordown=noone;
			if(!collision_rectangle(bbox_right+xsg, bbox_bottom+GRDY, bbox_left+xsg, bbox_top, obj_ground, 1, 1)
			&& !(flordown && !collision_rectangle(bbox_right+xsg,bbox_bottom+GRDY,bbox_left+xsg,bbox_bottom+GRDY-1,obj_floor,1,1)))
				x+=xs;
			else{
				flordown = collision_rectangle(bbox_right+xsg,bbox_bottom+GRDY+1,bbox_left+xsg,bbox_bottom+GRDY,obj_floor,1,1);
				if(scr_player_floordown_exists(flordown)) flordown=noone;
				while((!collision_rectangle(bbox_right+sign(xs), bbox_bottom+GRDY, bbox_left+sign(xs),  bbox_top, obj_ground, 1, 1) 
					 && collision_rectangle(bbox_right+xsg,		 bbox_bottom+GRDY, bbox_left+xsg,		bbox_top, obj_ground, 1, 1))
					||(!collision_rectangle(bbox_right+sign(xs),bbox_bottom+GRDY+1,bbox_left+sign(xs),bbox_bottom+GRDY,obj_floor,1,1) && flordown
						&& !collision_rectangle(bbox_right+sign(xs), bbox_bottom+GRDY, bbox_left+sign(xs), bbox_top, obj_ground, 1, 1))) {
						x+=sign(xs);
					flordown = collision_rectangle(bbox_right+xsg,bbox_bottom+GRDY+1,bbox_left+xsg,bbox_bottom+GRDY,obj_floor,1,1);
					if(scr_player_floordown_exists(flordown)) flordown=noone;
				}
			}
			//如果是因为移动造成卡在墙里，就立刻拉出来
			while(!precoll && collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_top,obj_ground,1,1)) 
				x-=sign(xs);
			//斜坡
			if(image_yscale==1) {
				while(collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_ground,1,1)
					&&!collision_rectangle(bbox_right,bbox_bottom+GRDY-4,bbox_left,bbox_top+8,obj_ground,1,1)) 
					y-=image_yscale;
					
				flordown = collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_floor,1,1);
				if(scr_player_floordown_exists(flordown)) flordown=noone;
				while(flordown
					&&!collision_rectangle(bbox_right,bbox_bottom+GRDY-4,bbox_left,bbox_bottom+GRDY-8,obj_floor,1,1)) {
					y-=image_yscale;
					flordown = collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-4,obj_floor,1,1);
					if(scr_player_floordown_exists(flordown)) flordown=noone;
				}
			}
			else if(image_yscale==-1) {
				while(collision_rectangle(bbox_right,bbox_top-GRDY,bbox_left,bbox_top-GRDY+4,obj_ground,1,1)
					&&!collision_rectangle(bbox_right,bbox_top-GRDY+4,bbox_left,bbox_bottom-8,obj_ground,1,1)) 
					y-=image_yscale;
					
				flordown = collision_rectangle(bbox_right,bbox_top-GRDY+4,bbox_left,bbox_top-GRDY,obj_floor,1,1);
				if(scr_player_floordown_exists(flordown)) flordown=noone;
				while(flordown
					&&!collision_rectangle(bbox_right,bbox_top-GRDY+8,bbox_left,bbox_top-GRDY+4,obj_floor,1,1)) {
					y-=image_yscale;
					flordown = collision_rectangle(bbox_right,bbox_top-GRDY+4,bbox_left,bbox_top-GRDY,obj_floor,1,1);
					if(scr_player_floordown_exists(flordown)) flordown=noone;
				}
			}
		}
		#endregion
	}
}
#endregion
#endregion
#region 水域管理&重定义H和V
V=1;
var instwater = collision_rectangle(bbox_right, bbox_top+16, bbox_left, bbox_top, obj_water, 1, 1);
if(instwater) {
	water=1;
	G=G_liq;
	//粘液
	if(instwater.mucus) {
		//cspd=1;
		if(water_free==0) 
			H=0.4;
		else if(water_free==1) 
			H=0.5;
		if(vsp<0) V=0.5;
		else V=1;
	} else {
		//cspd=1;
		if(water_free==0) 
			H=0.8;
		else if(water_free==1) 
			H=1;
	}
	//水下声音
	if(underwater==0
	&&!place_meeting(x,y,obj_water_top)) {
		underwater=1;
		scr_sound_loop(se_player_underwater);
	}
	if(underwater==1
	&& place_meeting(x,y,obj_water_top)) {
		underwater=0;
		scr_sound_stop(se_player_underwater);
	}
	//呼吸泡
	if(global.fps_currmenu mod 90 == 0) {
		with(instance_create_depth(x+8*image_xscale, y-16*image_yscale, depth-1, obj_water_bubble)) {
			breathe = true;
		}
	}
}
else{
	water=0;
	G=G_noliq;
	H=1;
	V=1;
	//cspd=1.5;
	underwater=0;
	scr_sound_stop(se_player_underwater);
}
//出入水水花
if scr_menu_trem() {
	if(waterboost==0) {
		var waterup=instance_place(x, y, obj_water_top);
		if(waterup) {
			waterboost=1;
			scr_sound_play(se_player_water);
			var waterf = instance_create_depth(x,waterup.bbox_top,depth-1,obj_animation_once),
				waterf2 = instance_create_depth(x,waterup.bbox_top,depth-1,obj_waterf2);
			with waterf{
				scr_sprite_change(waterup.SS_waterf, 0, 0.25)
				image_alpha=waterup.inst_waterf_alpha;
			}
			with waterf2{
				scr_sprite_change(waterup.SS_waterf2, 0, 0.25)
				image_alpha=waterup.inst_waterf_alpha;
			}
		}
	}
	else if(!place_meeting(x,y,obj_water_top)) 
		waterboost=0;
}
	
//buff减速
/*if(scr_player_debuff_is(DEBUFF.ice)) {
	H*=0.5;
	V*=0.75;
}*/
#endregion
#region 爬墙芯片
//if(scr_itemb_isrun(ITEMB_STATUS.rough)
//&&!(jump==3 
//	&& ((keystate_check(global.down_state) && image_yscale==1) 
//	 || (keystate_check(global.up_state) && image_yscale==-1)))) {
//	if(scr_itemb_isrun(ITEMB_STATUS.lighter)) {
//		if(scr_itemb_isrun(ITEMB_STATUS.elf_child)) {
//			if(water==0)		cspd=0;
//			else if(water==1)	cspd=0;
//		} else {
//			if(water==0)		cspd=0.5;
//			else if(water==1)	cspd=0;
//		}
//	} else {
//		if(water==0)		cspd=1;
//		else if(water==1)	cspd=0.5;
//	}
//}
//else{
	if(water==0)		cspd=1.5;
	else if(water==1)	cspd=1;
//}
#endregion
#region 沉陷地形
if((collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_top,obj_sink,1,1)
&&!collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_top,obj_ground,1,1)
&&!collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_top,obj_floor,1,1)
)//&&!(scr_itemb_isrun(ITEMB_STATUS.lighter) /*|| global.model=PLAYER_MODEL.Hz*/))
|| place_meeting(x,y+GRDY,obj_sink)) {
	if(abs(hsp)>1) 
		hsp=hsp/abs(hsp);
	if(jump==11 || jump==13) {
		scr_sprite_change(SS_fallover,0,0.25);
		walk=0;
		jump=0;
		hsp=0;
		vsp=0;
	}
	if jump<=0
	//&& !(scr_itemb_isrun(ITEMB_STATUS.lighter) /*|| global.model=PLAYER_MODEL.Hz*/)) {
		if(!place_meeting(x,y+GRDY+1,obj_ground)
		&& !collision_rectangle(bbox_right,bbox_bottom+GRDY+1,bbox_left,bbox_bottom,obj_floor,1,1)
		&& global.player_operate==1) 
			y+=12/60;
	//}
}
#endregion
var dx=x-ox,dy=y-oy;
#region 出镜头
x = clamp(x, 8, room_width-8);
//上爬无效，下爬无效
var topwall=collision_rectangle(bbox_right,1,bbox_left,0,obj_ground,1,1),
	bottomwall=collision_rectangle(bbox_right,room_height,bbox_left,room_height-1,obj_ground,1,1);
if(instance_exists(topwall) && obj_player.bbox_bottom<=0) {
	if(!topwall.fly) {
		while(topwall) {
			if(dx!=0) x-=sign(dx);
			else if(dx==0) {
				if(bbox_left<=topwall.bbox_right && bbox_right>topwall.bbox_right) 
					x++;
				else if(bbox_right>=topwall.bbox_left && bbox_left<topwall.bbox_left) 
					x--;
				else x-=image_xscale;
			}
			topwall=collision_rectangle(bbox_right,1,bbox_left,0,obj_ground,1,1);
		}
	}
}
if(instance_exists(bottomwall) && obj_player.bbox_top>=room_height) {
	if(!bottomwall.fly) {
		while(bottomwall) {
			if(dx!=0) x-=sign(dx);
			else if(dx==0) {
				if(bbox_left<=bottomwall.bbox_right && bbox_right>bottomwall.bbox_right) 
					x++;
				else if(bbox_right>=bottomwall.bbox_left && bbox_left<bottomwall.bbox_left) 
					x--;
				else x-=image_xscale;
			}
			bottomwall=collision_rectangle(bbox_right,room_height,bbox_left,room_height-1,obj_ground,1,1);
		}
	}
}
//掉下悬崖
if(obj_player.y>global.room_yb+24) {
	if(scr_mode_Is_easy()
	&& global.player_hp>4
	&& !cliff_protect
	&& global.player_operate==1) {
		scr_player_hp_subtract(4);
		jump=PYJUMP.cliffProtect;
		hsp=0;
		vsp=0;
		dash=0;
		w_j=1;
		obj_player.y=global.room_yb+24;
		cliff_protect=true;
		cliff_protect_time=60*5;
		uninjure=5;
		injure_element=ELEMENTS.none;
		scr_sprite_change(SS_fall,7,0.5);
		//scr_player_EB_close();
		//清空半透板记录
		scr_player_floordown_clear();
	}
	//落入悬崖死亡
	else{
		global.player_hp=0;
		//scr_sound_play(SE_death);
		obj_player.y=global.room_yb+48;
		death_cliff=true;
	}
}
//刷新保护
if(in(jump, [0, 3, 5, 14])) 
	cliff_protect=false;
#endregion
updateMask()