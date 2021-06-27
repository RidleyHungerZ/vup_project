function scr_txt_view(){
global.txt_view_gamekey={
	menu : [
		{
			txt : "↑",
			key : "up_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "↓",
			key : "down_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "←",
			key : "left_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "→",
			key : "right_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "确认",
			key : "A_key",
			joy : function() {
				if global.joy_ab_invert==0 return gp_a
				else return gp_b
			},
			display : function() {return true},
		}, {
			txt : "取消",
			key : "B_key",
			joy : function() {
				if global.joy_ab_invert==0 return gp_b
				else return gp_a
			},
			display : function() {return true},
		}, {
			txt : "左切页",
			key : "L_key",
			joy : function() {return gp_l},
			display : function() {return true},
		}, {
			txt : "右切页",
			key : "R_key",
			joy : function() {return gp_r},
			display : function() {return true},
		}, {
			txt : "回到舞台",
			key : "start_key",
			joy : function() {return gp_start},
			display : function() {return true},
		}, 
	],
	otherMenu : [
		{
			txt : "↑",
			key : "up_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "↓",
			key : "down_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "←",
			key : "left_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "→",
			key : "right_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "确认",
			key : "A_key",
			joy : function() {
				if global.joy_ab_invert==0 return gp_a
				else return gp_b
			},
			display : function() {return true},
		}, {
			txt : "取消",
			key : "B_key",
			joy : function() {
				if global.joy_ab_invert==0 return gp_b
				else return gp_a
			},
			display : function() {return true},
		}, 
	],
	stage : [
		{
			txt : "↑",
			key : "up_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "↓",
			key : "down_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "←",
			key : "left_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "→",
			key : "right_key",
			joy : function() {return undefined},
			display : function() {return true},
		}, {
			txt : "主武器",
			key : "att_key",
			joy : function() {return "att_joy"},
			display : function() {return true},
		}, {
			txt : "副武器",
			key : "sub_key",
			joy : function() {return "sub_joy"},
			display : function() {return true},
		}, {
			txt : "跳跃",
			key : "jump_key",
			joy : function() {return "jump_joy"},
			display : function() {return true},
		}, {
			txt : "冲刺",
			key : "dash_key",
			joy : function() {return "dash_joy"},
			display : function() {return true},
		}, {
			txt : "换卡",
			key : "trans_key",
			joy : function() {return "trans_joy"},
			display : function() {return true},
		}, {
			txt : "快切左",
			key : "tformL_key",
			joy : function() {return "tformL_joy"},
			display : function() {return true},
		}, {
			txt : "快切右",
			key : "tformR_key",
			joy : function() {return "tformR_joy"},
			display : function() {return true},
		}, {
			txt : "援护技",
			key : "true_key",
			joy : function() {return "true_joy"},
			display : function() {return true},
		}, {
			txt : "菜单",
			key : "start_key",
			joy : function() {return gp_start},
			display : function() {return true},
		}, 
	],
}
}