function scr_txt_view(){
global.txt_view_gamekey={
	menu : [
		{
			txt : "↑",
			key : "up_key",
			joy : function() {return undefined},
		}, {
			txt : "↓",
			key : "down_key",
			joy : function() {return undefined},
		}, {
			txt : "←",
			key : "left_key",
			joy : function() {return undefined},
		}, {
			txt : "→",
			key : "right_key",
			joy : function() {return undefined},
		}, {
			txt : "确认",
			key : "A_key",
			joy : function() {
				if global.joy_ab_invert==0 return gp_a
				else return gp_b
			},
		}, {
			txt : "取消",
			key : "B_key",
			joy : function() {
				if global.joy_ab_invert==0 return gp_b
				else return gp_a
			},
		}, {
			txt : "左切页",
			key : "L_key",
			joy : function() {return gp_l},
		}, {
			txt : "右切页",
			key : "R_key",
			joy : function() {return gp_r},
		}, {
			txt : "回到舞台",
			key : "start_key",
			joy : function() {return gp_start},
		}, 
	],
	otherMenu : [
		{
			txt : "↑",
			key : "up_key",
			joy : function() {return undefined},
		}, {
			txt : "↓",
			key : "down_key",
			joy : function() {return undefined},
		}, {
			txt : "←",
			key : "left_key",
			joy : function() {return undefined},
		}, {
			txt : "→",
			key : "right_key",
			joy : function() {return undefined},
		}, {
			txt : "确认",
			key : "A_key",
			joy : function() {
				if global.joy_ab_invert==0 return gp_a
				else return gp_b
			},
		}, {
			txt : "取消",
			key : "B_key",
			joy : function() {
				if global.joy_ab_invert==0 return gp_b
				else return gp_a
			},
		}, 
	],
	stage : [
		{
			txt : "↑",
			key : "up_key",
			joy : function() {return undefined},
		}, {
			txt : "↓",
			key : "down_key",
			joy : function() {return undefined},
		}, {
			txt : "←",
			key : "left_key",
			joy : function() {return undefined},
		}, {
			txt : "→",
			key : "right_key",
			joy : function() {return undefined},
		}, {
			txt : "主武器",
			key : "att_key",
			joy : function() {return "att_joy"},
		}, {
			txt : "副武器",
			key : "sub_key",
			joy : function() {return "sub_joy"},
		}, {
			txt : "跳跃",
			key : "jump_key",
			joy : function() {return "jump_joy"},
		}, {
			txt : "冲刺",
			key : "dash_key",
			joy : function() {return "dash_joy"},
		}, {
			txt : "换卡",
			key : "trans_key",
			joy : function() {return "trans_joy"},
		}, {
			txt : "快切左",
			key : "tformL_key",
			joy : function() {return "tformL_joy"},
		}, {
			txt : "快切右",
			key : "tformR_key",
			joy : function() {return "tformR_joy"},
		}, {
			txt : "援护技",
			key : "true_key",
			joy : function() {return "true_joy"},
		}, {
			txt : "菜单",
			key : "start_key",
			joy : function() {return gp_start},
		}, 
	],
}
}