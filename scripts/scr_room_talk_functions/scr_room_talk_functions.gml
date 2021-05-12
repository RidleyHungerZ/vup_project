/// @desc 设置剧情对话
/// @arg thread 剧情编号
/// @arg talk_inx 对话类型，枚举TALK_INX，
/// @arg xscale 1为左下右上
/// @arg unow_shoto_type 头像类型
/// @arg unow_shoto 头像编号
/// @arg unow_name 名称编号
function thread_talk(thread, _talk_inx, _xscale, _unow_shoto_type, _unow_shoto, _unow_name) {
	global.txt_thread_set[thread]={
		talk_inx : _talk_inx,
		xscale : _xscale,
		unow : {
			shoto_type : _unow_shoto_type,
			shoto : _unow_shoto,
			name : _unow_name,
		},
	}
}
/// @desc 设置剧情对话
/// @arg thread 剧情编号
/// @arg inx 对话序号
/// @arg now 当前使用对话框
/// @arg shoto_type 头像类型
/// @arg shoto 头像编号
/// @arg name 名称编号
/// @arg tend 走完这句话是否结束对话
/// @arg txt 文本内容
function thread_talk_txt(thread, inx, _now, _shoto_type, _shoto, _name, _tend, _txt) {
	global.txt_thread[thread][inx]={
		now : _now,
		shoto_type : _shoto_type,
		shoto : _shoto,
		name : _name,
		tend : _tend,
		txt : _txt,
	}
}
//演绎开始，如果和上次对话是同一个thread，则继承序号，否则从头开始
/// @arg thread 剧情编号
function thread_talk_start(thread) {
	with obj_room {
		talk_action=1
		if talk_txt_thread!=thread {
			talk_txt_thread=thread
			talk_txt_index=0
		}
	}
}
//演绎中插入对话
/// @arg thread 剧情编号
/// @arg 开始action
/// @arg 结束action
/// @arg 结束后等待时间
function thread_talk_execute(thread, stact, endact, wtime) {
	with obj_room {
		var cenact=(stact+endact)/2
		if action==stact && time==0 {
			thread_talk_start(thread)
			action=cenact
		}
		else if action==cenact {
			if !scr_talk_ing() {
				action=endact
				time=wtime
			}
		}
	}
}