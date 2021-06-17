// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enmus(){
	#region 元素
	enum ELEMENTS{
		none,
		fire,
		ice,
		elec,
	}
	#endregion
	#region 攻击方式
	enum ATK_TYPE{
		bullet,
		cut,
		push,
		through,
		absorb,
		pushup,
		pushdown,
		frozen,
	}
	#endregion
	#region 增益buff
	enum BUFF {
		none,
	}
	#endregion
	#region 负面buff
	enum DEBUFF {
		none,
		overheated, //火-过热无法蓄力
		frozen, //冰-冻结
		losses, //雷-泄露
		slow, //迟缓
	}
	#endregion
	#region 语言
	enum LANG{
		CHS = 0,//简体中文
		CHT = 1,//繁體中文
		ENG = 2,//英语
		JPN = 3,//日语
	}
	#endregion
	#region 形态
	enum PLAYER_MODEL{
		HU = 0,
		ARMOR = 1,
		YANZX = 2, //燕逐晓
		ice1 = 3,
		elec = 4,
		none = 5,
		fire2 = 6,
		ICE = 7,
		TAILS = 8,
		none2 = 9,
		white = 10,
	}
	#endregion
	#region 菜单每一页
	enum MENU {
		STATUS = 0,
		ITEM = 1,
		OPTION = 2,
		MISSION = 3,
		SKILL = 4,
	}
	#endregion
	#region 对话头像类型
	enum TALK_SHOTO {
		player,
		boss,
		npc,
	}
	enum TALK_INX {
		both,
		up,
		down,
	}
	enum PLAYER_SHOTO {
		normal, //平常
		beiShang, //悲伤
		chaoFeng, //嘲讽
		chaoFeng2, //嘲讽2
		huangZhang, //慌张
		jianDing, //坚定
		jingXi, //惊喜
		kaiXin, //开心
		kuMen, //苦闷
		meiShuiXing, //没睡醒
		meiShuiXing2, //没睡醒2
		fenNu, //愤怒
		weiXiao, //微笑
		wuNai, //无奈
		yiHuo, //疑惑
		ziXin, //自信
	}
	#endregion
	#region 道具
	enum ITEM {
		A,
		B,
		C,
	}
	enum ITEMA_TYPE {
		OTHER,
		HP,
		MP,
		RTANK,
	}
	enum ITEMB_STATUS {
		null,
		close,
		open,
	}
	enum ITEMA {
		milk, //牛奶
		candy, //糖果
		energy, //能源填充装置
		hpup,
		mpup, 
		rtank, //R罐
		byte, //插槽
		
	}
	enum ITEMB {
		dbjump, //二段跳
		airdash, //空冲
		glide, //滑翔
		defineBack, //防御击退
		invinEx, //无敌延长
		prickGuard, //陷阱防护
		invinDash, //无敌冲刺
		chargeQuick, //快速蓄力
		autoRecover, //自动恢复
		supportGain, //羁绊加成
		nonslip, //防滑
		fastRun, //疾跑
		overload, //超载强化
		
	}
	enum ITEMC {
		belt, //腰带
		esGun, //es能量手枪
		esSaber, //es剑
		starGuard, //星守
		
	}
	#endregion
	#region 任务
	enum MISSION_TYPE {
		main,
		sub
	}
	enum MISSION_STATIS {
		unstart = 0,
		inProcess = 1,
		waitReport = 2,
		complete = 3,
	}
	#endregion
	#region BOSS
	enum PLAYER_SKILL {
		flyChop = 0,
		
	}
	#endregion
}