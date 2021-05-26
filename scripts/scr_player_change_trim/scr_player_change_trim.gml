/// @desc 玩家能变身的条件
function scr_player_change_trim(){
	//系统变量条件
	if global.operate==1
	&& global.player_operate==1 
	&& global.player_hp>0
	&& global.player_saber.sprite_index==spr_none 
	&& global.model_get_number>=2 
	&& !instance_exists(obj_player_change_circle) {
		//动作条件
		with obj_player {
			if jump==0 {
				if in(walk, [0, 1]) {
					return true;
				}
			} else if in(jump, [1, 2]) {
				return true;
			}
		}
	}
	return false;
}