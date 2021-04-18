/// @desc 设置按键时重复替换(变量设置前执行)
/// @arg varname
/// @arg keyval 准备设置的键位
function scr_keyboard_set_replace(varname, keyval){
	var val=variable_global_get(varname),
		replacekeys=[[
			"left_key",
			"right_key",
			"up_key",
			"down_key",
			"A_key",
			"B_key",
			"X_key",
			"Y_key",
			"L_key",
			"R_key",
			"select_key",
			"start_key",
		], [
			"left_key",
			"right_key",
			"up_key",
			"down_key",
			"jump_key",
			"att_key",
			"dash_key",
			"sub_key",
			"trans_key",
			"true_key",
			"tformL_key",
			"tformR_key",
			"select_key",
			"start_key",
		]]
	for(var i=0;i<array_length(replacekeys);i++) {
		if !array_contains(varname, replacekeys[i]) continue
		for(var j=0;j<array_length(replacekeys[i]);j++) {
			var rkval=variable_global_get(replacekeys[i][j])
			if replacekeys[i][j]!=varname
			&& rkval==keyval {
				variable_global_set(replacekeys[i][j], val)
			}
		}
	}
}
/// @desc 设置按键时重复替换(变量设置前执行)
/// @arg varname
/// @arg keyval 准备设置的键位
function scr_gaypad_set_replace(varname, keyval){
	var val=variable_global_get(varname),
		replacekeys=[
			"jump_joy",
			"true_joy",
			"att_joy",
			"trans_joy",
			"dash_joy",
			"sub_joy",
			"tformL_joy",
			"tformR_joy",
		]
	for(var i=0;i<array_length(replacekeys);i++) {
		var rkval=variable_global_get(replacekeys[i])
		if replacekeys[i]!=varname
		&& rkval==keyval {
			variable_global_set(replacekeys[i], val)
		}
	}
}