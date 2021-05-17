function scr_player_flyobj_move() {
	var ground1=collision_rectangle(bbox_right,bbox_bottom+GRDY+4,bbox_left,bbox_top,obj_ground,1,1),		//全身+足下
		ground3=collision_rectangle(bbox_right+2,bbox_bottom+GRDY,bbox_left-2,bbox_top,obj_ground,1,1),	//左右
		ground4=collision_rectangle(bbox_right,bbox_top,bbox_left,bbox_top-1,obj_ground,1,1),		//头上
		floor1=collision_rectangle(bbox_right,bbox_bottom+GRDY+4,bbox_left,bbox_bottom+GRDY,obj_floor,1,1),	//半透板足下
		pre_flyobj=flyobj, //上一帧接触的飞行物
		upfloor = false //是否踩在半透板上
	if ground_is_flyobj(ground1) && jump<=0		flyobj=ground1	//脚下
	else if ground_is_flyobj(ground3)			flyobj=ground3	//左右
	else if ground_is_flyobj(ground4) && jump>0	flyobj=ground4	//头顶
	else if ground_is_flyobj(floor1) && jump<=0 {
		flyobj=floor1	//脚下
		upfloor = true
	} else {
		flyobj=noone
		if hsp==0 
			x=round(x)
		if vsp==0 && jump==0 
			y=round(y)
	}

	//移动挤压
	if instance_exists(flyobj){
		var fhsp=0,fvsp=0
		if flyobj.speed!=0{
			fhsp=flyobj.hspeed
			fvsp=flyobj.vspeed
		} else if flyobj.path_speed!=0 {
			fhsp=lengthdir_x(abs(flyobj.path_speed), flyobj.direction)
			fvsp=lengthdir_y(abs(flyobj.path_speed), flyobj.direction)
		}
		//直球运行
		x+=fhsp
		y+=fvsp
		//横向矫正
		if abs(fhsp)>0{
			//飞行物是墙壁，考虑挤压
			if instance_is_object(flyobj, obj_ground){
				if !collision_rectangle(bbox_right-hsp, bbox_bottom+GRDY, bbox_left-hsp, bbox_top, flyobj, 1, 1){//被推动
					var grd = noone
					do{
						grd = collision_rectangle(bbox_right+min(sign(fhsp),0),bbox_bottom+GRDY-1,bbox_left+max(sign(fhsp),0),bbox_top+1,obj_ground,1,1)
						if instance_exists(grd) && grd!=flyobj x-=sign(fhsp)
						else grd = noone
					}until !(instance_exists(grd) && grd!=flyobj)
				} //else while collision_rectangle(bbox_right, bbox_bottom+GRDY, bbox_left, bbox_top, flyobj, 1, 1) x+=sign(hsp)
			}
			//线或者板子，碰到墙壁强制挤压出来
			else{
				while collision_rectangle(bbox_right+max(sign(fhsp),0),bbox_bottom+GRDY-1,bbox_left+min(sign(fhsp),0),bbox_top+1,obj_ground,1,1)
					x-=sign(hsp)
				//while collision_rectangle(bbox_right,bbox_bottom+GRDY-1,bbox_right-1,bbox_top+1,obj_ground,1,1)
				//&& !collision_rectangle(bbox_left+1,bbox_bottom+GRDY-1,bbox_left,bbox_top+1,obj_ground,1,1)
				//	x-=1
				//while collision_rectangle(bbox_left+1,bbox_bottom+GRDY-1,bbox_left,bbox_top+1,obj_ground,1,1)
				//&& !collision_rectangle(bbox_right,bbox_bottom+GRDY-1,bbox_right-1,bbox_top+1,obj_ground,1,1)
				//	x+=1
			}
		}
		//纵向矫正
		if abs(fvsp)>0{
			//飞行物是墙壁，考虑挤压
			if instance_is_object(flyobj, obj_ground){
				if !collision_rectangle(bbox_right, bbox_bottom+GRDY-fvsp, bbox_left, bbox_top, flyobj, 1, 1){//被推动抬上或者压下
					var grd = noone
					do{
						grd = collision_rectangle(bbox_right,bbox_bottom+GRDY+min(sign(fvsp),0),bbox_left,bbox_top+max(sign(fvsp),0),obj_ground,1,1)
						if instance_exists(grd) && grd!=flyobj y-=sign(fvsp)
						else grd = noone
					}until !(instance_exists(grd) && grd!=flyobj)
				} //else while collision_rectangle(bbox_right, bbox_bottom+GRDY, bbox_left, bbox_top, flyobj, 1, 1) y+=sign(vsp)
			}
			//线或者板子，碰到墙壁强制挤压出来
			else{
				if!(fvsp<0 && upfloor){
					while collision_rectangle(bbox_right,bbox_bottom+GRDY+max(sign(fvsp),0),bbox_left,bbox_top+min(sign(fvsp),0),obj_ground,1,1)
						y-=sign(fvsp)
				}
				//while collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-1,obj_ground,1,1)
				//&& !collision_rectangle(bbox_right,bbox_top+1,bbox_left,bbox_top,obj_ground,1,1)
				//	y-=1
				//while collision_rectangle(bbox_right,bbox_top+1,bbox_left,bbox_top,obj_ground,1,1)
				//&& !collision_rectangle(bbox_right,bbox_bottom+GRDY,bbox_left,bbox_bottom+GRDY-1,obj_ground,1,1)
				//	y+=1
			}
		}
		//如果是这一帧才接触，则强制坐标小数位校准
		if !instance_exists(pre_flyobj){
			if fhsp>0 && in(flyobj, [ground3]){
				x=floor(x)
				if bbox_right<flyobj.bbox_left x+=frac(flyobj.bbox_left)
				else if bbox_left>flyobj.bbox_right x+=frac(flyobj.bbox_right)
				while collision_rectangle(bbox_right, bbox_bottom+GRDY, bbox_left, bbox_top, flyobj, 1, 1) 
					x+=sign(fhsp)
			}
			if fvsp>0 && in(flyobj, [ground1, ground4]){
				y=floor(y)
				if bbox_bottom+GRDY<flyobj.bbox_top y+=frac(flyobj.bbox_top)
				else if bbox_top>flyobj.bbox_bottom+GRDY y+=frac(flyobj.bbox_bottom+GRDY)
				while collision_rectangle(bbox_right, bbox_bottom+GRDY, bbox_left, bbox_top, flyobj, 1, 1) 
					y+=sign(fvsp)
			}
		}
	}
}
