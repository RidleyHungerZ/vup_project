function scr_enemy_element_recover() {
	//敌人被属性攻击的计时系统
	if elenemt_recover=1
		elenemt_recover=0
	if injure_element!=ELEMENTS.none{
		element_index++
		//if(element_index>=90*0.5 && !scr_itemb_isrun(ITEMB.))
		//||(element_index>=180*0.5 && scr_itemb_isrun(ITEMB.)){
		if(element_index>=120) {
			if injure_element=ELEMENTS.ice 
				scr_ice_boompart_ext(spr_ice_part, 6, x, y)
			element_index=0
			injure_element=ELEMENTS.none
			if sprite_index=SS_injure
				elenemt_recover=1
		}
	}
	else element_index=0
}
