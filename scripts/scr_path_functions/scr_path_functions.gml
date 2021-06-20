/// @desc 此脚本包括所有由已有路径创建副本的函数

/// @desc 获取路径然后设定左上角的坐标
/// @arg path
/// @arg xl
/// @arg yt
function path_leftop_to_point(pathorg, xl, yt) {
	var pathsub=path_duplicate(pathorg)
	path_shift(pathsub,xl,yt)
	return pathsub
}
/// @desc 对路径垂直旋转
/// @arg path
/// @arg y
function path_flip_to_point(pathorg, my) {
	//复制路径
	var pathsub=pathorg
	//水平翻转
	path_flip(pathsub)
	//设置最值
	var posn=path_get_number(pathsub),
	maxY=path_get_point_y(pathsub,1),minY=path_get_point_y(pathsub,1);
	//获得路径最值点
	for(var i=2;i<=posn;i++){
		var posy=path_get_point_y(pathsub,i)
		if posy<minY minY=posy
		if posy>maxY maxY=posy
	}
	//获得中心点
	var ceny=(maxY+minY)/2
	//获得偏移坐标
	var yoff=ceny-my
	//偏移路径
	path_shift(pathsub,0,-2*yoff)
}
/// @desc 对路径水平旋转
/// @arg path
/// @arg x
function path_mirror_to_point(path, mx) {
	//复制路径
	//所有点一个一个翻转
	for(var i=0;i<path_get_number(path);i++){
		//原坐标
		var posx=path_get_point_x(path,i),posy=path_get_point_y(path,i)
		//修改坐标
		path_change_point(path,i,posx+2*(mx-posx),posy,100)
	}
}
/// @desc 对路径中心旋转180°
/// @arg path
/// @arg x
/// @arg y
function path_rotate_to_point(pathorg, mx, my) {
	//复制路径
	var pathsub=pathorg
	//水平翻转
	path_rotate(pathsub,180)
	//设置最值
	var posn=path_get_number(pathsub),
	maxX=path_get_point_x(pathsub,0),minX=path_get_point_x(pathsub,0),
	maxY=path_get_point_y(pathsub,0),minY=path_get_point_y(pathsub,0);
	//获得路径最值点
	for(var i=1;i<posn;i++){
		var posx=path_get_point_x(pathsub,i),posy=path_get_point_y(pathsub,i)
		if posx<minX minX=posx
		if posx>maxX maxX=posx
		if posy<minY minY=posy
		if posy>maxY maxY=posy
	}
	//获得中心点
	var cenx=(maxX+minX)/2,ceny=(maxY+minY)/2
	//获得偏移坐标
	var xoff=cenx-mx,yoff=ceny-my
	//偏移路径
	path_shift(pathsub,cenx-xoff,ceny-yoff)
}
/// @desc 部分复制原路径，并增加新的点
/// @arg path
/// @arg n
/// @arg points[x_y_spd]
function path_get_subpath(path, n, points) {
	var newpath = path_add();
	path_set_kind(newpath, path_get_kind(path));
	path_set_closed(newpath, path_get_closed(path));
	path_set_precision(newpath, path_get_precision(path));
	path_clear_points(newpath);
	for(var i=0;i<n;i++) {
		var ppx = path_get_point_x(path, i),
			ppy = path_get_point_y(path, i),
			pps = path_get_point_speed(path, i);
		path_add_point(newpath, ppx, ppy, pps);
	}
	for(var i=0;i<array_length(points);i++) {
		if(points[i][2]<0) points[i][2]=100;
		path_add_point(newpath, 
						points[i][0], 
						points[i][1], 
						points[i][2]);
	}
	return newpath;
}