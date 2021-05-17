/// @desc 死亡时属性特效
function scr_enemy_element_death(){
	if(injure_type==ATK_TYPE.bullet 
	|| injure_type==ATK_TYPE.cut 
	|| injure_type==ATK_TYPE.through) {
		//if(element==ELEMENTS.fire && injure_element==ELEMENTS.elec)
		//||(element==ELEMENTS.ice && injure_element==ELEMENTS.fire)
		//||(element==ELEMENTS.elec && injure_element==ELEMENTS.ice) {
			
		//}
	}
}
/// @desc 死亡时产生道具
function scr_enemy_create_item() {
	/*
	普通情况下，按照大道具、小道具区分
	血量低于8点时，道具爆率提升0.5倍，且75%是血药
	能量低于8点时，道具爆率提升0.5倍，75%是能量
	*/
	//敌人死亡爆道具
	var ITEM=-1,
		p1=random(100),
		p2=random(100),
		num=0,
		small,big,card,
		musthp=(global.player_hp<=8),
		mustmp=(global.player_mp<=8),
		maxhp=(global.player_hp>=global.player_hp_up),
		maxmp=(global.player_mp>=global.player_mp_up)
	num+=20	small=num
	num+=10	big=num
	num+=30 card=num
	if musthp 
	|| mustmp{
		small*=1.5
		big*=1.5
	}
	//贪婪
	//if scr_itemb_isrun(ITEMB_STATUS.greedy) {
	//	small*=2
	//	big*=2
	//	card*=2
	//} 
	if p1<=small{
		var p_hp=0.5,
			p_mp=0.5
		if musthp p_hp=0.75
		else if maxhp p_hp=0.25
		if mustmp p_mp=0.75
		else if maxmp p_mp=0.25
		ITEM=probability([obj_item_hp_s, p_hp], 
						obj_item_sp_s)
	} else if p1<=big	{
		var p_hp=0.5,
			p_mp=0.5
		if musthp p_hp=0.75
		else if maxhp p_hp=0.25
		if mustmp p_mp=0.75
		else if maxmp p_mp=0.25
		ITEM=probability([obj_item_hp, p_hp], 
						obj_item_sp)
	} else if p1<=card {
		ITEM=obj_item_disk
	}
	if object_exists(ITEM){
		with instance_create_depth(x, y, depth, ITEM) {
			create()
			if inst_of(obj_item_disk) {
				object=other.object_index
			}
		}
	}
}
/// @desc 死亡时发生爆炸
/// @arg x*
/// @arg y*
function scr_enemy_boom_number(xx, yy, number, type) {
	if!xx xx=x;
	if!yy yy=y;
	if!number number=boom_number;
	if!type type=boom_type;
	//按照爆炸数进行爆炸
	if number>0{
		for(var i=0;i<number;i+=1){
			var ddd=90+i*(360/((number=1) ? number : (number-1)))
			var lex=xx+lengthdir_x(24,ddd)*sign(i)
			var ley=yy+lengthdir_y(24,ddd)*sign(i)
			if type==0{
				with(instance_create_depth(lex,ley,depth-1,obj_animation_once)){
					scr_sprite_change(spr_boom,0,0.5)
				}
			}
			//互相伤害
			else if type==1{
				with(instance_create_depth(lex,ley,depth-1,obj_bullet_animation_once)){
					scr_sprite_change(spr_boom2 ,0,0.5)
					attack=other.attack
					with(instance_create_depth(lex,ley,depth,obj_player_bullet)){
						dis_edge=-1
						scr_sprite_change(spr_boom2 ,0,0.5)
						scr_player_damage_set(other.attack,0,0,1,1,0,1,0)
						animation_once=true
					}
				}
			}
			//只伤害玩家
			else if type==2{
				with(instance_create_depth(lex,ley,depth-1,obj_bullet_animation_once)){
					scr_sprite_change(spr_boom2 ,0,0.5)
					attack=other.attack
				}
			}
		}
		var edge=64
		if variable_instance_exists(id,"view_edge") edge=view_edge
		if scr_in_view(edge) || edge<0{
			if number>=3 scr_sound_play(se_boom)
			else scr_se_boom()
			scr_enemy_boom_viewweak()
		}
	}
}
/// @desc 死亡时爆零件
function scr_enemy_boompart(partsprs) {
	if !is_array(partsprs) partsprs=[partsprs]
	if array_length(partsprs)==0 exit
	for(var s=0;s<array_length(partsprs);s++) {
		var spr=partsprs[s],
			number=sprite_get_number(partsprs[s]);
		for(var i=0;i<number;i+=1){
			if spr==spr_none continue
			if layer_exists(layer) part=instance_create_layer(x,y,layer,obj_enemy_part)
			else part=instance_create_depth(x,y,depth,obj_enemy_part)
			part.image_xscale=image_xscale
			part.image_yscale=image_yscale
			part.dspeed=random(8)*-image_xscale*image_yscale
			with(part){
				scr_sprite_change(spr,i,0)
				gravity=G
				if place_meeting(x,y,obj_water)
					gravity=G/2
				speed=10
				direction=90+random_range(-45, 45)
				if place_meeting(x,y,obj_water)
					vspeed*=1.5
			}
		}
	}
}
/// @arg spr_part
/// @arg number
/// @arg x
/// @arg y
function scr_enemy_boompart_ext(partsprs, number, xx, yy) {
	if !is_array(partsprs) partsprs=[partsprs]
	if array_length(partsprs)==0 exit
	for(var s=0;s<array_length(partsprs);s++) {
		var spr=partsprs[s],
			spr_num=sprite_get_number(partsprs[s]);
		if spr=spr_none exit
		for(var i=0;i<number;i+=1){
			var part=instance_create_depth(xx,yy,depth,obj_enemy_part)
			part.image_xscale=image_xscale
			part.image_yscale=image_yscale
			part.dspeed=random(10)*-image_xscale*image_yscale
			with(part){
				scr_sprite_change(spr,i mod spr_num,0)
				gravity=G
				if place_meeting(x,y,obj_water)
					gravity=G/2
				hspeed=random_range(-10,10)
				vspeed=image_yscale*random_range(-10,-6)
				if place_meeting(x,y,obj_water)
					vspeed*=1.5
			}
		}
	}
}

/// @desc 死亡时晃动镜头
function scr_enemy_boom_viewweak() {
	scr_view_shock(1)
}