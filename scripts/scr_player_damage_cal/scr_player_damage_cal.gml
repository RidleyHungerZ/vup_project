/// @desc 计算玩家受到伤害
/// @arg enemy
function scr_player_damage_cal(enemy) {
	var attack = enemy.attack,
		damage = attack*global.player_def,
		overload = scr_itemb_overload()
	//受伤方向
	if sign(enemy.x-x)=image_xscale uninjure=1
	else uninjure=-1
	//扣血
	if scr_itemb_isopen(ITEMB.overload)
	&& scr_itemb_overload()>0 {
		damage*=1.5
	}
	scr_player_hp_subtract(ceil(damage)+overload)
	//受伤等级
	injure_level=enemy.damage_level
	//子弹记录击中
	if enemy.inst_of(obj_bullet)
	||(enemy.inst_of(obj_enemy) && enemy.enemy_or_bullet==2)
		enemy.hit=1
	//特殊效果
	injure_element=enemy.element
	injure_attack_type=enemy.attack_type
	//几种击飞指定朝向方向
	if in(enemy.attack_type, [ATK_TYPE.push, ATK_TYPE.pushup, ATK_TYPE.pushdown]) {
		//击飞方向，有位移则以位移为准
		if enemy.attack_type = ATK_TYPE.push {
			if(enemy.x!=enemy.xprevious) {
				if sign_no0(enemy.xprevious-enemy.x)=image_xscale uninjure=1
				else uninjure=-1
			}
		}
		//击飞方向，有位移则以位移为准
		else if enemy.attack_type = ATK_TYPE.pushup {
			uninjure=-1
		}
		//击飞方向，有位移则以位移为准
		else if enemy.attack_type = ATK_TYPE.pushdown {
			uninjure=1
		}
	}
}
