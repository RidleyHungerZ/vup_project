function scr_txt_menu(){
	#region 状态
	global.txt_menu[0]={
		left : {
			PLAY_TIME : "游戏时间",
			CYBER_ES : "存在支持度点数",
		},
		right : {
			
		}
	}
	#endregion
	#region 道具
	global.txt_menu[1]={
		
	}
	#endregion
	#region 设置
	//获得所有屏幕分辨率
	var getWindowResolution = function() {
		var sizelist=[], winsize=obj_view.ui.winsize;
		for(var i=0;i<array_length(winsize);i++) {
			sizelist[i]=string(winsize[i].w) + "x" + string(winsize[i].h);
		}
		return sizelist;
	}
	enum menu_page2_option {
		list = 0,
		two = 1,
		line = 2,
	}
	global.txt_menu[2]={
		//按键
		keyboards : [
			{
				text : "方向",
				option : {
					type : menu_page2_option.list,
					list : ["方向键", "WASD"],
				},
			}, {
				text : "主武器",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.att_key)}", "${gaypad_get_string(global.att_joy)}"],
				},
			}, {
				text : "副武器",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.sub_key)}", "${gaypad_get_string(global.sub_joy)}"],
				}
			}, {
				text : "跳跃",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.jump_key)}", "${gaypad_get_string(global.jump_joy)}"],
				},
			}, {
				text : "冲刺",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.dash_key)}", "${gaypad_get_string(global.dash_joy)}"],
				},
			}, {
				text : "切换卡片",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.trans_key)}", "${gaypad_get_string(global.trans_joy)}"],
				},
			}, {
				text : "快捷切卡(上一个)",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.tformL_key)}", "${gaypad_get_string(global.tformL_joy)}"],
				},
			}, {
				text : "快捷切卡(下一个)",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.tformR_key)}", "${gaypad_get_string(global.tformR_joy)}"],
				},
			}, {
				text : "援护技能",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.true_key)}", "${gaypad_get_string(global.true_joy)}"],
				},
			}, {
				text : "菜单",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.start_key)}", "start"],
				},
			}, {
				text : "确认",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.A_key)}", "A"],
				},
			}, {
				text : "取消",
				option : {
					type : menu_page2_option.two,
					list : ["${key_get_string(global.B_key)}", "B"],
				},
			},
		],
		//指令
		orders : [
			{
				text : "副武器使用方式",
				option : {
					type : menu_page2_option.list,
					list : ["副武器键", "按住", "一键切换"],
				},
			}, {
				text : "连打方向冲刺指令",
				option : {
					type : menu_page2_option.list,
					list : ["开启", "关闭"],
				},
			}, {
				text : "界面系统提示",
				option : {
					type : menu_page2_option.list,
					list : ["开启", "关闭"],
				},
			},
		],
		//显示
		displays : [
			{
				text : "全屏",
				option : {
					type : menu_page2_option.list,
					list : ["开启", "关闭"],
				},
			}, {
				text :  "画面分辨率",
				option : {
					type : menu_page2_option.list,
					list : getWindowResolution(),
				},
			}, {
				text : "像素滤镜",
				option : {
					type : menu_page2_option.list,
					list : ["无", "模糊", "扫描线", "柔化"],
				},
			}, {
				text : "游戏语言",
				option : {
					type : menu_page2_option.list,
					list : ["简体中文", "繁體中文", "ENGLISH", "日本語"],
				},
			},
		],
		//音量
		volume : [
			{
				text : "全局音量",
				option : {
					type : menu_page2_option.line,
					list : [],
				},
			}, {
				text : "音效音量",
				option : {
					type : menu_page2_option.line,
					list : [],
				},
			}, {
				text : "背景音乐",
				option : {
					type : menu_page2_option.line,
					list : [],
				},
			},
		],
		//按钮
		buttons : [
			"初始化",
			"返回",
		]
	}
	#endregion
	#region 任务
	global.txt_menu[3]={
		
	}
	#endregion
	#region 技能
	global.txt_menu[4]={
		
	}
	#endregion
}