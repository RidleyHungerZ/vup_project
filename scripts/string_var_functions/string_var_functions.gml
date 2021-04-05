/// @function string_get_var
/// @desc 根据字符串变量名获取变量值，也可以用于将字符串表示的值转化为gml数据类型
/// @arg str
function string_get_var(str) {
	/**
	 * 使用范例
	 * txt = "obj_player.walk"
	 * val = string_get_var(txt)
	 * val : 1
	 * 
	 * txt = "[1,2,'3']"
	 * val = string_get_var(txt)
	 * val : [1,2,"3"]
	 * 注：二维数组格式为[[1,2,3],[4,5]]，所以不可以使用三层及以上数组嵌套
	 */
	var varname = string_replace_all(str, " ", ""),//去掉空格
		varname_s = str,//不去空格的，用来做字符串
		val = undefined
	//全局或对象变量
	if string_pos("." ,varname){
		var obj_var = string_split(varname, "."),
			OBJ = obj_var[0],
			VAR = obj_var[1]
		//如果是全局变量
		if OBJ = "global" {
			if variable_global_exists(VAR){
				val = variable_global_get(VAR)
			}
		}
		//如果是对象变量(一般为唯一对象，如obj_staff)
		else {
			var object = asset_get_index(OBJ)
			if object_exists(object){
				var inst = object.id
				if variable_instance_exists(inst ,VAR){
					val = variable_instance_get(inst, VAR)
				}
			}
		}
	}
	//已经写好的值
	else{
		//二维数组
		if string_pos("[[" ,varname){
			while string_char_at(varname_s, string_length(varname_s)) = " "
				varname_s = string_copy(varname_s, 1, string_length(varname_s)-1)
			var arys = string_split(string_copy(varname_s, 2, string_length(varname_s)-2), "],[")
			val = []
			for(var i=0;i<array_length(arys);i++){
				var tmp1 = arys[i], tmp2 = string_replace_all(arys[i], " ", "")
				if string_char_at(tmp2, 1) = "[" && string_char_at(tmp2, string_length(tmp2)) != "]"
					tmp1 += "]"
				else if string_char_at(tmp2, 1) != "[" && string_char_at(tmp2, string_length(tmp2)) = "]"
					tmp1 = "[" + tmp1
				else if string_char_at(tmp2, 1) != "[" && string_char_at(tmp2, string_length(tmp2)) != "]"
					tmp1 = "[" + tmp1 + "]"
			
				var aryvals = string_get_var(tmp1)
				for(var j=0;j<array_length(aryvals);j++){
					val[i][j] = aryvals[j]
				}
			}
		}
		//一维数组
		else if string_pos("[" ,varname){
			while string_char_at(varname_s, string_length(varname_s)) = " "
				varname_s = string_copy(varname_s, 1, string_length(varname_s)-1)
			var aryvals = string_split(string_copy(varname_s, 2, string_length(varname_s)-2), ",")
			val = []
			for(var i=0;i<array_length(aryvals);i++){
				val[i] = string_get_var(aryvals[i])
			}
		}
		//字符串
		else if string_pos("'" ,varname){
			var parts = string_split(varname_s, "'")
			val = parts[1]
		}
		//实数
		else if varname = string(string_digits(varname)){
			val = real(varname)
		}
		//资源
		else{
			var asset = asset_get_index(varname)
			if asset != -1 val = asset
		}
	}
	return val
}
/// @function string_get_script
/// @desc 根据字符串函数表达式获取值
/// @arg str
function string_get_script(str) {
	/**
	 * 使用范例
	 * txt = "real('123')"
	 * val = string_get_script(txt)
	 * val : 123
	 */
	var val = undefined
	if(string_pos("(" ,str)>0){
		/*var script_args = string_split(str, "("),
			SCRIPT = string_replace_all(script_args[0], " ", ""),
			ARGs
		//去掉末尾空格
		while string_char_at(script_args[1], string_length(script_args[1])) = " "
			script_args[1] = string_copy(script_args[1], 1, string_length(script_args[1])-1)
		ARGs = string_split(string_copy(script_args[1], 1, string_length(script_args[1])-1), ",")*/
		var script_args = string_split(str, "("),
			SCRIPT = string_replace_all(script_args[0], " ", "")
		///////////////////////
	#region 根据括号分离参数
		var realargs=[], 
			realargs_inx=0,
			now_is_fun=false, //当前拼接的是函数，当前后括号对不上时为此状态
			fun_bracket=0,	//括号数量
			islast_filter=false //最后括号是否过滤了
		//将被拆分的函数组合起来单独存为一个字符串
		for(var i=1;i<array_length(script_args);i++){
			//混合字符串
			var argmex=script_args[i],
				islast=(i==array_length(script_args)-1)
			//最后一个片段去掉最后一个字符右括号
			if(islast && !islast_filter){
				argmex=string_copy(argmex, 1, string_length(argmex)-1)
				islast_filter=true
			}
			//////////////////////////////////////////
			//拼接函数
			//////////////////////////////////////////
			//当前在拼接函数
			if(now_is_fun){
				//有后括号，说明有函数完结，切分后前半部分合并到上个参数里，后半部分做切分处理
				if(string_pos(")" ,argmex)>0){
					while(fun_bracket>0){
						//每次都二分
						var left=string_copy(argmex, 1, string_pos(")" ,argmex)-1),
							right=string_copy(argmex, string_pos(")" ,argmex)+1, string_length(argmex)-string_length(left)-1)
						argmex=right
						realargs[realargs_inx]+=left+")"
						fun_bracket--
					}
					//此混合字符串还没处理完，先更新为去掉函数部分的，再回炉重造
					if(argmex!="" && fun_bracket==0){
						script_args[i]=argmex
						i--
					}
				} else {
					realargs[realargs_inx]+=argmex+"("
					fun_bracket++
				}
				if(fun_bracket==0){
					now_is_fun=false
					realargs_inx++
				}
			} else {
				//切分字符串，最后一个特殊处理
				var split=string_split(argmex, ",")
				for(var j=0;j<array_length(split);j++){
					if(split[j]!="")
						realargs[realargs_inx++]=split[j]
				}
				//如果不是最后一个混合字符串，说明目前最后一个加入的参数是函数名
				if(!islast){
					realargs_inx--
					realargs[realargs_inx]+="("
					fun_bracket++
					now_is_fun=true
				}
			}
		}
	#endregion
    #region 执行函数
		var script = asset_get_index(SCRIPT)
		//var script = SCRIPT;
		if script_exists(script){
			var args = []
			for(var i=0;i<array_length(realargs);i++){
				var ARG = realargs[i], arg
			    //函数可能包含所有，数组可能包含其他数值，实数可能包含小数点
				//如果是函数
				if string_pos("(", ARG)>0{
					arg = string_get_script(ARG)
				}
				//如果是数组
				else if string_pos("[", ARG)>0{
					arg = string_get_var(ARG)
				}
				//如果是字符串
				else if string_pos("'", ARG)>0{
					arg = string_replace_all(ARG, "'", "")
				}
				//如果是实数
				else if ARG = string(string_digits(ARG)){
					ARG = string_replace_all(ARG, " ", "")
					arg = real(ARG)
				}
				//如果是属性
				else if string_pos(".", ARG)>0{
					ARG = string_replace_all(ARG, " ", "")
					arg = string_get_var(ARG)
				}
				//如果是资源
				else{
					ARG = string_replace_all(ARG, " ", "")
					var asset = asset_get_index(ARG)
					if asset != -1 arg = asset
				}
				args[i] = arg
			}
			//执行
			val = script_execute_ext(script, args)
		}
	#endregion
	} else return str;
	return val;
}
/// @desc 根据键名获取图标信息
/// @arg keyname
/// @return [spr, inx]
function string_get_icon(keyname) {
	var iconspr = spr_none,
		iconinx = 0,
		currtime = global.fps_curr,
		currtimediv = currtime div 15
	#region 有分类
	if string_contain(keyname, ":") {
		var type_name = string_split(keyname, ":"),
			type = type_name[0],
			name = type_name[1]
		switch type {
			case "key" : { #region key:
			#region 手柄
				if gaypad_exists() || os_type_is(OS.HOST) {
					iconspr = spr_menu_gaypad_icon_xbox
					if os_type_is(OS.HOST) {
						if os_type_is(OS.NS) iconspr = spr_menu_gaypad_icon_ns
						else if os_type_is(OS.PS) iconspr = spr_menu_gaypad_icon_ps
						else if os_type_is(OS.XBOX) iconspr = spr_menu_gaypad_icon_xbox
					} else {
						iconspr = spr_menu_gaypad_icon_ns
					}
				#region 动作按键
					switch name {
						case "jump" : {
							name = gaypad_get_string(global.jump_joy)
							break
						}
						case "true" : {
							name = gaypad_get_string(global.true_joy)
							break
						}
						case "att" : {
							name = gaypad_get_string(global.att_joy)
							break
						}
						case "trans" : {
							name = gaypad_get_string(global.trans_joy)
							break
						}
						case "dash" : {
							name = gaypad_get_string(global.dash_joy)
							break
						}
						case "sub" : {
							name = gaypad_get_string(global.sub_joy)
							break
						}
						case "tformL" : {
							name = gaypad_get_string(global.tformL_joy)
							break
						}
						case "tformR" : {
							name = gaypad_get_string(global.tformR_joy)
							break
						}
					}
				#endregion
				#region 功能按键
					switch name {
						case "direct" : {
							iconinx=0
							break
						}
						case "up" : {
							iconinx=1
							break
						}
						case "right" : {
							iconinx=2
							break
						}
						case "down" : {
							iconinx=3
							break
						}
						case "left" : {
							iconinx=4
							break
						}
						case "A" : {
							iconinx=5
							break
						}
						case "B" : {
							iconinx=6
							break
						}
						case "X" : {
							iconinx=7
							break
						}
						case "Y" : {
							iconinx=8
							break
						}
						case "L" : {
							iconinx=9
							break
						}
						case "R" : {
							iconinx=10
							break
						}
						case "ZL" : {
							iconinx=11
							break
						}
						case "ZR" : {
							iconinx=12
							break
						}
						case "start" : {
							iconinx=13
							break
						}
						case "select" : {
							iconinx=14
							break
						}
						case "stickL" : {
							iconinx=17
							break
						}
						case "stickR" : {
							iconinx=18
							break
						}
					} 
				#endregion
				} else {
					
				}
			#endregion
				break
			} #endregion
		}
	} 
	#endregion
	#region 无分类
	else {
	
	}
	#endregion
	return [iconspr, iconinx]
}
/// @function string_replace_var(str)
/// @desc 将字符串中的标记替换为变量值
/// @arg str 字符串
function string_replace_var(str) {
	/**
	 * 使用范例
	 * txt = "当前血量是${global.player_hp}点"
	 * txt2 = string_replace_key(txt)
	 * txt2 : "当前血量是16点"
	 */
	var stag=["${", "}"] , returnstr = "undefined"
	//有需要替换的就继续
	if string_pos(stag[0], str)>0{
		var strpart1 = string_split(str, stag[0])
		returnstr = strpart1[0]
		for(var i=1;i<array_length(strpart1);i++){
			var strpart2 = string_split(strpart1[i], stag[1]),
			varname = strpart2[0],
			valstr = "undefined", val = undefined
			//函数
			if string_pos("(" ,varname){
				val = string_get_script(varname)
			}
			//普通数据
			else{
				val = string_get_var(varname)
			}
	
			//格式转换
			valstr = to_string(val)
			returnstr += valstr + strpart2[1]
		}
	}
	else returnstr=str
	return returnstr
}