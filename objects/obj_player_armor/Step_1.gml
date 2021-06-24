event_inherited();
//必杀技退出暂停
if spskl_action==-2 
&& global.stop==1 {
	global.stop=-0.5
}