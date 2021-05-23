if(view_current!=0) exit;
var perx=x, pery=y;
x=round(x) 
y=round(y)
#region 副武器蓄力后半部分
if charge[2]>=charge_dis {
	var spr=spr_player_charge_sub_1_bck
	if charge[2]>=charge_max spr=spr_player_charge_sub_2_bck
	draw_sprite_ext(spr, global.fps_currmenu*0.25, x, y-4*image_yscale, 
					1, image_yscale, image_alpha, image_blend, image_alpha)
}
#endregion
#region 残影
if(afterdash<8) {
	for(var i=8;i>=0;i-=1){
		if(frac(i/4)==0) {
			//保持普通
			draw_sprite_ext(sprite_index,image_index,round(px[i]),round(py[i]),image_xscale,image_yscale,image_angle,aftercolor,image_alpha/2);
		}
	}
}
#endregion
#region 本体
drawSelf();
#endregion
#region 拼件
var partsprname = sprite_get_name(sprite_index)+"_part",
	partspr = asset_get_index(partsprname);
if sprite_exists(partspr) {
	draw_sprite_ext(partspr,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}
#endregion
#region 受伤
if(uninjure==1 && scr_menu_trem()) {
	var alpha=(global.fps_currmenu mod 4)*0.25
	scr_draw_sprite_white(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha*alpha);
}
#endregion
#region 蓄力
if charge[1]>=charge_dis {
	var spr=spr_player_charge_main_1
	if charge[1]>=charge_max spr=spr_player_charge_main_2
	draw_sprite_ext(spr, global.fps_currmenu*0.25, x, y-4*image_yscale, 
					1, image_yscale, image_alpha, image_blend, image_alpha)
}
if charge[2]>=charge_dis {
	var spr=spr_player_charge_sub_1_frt
	if charge[2]>=charge_max spr=spr_player_charge_sub_2_frt
	draw_sprite_ext(spr, global.fps_currmenu*0.25, x, y-4*image_yscale, 
					1, image_yscale, image_alpha, image_blend, image_alpha)
}
#endregion
#region 特殊动作额外显示
//变身选卡
if in(sprite_index, [SS_change_idle_ing, SS_change_fall_ing]) {
	var cardshx=0,
		sprnum=sprite_get_number(spr_player_change_cards);
	if obj_staff.player_change_select_dir==1 
		cardshx=obj_staff.player_change_outsert_rate*sprnum
	else if obj_staff.player_change_select_dir==-1 
		cardshx=(1-obj_staff.player_change_outsert_rate)*sprnum
	draw_sprite_ext(spr_player_change_cards, cardshx, x-24*image_xscale, y-20*image_yscale, 
					image_xscale, image_yscale, image_alpha, image_blend, image_alpha)
}
#endregion
#region 对话屏幕
if call_screen {
	draw_sprite_ext(spr_player_call_screen, global.fps_currmenu, x, y, 
					image_xscale, image_yscale, 0, c_white, 1)
}
#endregion
x=perx;
y=pery;