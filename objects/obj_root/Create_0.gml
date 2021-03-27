///@desc 所有对象共用方法库
scr_menu_var();
inst_of = function(obj) {
	if(is_array(obj)){
		for(var i=0;i<array_length(obj);i++){
			if(object_exists(obj[i])
			&&(object_is_ancestor(object_index,obj[i])
			|| object_index==obj[i])){
				return true;
			}
		}
		return false;
	}
	else{
		if(object_exists(obj)
		&&(object_is_ancestor(object_index,obj)
		|| object_index==obj))
			return true;
		else
			return false;
	}
}