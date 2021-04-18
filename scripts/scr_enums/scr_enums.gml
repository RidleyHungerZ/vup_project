// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enmus(){
	//元素
	enum ELEMENTS{
		none,
		fire,
		card4,
		card5,
		card6,
		card7,
		card8,
		card9,
		card10,
	}
	//攻击方式
	enum ATK_TYPE{
		bullet,
		cut,
		push,
		through,
		absorb,
		pushup,
		pushdown,
		frozen, //冰冻
	}
	//语言
	enum LANG{
		CHS = 0,//简体中文
		CHT = 1,//繁體中文
		ENG = 2,//英语
		JPN = 3,//日语
	}
	//形态
	enum PLAYER_MODEL{
		HU = 0,
		ARMOR = 1,
		YANZX = 2, //燕逐晓
	}
	// 菜单每一页
	enum MENU {
		STATUS = 0,
		ITEM = 1,
		OPTION = 2,
		MISSION = 3,
		SKILL = 4,
	}
}