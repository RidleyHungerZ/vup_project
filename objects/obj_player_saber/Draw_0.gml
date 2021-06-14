if(view_current!=0) exit;
x=obj_player.x;
y=obj_player.y;
image_xscale=abs(image_xscale)*sign(obj_player.image_xscale);
image_yscale=abs(image_yscale)*sign(obj_player.image_yscale);
image_angle=obj_player.image_angle;

//冰属性蓄力斩雪花
if in(sprite_index, [spr_player_armor_fall_spin_chop_saber_ice, 
					spr_player_armor_fall_spin_choped_saber_ice,
					spr_player_armor_idle_chop_charge_saber_ice,]) {
	var partsprname = sprite_get_name(sprite_index)+"_flash",
		partspr = asset_get_index(partsprname);
	if sprite_exists(partspr) {
		draw_sprite_ext(partspr,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	}
}
draw_self()