event_inherited();
spr_loopinx=0
itemval=1
object=noone //爆卡的对象
//吃到后执行（E罐）
execute=function() {
	print "获得卡片对象：" + object_get_name(object)
	scr_sound_play(se_item_disk)
	instance_destroy()
}