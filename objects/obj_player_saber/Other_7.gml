switch(sprite_index){
	case spr_player_armor_fly_chop_saber:{
		scr_sprite_change(-2, image_number-0.5, 0)
		break
	}
	case spr_player_armor_fly_choping_saber:{
		scr_sprite_change(-2, image_number-0.5, 0)
		break
	}
	case spr_player_armor_fly_choping_saber_fire:{
		scr_sprite_change(-2, image_number-0.5, 0)
		break
	}
	default:{
		scr_sprite_change(spr_none, 0, 0)
		element=ELEMENTS.none
		break
	}
}