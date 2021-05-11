event_inherited();
talk_inx=TALK_INX.both
//start_now=TALK_INX.down
shoto_type=TALK_SHOTO.npc

txts1=[
	"测试对话0001\n我超勇的。bbbbbbbbbbbbbbbbbbbbbbdsdadddddddddddddddd\nccccccccccccwqqqqqqqqqqqq",
	"测试对话221333333333333333333333333333333333333\n77777777777777777777777777777\n222222222222222222",
	"测试对话3------------================////////////////\n(((((&&&&&&&&&&&&**********\n*******^^^^^^^^%%%%%%%%%",
]
txts2=[
	"对话2222222222222222叽里呱啦",
	"tasktalktttttttttttttttttttttttttaaaaaaaaaaaaaaaaaaaaaaaaa究极甲",
	"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊",
]
//对话开始
talk_start=function() {
	scr_talk(TALK_INX.up, "", shoto_type, 0, 0, image_xscale, [])
	scr_talk(TALK_INX.down, txts1[0], shoto_type, 0, 0, image_xscale, [])
}