/// @desc 检测是否为移动平台
function ground_is_flyobj(inst){
	if is_undefined(inst) return false
	if !instance_exists(inst) return false
	return inst.speed!=0 || inst.path_speed!=0 || inst.fly
}