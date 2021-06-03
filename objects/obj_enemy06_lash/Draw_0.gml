if(view_current!=0) exit;
if instance_exists(enemy) {
	x=enemy.x
	y=enemy.y
	image_xscale=enemy.image_xscale
	image_yscale=enemy.image_yscale
}
event_inherited();