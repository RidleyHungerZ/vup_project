/// @desc 爆血效果
function scr_enemy_blood(){
	with(instance_create_depth(x,y,depth-1,obj_animation_once)){
		scr_sprite_change(spr_enemy_blood, 0, 0.5)
		image_xscale=1.5*sign(other.image_xscale)
		image_yscale=1.5*sign(other.image_yscale)
		//if variable_instance_exists(other.id, "inxscale") && other.inxscale!=0
		//	image_yscale=sign(-other.inxscale)
		//if image_yscale=1 image_angle=120
		//else if image_yscale=-1 image_angle=60
	}
}
/// @desc 贯穿效果
/// @arg 贯穿碎屑
function scr_enemy_through(partspr){
	with(instance_create_depth(x,y,depth-10,obj_animation_once)){
		scr_sprite_change(spr_enemy_through, 0, 0.5)
		image_xscale=sign(other.image_xscale)
	}
	//爆飞零件
	if sprite_exists(partspr) {
		for(var i=1;i<=sprite_get_number(partspr);i+=1){
			with instance_create_depth(x,y,depth,obj_enemy_part){
				image_xscale=other.image_xscale
				image_yscale=other.image_yscale
				scr_sprite_change(partspr,i-1,0)
				gravity=G
				hspeed=random_range(8,4)*-image_xscale
				if place_meeting(x,y,obj_water)
					vspeed=random_range(5,3)*-image_yscale
				else
					vspeed=2*random_range(5,3)*-image_yscale
				dspeed=random(6)*-image_xscale*image_yscale
			}
		}
	}
}