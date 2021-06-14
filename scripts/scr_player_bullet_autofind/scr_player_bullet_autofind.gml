/// @desc 查找最近的可攻击敌人
function scr_player_bullet_autofind(){
	var target=noone, dis1=VIEW_W*4, dis2=2*dis1;
	while dis1!=dis2 {
		dis2=dis1
		if instance_exists(obj_enemy){
			with(obj_enemy){
				if hp>0 
				&& can_dmg
				&& scr_in_view(128) {
				    if point_distance(x,y,other.x,other.y)<dis1 {
				        dis1=point_distance(x,y,other.x,other.y)
				        target=id
				    }
				}
			}
		}
	}
	return target
}