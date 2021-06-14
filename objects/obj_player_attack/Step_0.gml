scr_menu_stop();
if(!scr_menu_trem()) exit;
scr_time_alarm();
#region 残影
if scr_menu_trem(){
	//当前激活残影数
	if afterimage 
		afimg_count_now=afimg_count
	else if afimg_count_now>0 afimg_count_now--
	//残影坐标
	for(var i=afimg_count;i>=0;i-=1){
		if i<=(afimg_count-afimg_count_now){
			afimg_x[i]=x
			afimg_y[i]=y
		}
		else if i>0{
			afimg_x[i]=afimg_x[i-1]
			afimg_y[i]=afimg_y[i-1]
		}
	}
}
#endregion