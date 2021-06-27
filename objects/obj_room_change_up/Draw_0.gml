if view_current!=0 exit
if sprite_exists(SS_bgs)
	draw_sprite(SS_bgs, 0, x, y)
draw_self()
if ready_open && can_open {
	draw_sprite(spr_npc_talk_tip, 0, x, obj_player.y-48+4*sin(global.fps_currmenu*pi/30))
}