function scr_txt_menu(){
	#region 状态
	global.txt_menu[0]={
		left : {
			PLAY_TIME : "游戏时间",
			CYBER_ES : "存在支持度点数",
		},
		right : {
			option : [
				{
					name : "卡片选择",
					desc : [
						"按确认键选择要插入的卡片",
						"当前状态无法改变卡片",
						"此卡片尚未获得",
					],
					itemdesc : [
						"拔出当前卡片",
						"插入基础形态卡片",
						"插入【燕逐晓】卡片",
						"插入3卡片",
						"插入4卡片",
						"插入5卡片",
						"插入6卡片",
						"插入7卡片",
						"插入8卡片",
						"插入9卡片",
						"插入白发卡片",
					]
				},
				{
					name : "武器选择",
					desc : [
						"按确认键变更主副武器",
						"没有副武器，无需变更",
					]
				},
				{
					name : "备用能源",
					desc : [
						"按确认键选择要使用的备用能源",
						"没有可供使用的备用能源",
						"当前没有必要使用备用能源",
						"当前选中备用能源量：%1$",
					]
				},
				{
					name : "紧急脱出",
					desc : [
						"按确认键选择离开该区域，返回基地",
					]
				},
			]
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
		keypad = 1,
		line = 2,
	}
	global.txt_menu[2]={
		//按键
		keyboards : {
			name : "按键",
			items : [
				{
					text : "上",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["up_key", gp_padu],
						onChange : function() {},
					},
				},{
					text : "下",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["down_key", gp_padd],
						onChange : function() {},
					},
				},{
					text : "左",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["left_key", gp_padl],
						onChange : function() {},
					},
				},{
					text : "右",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["right_key", gp_padr],
						onChange : function() {},
					},
				},{
					text : "主武器",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["att_key", "att_joy"],
						onChange : function() {},
					},
				}, {
					text : "副武器",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["sub_key", "sub_joy"],
						onChange : function() {},
					}
				}, {
					text : "跳跃",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["jump_key", "jump_joy"],
						onChange : function() {},
					},
				}, {
					text : "冲刺",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["dash_key", "dash_joy"],
						onChange : function() {},
					},
				}, {
					text : "切换卡片",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["trans_key", "trans_joy"],
						onChange : function() {},
					},
				}, {
					text : "快捷切卡(上一个)",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["tformL_key", "tformL_joy"],
						onChange : function() {},
					},
				}, {
					text : "快捷切卡(下一个)",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["tformR_key", "tformR_joy"],
						onChange : function() {},
					},
				}, {
					text : "援护技能",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["true_key", "true_joy"],
						onChange : function() {},
					},
				}, {
					text : "菜单",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["start_key", gp_start],
						onChange : function() {},
					},
				}, {
					text : "辅助菜单",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["select_key", gp_select],
						onChange : function() {},
					},
				}, {
					text : "菜单左切换",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["L_key", gp_l],
						onChange : function() {},
					},
				}, {
					text : "菜单右切换",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["R_key", gp_r],
						onChange : function() {},
					},
				}, {
					text : "确认",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["A_key", 
						function() {
							if global.joy_ab_invert==0 return gp_a
							else return gp_b
						}],
						onChange : function() {},
					},
				}, {
					text : "取消",
					option : {
						type : menu_page2_option.keypad,
						list : [],
						variable : ["B_key", 
						function() {
							if global.joy_ab_invert==0 return gp_b
							else return gp_a
						}],
						onChange : function() {},
					},
				},
			],
		},
		//指令
		orders : {
			name : "指令",
			items : [
				{
					text : "手柄ABXY倒置",
					option : {
						type : menu_page2_option.list,
						list : ["关闭", "开启"],
						variable : "joy_ab_invert",
						onChange : function() {},
					},
				}, {
					text : "副武器使用方式",
					option : {
						type : menu_page2_option.list,
						list : ["副武器键", "按住", "一键切换"],
						variable : "sub_type",
						onChange : function() {},
					},
				}, {
					text : "连打方向冲刺指令",
					option : {
						type : menu_page2_option.list,
						list : ["关闭", "开启"],
						variable : "dash_order",
						onChange : function() {},
					},
				}, {
					text : "界面系统提示",
					option : {
						type : menu_page2_option.list,
						list : ["关闭", "开启"],
						variable : "alert_type",
						onChange : function() {},
					},
				},
			],
		},
		//显示
		displays : {
			name : "显示",
			items : [
				{
					text : "全屏",
					option : {
						type : menu_page2_option.list,
						list : ["关闭", "开启"],
						variable : "full_screen",
						onChange : function() {},
					},
				}, {
					text :  "画面分辨率",
					option : {
						type : menu_page2_option.list,
						list : getWindowResolution(),
						variable : "resolution",
						onChange : function() {},
					},
				}, {
					text : "像素滤镜",
					option : {
						type : menu_page2_option.list,
						list : ["无", "模糊", "扫描线", "柔化"],
						variable : "pix_filter",
						onChange : function() {},
					},
				}, {
					text : "游戏语言",
					option : {
						type : menu_page2_option.list,
						list : ["简体中文", "繁體中文", "ENGLISH", "日本語"],
						variable : "language",
						onChange : function() {
							scr_txt()
						},
					},
				},
			]
		},
		//音量
		volume : {
			name : "音量",
			items : [
				{
					text : "全局音量",
					option : {
						type : menu_page2_option.line,
						list : [0, 1],
						variable : "volume_all",
						onChange : function() {},
					},
				}, {
					text : "音效音量",
					option : {
						type : menu_page2_option.line,
						list : [0, 1],
						variable : "volume_se",
						onChange : function() {},
					},
				}, {
					text : "背景音乐",
					option : {
						type : menu_page2_option.line,
						list : [0, 1],
						variable : "volume_bgm",
						onChange : function() {},
					},
				},
			]
		},
		//按键
		button : {
			init : {
				text : "初始化",
				code : 0,
			}, 
			back : {
				text : "返回",
				code : -1,
			}, 
			save : {
				text : "保存",
				code : 1,
			}
		}
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