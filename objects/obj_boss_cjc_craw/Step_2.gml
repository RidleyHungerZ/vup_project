event_inherited();
if(!scr_menu_trem()) exit;
//覆盖爪子
if sprite_index==spr_boss_cjc_crawcen_catch_get_frt 
|| sprite_index==spr_boss_cjc_crawcen_catch_release_frt
|| sprite_index==spr_boss_cjc_crawcen_catch_get_back 
|| sprite_index==spr_boss_cjc_crawcen_catch_get2_back {
	if !instance_exists(mask_part) {
		mask_part=instance_create_layer(x, y, obj_room.layerInst[1], obj_animation) 
		with mask_part {
			scr_sprite_change(other.sprite_index, 1, 0)
			follow=other.id
			follow_sprite=true
			follow_xscale=true
			follow_yscale=true
			follow_angle=true
			follow_blend=true
			follow_alpha=true
		}
	}
} else {
	if instance_exists(mask_part)
		instance_destroy(mask_part)
}