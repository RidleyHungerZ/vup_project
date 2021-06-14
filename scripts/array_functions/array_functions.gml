/// @desc 在数组中
/// @arg val
/// @arg array
function array_contains(val, array){
	for(var i=0;i<array_length(array);i++) {
		if array[i]==val return true
	}
	return false
}
/// @desc 合并两个数组
/// @arg ary1
/// @arg ary2
function array_add_all(ary1, ary2){
	var len1=array_length(ary1)
	for(var i=0;i<array_length(ary2);i++) {
		ary1[len1+i]=ary2[i]
	}
	return ary1
}