event_inherited();
if(scr_boss_isget(bs)) {
	scr_sprite_change(spr_none, 0, 0)
	exit;
}
if(!is_war_boss) exit;
if(!scr_menu_trem()) exit;
#region BOSS战开始或两方都空血或使用死亡系统，则停止
if global.boss_war==1
&& (global.boss_hp<=0 || hp<=0)
&& use_death_system_boss
	speed=0;
#endregion
#region 爆炸结束触发
if(global.boss_hp<=0 
&& boom<=0
&& !deathTriggerExecuted) {
	deathTriggerExecuted=true;
	deathTrigger();
}
#endregion
#region 爆炸动画
if(boom_time>0) boom_time-=1;
else boom_time=0;
if(use_death_system_boss && boom>0) {
	//间歇冒烟尘
	if(sprite_index!=spr_none) {
	    if(boom_time mod 30 == 0) {
			flash=1;
		}
	    if(boom<3) {
	        var xx=random_range(min(bbox_left, x-48), max(bbox_right, x+48)),
				yy=random_range(min(bbox_top, y-48), max(bbox_bottom, y+48));
	        if(boom_time mod 5 == 0) {
	            with(instance_create_depth(xx,yy,depth-500,obj_animation)) {
	                scr_sprite_change(spr_smoke,0,0.5);
					animation_once=true;
				}
	        }
	        if(boom_time mod 4 == 0) {
	            with(instance_create_depth(xx,yy,depth-500,obj_animation)) {
	                scr_sprite_change(spr_enemy_bullethit,0,0.5);
					animation_once=true;
				}
	        }
	    }
	}
	//开始爆炸
	if(boom==1) {
		boom=2;
		boom_time=240;
	}
	//分频发生爆炸
	else if(boom==2) {
		var createBoom=false;
		if(boom_time>120 &&(boom_time mod 30 == 0))
		||(boom_time>60 &&(boom_time mod 20 == 0))
		||(boom_time>0   &&(boom_time mod 10 == 0)){
			var xx=random_range(min(bbox_left, x-48), max(bbox_right, x+48)),
				yy=random_range(min(bbox_top, y-48), max(bbox_bottom, y+48));
			with(instance_create_depth(xx,yy,depth-500,obj_animation)) {
				scr_sprite_change(spr_boom, 0, 0.5);
				animation_once=true;
				scr_sound_play(se_boom);
			}
		}
		if(boom_time==0) {
			boom=3;
			boom_time=60;
			boom_white=instance_create_depth(VIEW_W_UI/2, VIEW_H_UI/2, -1, obj_animation);
			with boom_white {
				scr_sprite_change(spr_white, 0, 0)
				image_xscale=VIEW_W_UI/16
				image_yscale=VIEW_H_UI/16
				image_alpha=0
			}
			scr_sound_play(se_boss_death_disapper)
		}
	}
	//变白
	else if(boom==3) {
		if boom_time mod 5 == 0 {
			var xx=random_range(min(bbox_left, x-48), max(bbox_right, x+48)),
				yy=random_range(min(bbox_top, y-48), max(bbox_bottom, y+48));
			with(instance_create_depth(xx,yy,depth-500,obj_animation)) {
				scr_sprite_change(spr_boom, 0, 0.5);
				animation_once=true;
				scr_sound_play(se_boom);
			}
		}
		boom_white.image_alpha=1-(boom_time/60)
		if boom_time==0 {
			boom_white.image_alpha=1
			scr_sprite_change(spr_none,0,0);
			with obj_boss_bodypart {
				if boss==other.id
					instance_destroy()
			}
			obj_room.boss_boom_white();
			boom_trigger();
			boom=4
			boom_time=60
		}
	}
	//恢复
	else if(boom==4 && boom_time==0) {
		if boom_white.image_alpha>0
			boom_white.image_alpha-=1/60
		else {
			instance_destroy(boom_white)
			boom=5
			boom_time=30
		}
	}
	//结束
	else if(boom=5 && boom_time==0) {
		boom=-1;
	}
}
#endregion
