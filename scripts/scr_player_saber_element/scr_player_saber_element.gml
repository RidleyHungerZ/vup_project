/// @desc 根据当前卡片确认属性
function scr_player_saber_element(){
	if global.model=PLAYER_MODEL.YANZX || global.model=PLAYER_MODEL.fire2
		return ELEMENTS.fire
	else if global.model=PLAYER_MODEL.ice || global.model=PLAYER_MODEL.ice2
		return ELEMENTS.ice
	else if global.model=PLAYER_MODEL.elec || global.model=PLAYER_MODEL.elec2
		return ELEMENTS.elec
	else
		return ELEMENTS.none
}