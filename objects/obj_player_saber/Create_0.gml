event_inherited();
global.player_saber=id
scr_sprite_change(spr_none,0,0)
//在光剑中添加一个list记录每一帧已经处理过的敌人
enemy_list=ds_list_create();
hit_target=function(targets) {
	
}

span_comboing=false //光剑回旋中