event_inherited();
//必杀技退出暂停
if spskl_action==0 
&& global.stop==0 
&& spskl_bgstep_stop {
	spskl_bgstep_stop=false
	global.stop=0.5
}
if spskl_action==-2 
&& global.stop==1 {
	global.stop=-0.5
}