/// @description bgm背景闪动
bgm_time++
//if (bgm_time mod bgm_T) < bgm_t*3 {
	if (bgm_time mod bgm_t) == 0 {
		var instcount=instance_number(obj_logo_hex),
			pp=irandom(instcount),
			i=0;
		with obj_logo_hex {
			if i==pp flash()
			i++
		}
	}
//}