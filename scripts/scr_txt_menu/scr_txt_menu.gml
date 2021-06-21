function scr_txt_menu(){
	var page
	#region 状态
	page=0
	global.txt_menu[page]={
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
						"插入【ICE】卡片",
						"插入【塔尔斯Tails】卡片",
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
						"按确认键选择离开该区域",
						"请选择要回退的目标：",
						"当前无法返回行动据点！",
						"当前无法返回标题画面！",
					],
					itemdesc : [
						"行动据点",
						"标题画面"
					]
				},
			]
		}
	}
	#endregion
	#region 道具
	page=1
	global.txt_menu[page]={
		items : []
	}
	#region 消耗品
	global.txt_menu[page].items[ITEM.A]={
		name : "消耗品",
		desc : "一次性物品，使用后会消失\n能进行应急补充",
		list : [],
	}
	global.txt_menu[page].items[ITEM.A].list[ITEMA.milk]={
		name : "牛奶",
		desc : "恢复50%生命值",
		type : ITEMA_TYPE.HP,
		value: 0.5,
	}
	global.txt_menu[page].items[ITEM.A].list[ITEMA.candy]={
		name : "糖果",
		desc : "恢复50%SP值",
		type : ITEMA_TYPE.MP,
		value: 0.5,
	}
	global.txt_menu[page].items[ITEM.A].list[ITEMA.energy]={
		name : "能源填充装置",
		desc : "补充满一个R罐",
		type : ITEMA_TYPE.RTANK,
		value: 1,
	}
	global.txt_menu[page].items[ITEM.A].list[ITEMA.hpup]={
		name : "生命增幅装置",
		desc : "提高生命上限8点",
		type : ITEMA_TYPE.OTHER,
		value: 8,
	}
	global.txt_menu[page].items[ITEM.A].list[ITEMA.mpup]={
		name : "ESP增幅装置",
		desc : "提升能量上限8点",
		type : ITEMA_TYPE.OTHER,
		value: 8,
	}
	global.txt_menu[page].items[ITEM.A].list[ITEMA.rtank]={
		name : "备用能源R罐",
		desc : "获得一个能存储生命能量的R罐",
		type : ITEMA_TYPE.OTHER,
		value: 8,
	}
	global.txt_menu[page].items[ITEM.A].list[ITEMA.byte]={
		name : "装备内存扩展",
		desc : "提高装备装载内存上限一格",
		type : ITEMA_TYPE.OTHER,
		value: 1,
	}
	#endregion
	#region 装备品
	global.txt_menu[page].items[ITEM.B]={
		name : "装备品",
		desc : "可拆卸的强化装备，\n会强化某方面的能力",
		tag  : "◆",
		exmsg: "不能与%1$同时装备",
		list : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.dbjump]={
		name : "二段跳",
		desc : "空中可以进行一次跳跃",
		byte : 6,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.airdash]={
		name : "空中冲刺",
		desc : "空中可以进行一次冲刺",
		byte : 6,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.glide]={
		name : "悬浮缓落",
		desc : "空中可以进入缓慢下落状态",
		byte : 6,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.defineBack]={
		name : "防御击退",
		desc : "受伤时不会后退",
		byte : 5,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.invinEx]={
		name : "无敌扩展",
		desc : "无敌时间延长1.5倍",
		byte : 6,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.prickGuard]={
		name : "陷阱防护",
		desc : "即死陷阱变为受伤",
		byte : 8,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.invinDash]={
		name : "无敌冲刺",
		desc : "冲刺时不会受伤",
		byte : 5,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.chargeQuick]={
		name : "快速蓄力",
		desc : "蓄力时间缩短25%",
		byte : 6,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.autoRecover]={
		name : "自动恢复",
		desc : "站立不动时恢复生命值，\n1秒钟恢复1点",
		byte : 4,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.supportGain]={
		name : "羁绊增幅",
		desc : "获得的羁绊点数增加25%",
		byte : 5,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.nonslip]={
		name : "防滑",
		desc : "冰面和风中不会打滑",
		byte : 4,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.fastRun]={
		name : "疾跑",
		desc : "跑步速度加快30%",
		byte : 3,
		exclude : [],
	}
	global.txt_menu[page].items[ITEM.B].list[ITEMB.overload]={
		name : "超载骑士",
		desc : "超载时攻击力提升50%，\n受到伤害提高50%",
		byte : 18,
		exclude : [],
	}
	#endregion
	#region 贵重品
	global.txt_menu[page].items[ITEM.C]={
		name : "贵重品",
		desc : "任务或剧情需要用到的道具，\n十分珍贵，无法主动使用",
		list : [],
	}
	global.txt_menu[page].items[ITEM.C].list[ITEMC.belt]={
		name : "虚拟驱动器",
		desc : "物语stor托付的货物，\n似乎对『NEO巴比伦』而言非常重要",
	}
	global.txt_menu[page].items[ITEM.C].list[ITEMC.esGun]={
		name : "ES能量手枪",
		desc : "基础武器，可以三连发",
	}
	global.txt_menu[page].items[ITEM.C].list[ITEMC.esSaber]={
		name : "ES能量剑刃",
		desc : "基础武器，可以近身造成伤害",
	}
	global.txt_menu[page].items[ITEM.C].list[ITEMC.starGuard]={
		name : "星之守护",
		desc : "受到足以死亡的伤害时发动保护，\n避免死亡并回复1点生命值，\n使用后消失",
	}
	#endregion
	#endregion
	#region 设置
	page=2
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
	global.txt_menu[page]={
		//按键
		keyboards : {
			name : "按键",
			items : [
				{
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
				}, {
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
						list : ["无", "模糊", "扫描线"], //, "柔化"
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
	page=3
	global.txt_menu[page]={
		main : {
			name : "主线任务",
			desc : "",
			list : []
		},
		sub : {
			name : "支线任务",
			desc : "",
			list : []
		},
		reward : {
			desc : "任务报酬：",
			es : "x",
			item : [
				"消耗品：", 
				"装备品：", 
				"贵重品：",
			],
		},
		status : {
			desc : "当前任务状态：",
			list : [],
		}
	}
	global.txt_menu[page].status.list[MISSION_STATIS.unstart]="未开始"
	global.txt_menu[page].status.list[MISSION_STATIS.inProcess]="进行中"
	global.txt_menu[page].status.list[MISSION_STATIS.waitReport]="待汇报"
	global.txt_menu[page].status.list[MISSION_STATIS.complete]="已完成"
	#region 主线任务
	global.txt_menu[page].main.list[0]={
		name : "查看资源管理所受损情况",
		desc : "资源管理所确认遭受到不明暴乱袭击，\n需要前往仓库大门位置确认具体情况。",
		reward : {
			es : 300,
			item : [],
		},
	}
	#endregion
	#region 支线任务
	global.txt_menu[page].sub.list[0]={
		name : "测试支线0",
		desc : "测试支线0desc",
		reward : {
			es : 0,
			item : [
				[ITEM.A, ITEMA.milk],
				[ITEM.A, ITEMA.rtank],
			],
		},
	}
	global.txt_menu[page].sub.list[1]={
		name : "测试支线1",
		desc : "测试支线1desc",
		reward : {
			es : 150,
			item : [
				[ITEM.B, ITEMB.overload],
			],
		},
	}
	#endregion
	#endregion
	#region 技能
	page=4
	global.txt_menu[page]={
		skills : {
			human : [
				{
					txt : "爬行",
					desc : "站立时按下键可以蹲下，\n此时按左右键可以爬行，\n可以爬过狭窄的缝隙",
					trim : function(){return true;},
				}, {
					txt : "射击",
					desc : "按攻击键发射子弹，\n最多可连续发射三枚子弹",
					trim : function(){return true;},
				},
			],
			armor : [
				{
					txt : "冲刺",
					desc : "按冲刺键或快速按两下方向键，\n可以进行冲刺并进入冲刺状态，\n可以降低身位躲避部分攻击，\n冲刺状态下跳跃时水平速度会大幅提升",
					trim : function(){return true;},
				}, {
					txt : "踢墙跳",
					desc : "接触墙壁时按跳键，可以跳起，\n按住冲刺键发动，水平速度会更快",
					trim : function(){return true;},
				}, {
					txt : "速降飞踢",
					desc : "按住下键按跳跃键发动，\n会快速向下方降下，击中物体会弹飞，\n弹飞过程中处于无敌状态",
					trim : function(){return true;},
				}, {
					txt : "斜下飞踢",
					desc : "按住下键和左右键按跳跃键，\n会快速向斜下方降下，击中物体会弹飞，\n弹飞过程中处于无敌状态",
					trim : function(){return true;},
				}, {
					txt : "斩击",
					desc : "按攻击键发动近身攻击，\n站立时连续按可发动三段斩，\n走路、冲刺、空中等动作时亦可发动",
					trim : function(){return true;},
				}, {
					txt : "蓄力斩",
					desc : "按住攻击键蓄力到黄色状态，\n在地面时释放，\n可发动大范围斩击，\n有足够ES值时可附加卡片属性",
					trim : function(){return true;},
				}, {
					txt : "回旋斩",
					desc : "按住攻击键蓄力到黄色状态，\n在空中时释放，\n可发动圆形范围斩击，\n连续按攻击键会持续旋转造成伤害，\n有足够ES值时可附加卡片属性",
					trim : function(){return true;},
				}, {
					txt : "射击",
					desc : "按副武器键发射子弹，\n最多可连续发射三枚子弹",
					trim : function(){return true;},
				}, {
					txt : "一段蓄力射击",
					desc : "按住副武器键蓄力到出现红色蓄力光时释放，\n子弹伤害提高，且具有穿透性",
					trim : function(){return !in(global.model, [PLAYER_MODEL.TAILS]);},
				}, {
					txt : "二段蓄力射击",
					desc : "按住副武器键蓄力到出现黄色蓄力光时释放，\n子弹伤害提高，且具有穿透性，\n有足够ES值时可附加卡片属性",
					trim : function(){return !in(global.model, [PLAYER_MODEL.fire2, PLAYER_MODEL.ICE, PLAYER_MODEL.TAILS, PLAYER_MODEL.none2]);},
				}, {
					txt : "冰之泪",
					desc : "副武器二段蓄力释放，\n会根据剩余ES值\n发射最多六枚环绕的冰锥，\n冰锥命中敌人后破裂，\n释放时若已存在冰锥，\n则会将原来的冰锥发射出去",
					trim : function(){return global.model==PLAYER_MODEL.ICE;},
				}, {
					txt : "魔导镭射",
					desc : "按住副武器键蓄力到出现蓄力光时释放，\n一段蓄力会发射一枚魔法弹，\n之后镭射球会朝附近的敌人发射镭射，\n二段蓄力时会根据剩余ES值\n发射最多三枚魔法弹",
					trim : function(){return global.model==PLAYER_MODEL.TAILS;},
				}, {
					txt : "二段跳",
					desc : "装备二段跳后，在空中按跳键，\n可以进行一次额外跳跃",
					trim : function(){return scr_itemb_isopen(ITEMB.dbjump)},
				}, {
					txt : "空中冲刺",
					desc : "装备空中冲刺后，在空中按冲刺键，\n可以在空中进行一次冲刺",
					trim : function(){return scr_itemb_isopen(ITEMB.airdash)},
				}, {
					txt : "滑翔",
					desc : "装备滑翔后，在空中按跳键，\n会进入滑翔状态，进行缓速下落，\n再按一次跳键解除状态，\n在水中无法使用",
					trim : function(){return scr_itemb_isopen(ITEMB.glide)},
				}, {
					txt : "升龙斩",
					desc : "地面按住上键时按攻击键发动，\n在地面跃起向前上方攻击",
					trim : function(){return scr_player_exskill_isget(PLAYER_SKILL.flyChop) && global.model!=PLAYER_MODEL.YANZX;},
				}, {
					txt : "烈焰升龙斩",
					desc : "地面按住上键时按攻击键发动，\n在地面跃起向前上方攻击，\n攻击为火属性",
					trim : function(){return scr_player_exskill_isget(PLAYER_SKILL.flyChop) && global.model==PLAYER_MODEL.YANZX;},
				}, 
			],
			special : [
				
			],
			support : [
				
			]
		}
	}
	#endregion
}