event_inherited();
undm=1

lanuch_mode=1 //1散弹，2大导弹
missile_index=0
missile_pos=[
	new spoint(-7, 4),
	new spoint(-1, 2),
	new spoint(5, 0),
	new spoint(-7, 12),
	new spoint(-1, 10),
	new spoint(5, 8),
]

lanuch=function() {
	if lanuch_mode==1 
		action=10
	else if lanuch_mode==2 
		action=20
}
open=function(mode) {
	lanuch_mode=mode
	action=1
}
close=function() {
	action=-1
}