event_inherited();
enemy=noone;
item=1;
DEF=0.5;
if scr_mode_Is_easy() 
	DEF*=1.5;
bs=-1; //当前boss编号
#region 继承配置项
/// @arg enemy_prick=1
enemy_prick=0; //0无视尖刺，1碰尖刺爆
/// @arg death_xscale=1
death_xscale=false; //是否使用受伤对准的死亡方向
/// @arg auto_xscale=1
auto_xscale=false; //镜头外自动朝向玩家
/// @arg push_fly=0
push_fly=2; //是否被击飞，0为击中即飞且空血，1为空血即飞，2为不飞，3为击中即飞但不空血
/// @arg injure_back=true
injure_back=false; //受伤是否被击退
/// @arg injure_elementback=true
injure_elementback=false; //属性是否被击退
/// @arg injure_elementfall=true
injure_elementfall=false; //飞行属性被属性击中是否下落
/// @arg undm_push=true
undm_push=false; //无敌状态下能被击飞
/// @arg death_boom=false
death_boom=false; //死亡是否立刻爆炸
/// @arg death_repeat=1
death_repeat=false; //死亡后复活
/// @arg out_reflash=1
out_reflash=false; //出镜头刷新
/// @arg untime_set=0
untime_set=90; //无敌时间设定
/// @arg use_speed_system=1
use_speed_system=true; //是否采用运动系统
/// @arg use_death_system=1
use_death_system=false; //是否采用死亡系统
/// @trans_spd=true
//trans_spd=true; //是否收到传送带影响
/// @fire_boom=true
//fire_boom=false; //碰到燃烧的火是否爆炸
/// @element_size=1
//element_size=2; //属性特效尺寸
view_edge=-1
#endregion

#region 特有变量
is_war_boss=true; //是本场战斗的BOSS
use_death_system_boss=true;
action_round=0; //技能轮回
injure=0; //受伤状态
injure_time=0; 
injure_time_up=60; //受伤动作持续时间
hpdmged=0; //上次被攻击时减血量
boom=0; //爆炸时候的进度
boom_time=0; //爆炸计算
boom_white=noone; //爆炸时使用的白布
#endregion

#region 房间坐标转换
_xl=0
_xr=room_width
_yt=0
_yb=room_height
rx=x
ry=y
rpos=false; //是否使用r坐标计算
#endregion

used_skils=[]; //使用过的技能
#region 函数
/// desc 可以分配动作
action_distribution=function() {
	if global.boss_war=1
	&& global.operate=1
	&& injure=0
	&& action<1 && action>=0
		return true
	else 
		return false
}
/// @desc 技能是否全部用过
/// @arg actions 参与的动作变量
skill_useall=function(acts) {
	if(action<1) return false;
	//没使用过的技能，不拦截
	if(!in(action,used_skils)) {
		return false;
	}
	//使用过的技能，如果还有未使用技能，则拦截
	else{
		for(var i=0;i<array_length(acts);i++){
			if(!in(acts[i],used_skils)) 
				return true;
		}
		return false;
	}
}
/// @arg 将使用的技能加入到used_skils中
skill_addary=function() {
	if in(action,used_skils) return;
	else array_push(used_skils,action)
}
//血量对标
globalhp_sync=function() {
	global.boss_hp=hp
}
//精灵帧数调整
sprspd_adjust=function() {}
//开始爆炸
boom_start=function() {
	can_dmg=false;
	have_dmg=false;
	boom=1;
}
//爆炸开始时发生
boss_hp0_trigger=function() {
	
}
//爆炸结束时发生
boom_trigger = function() {}
//绘制属性效果
drawElementEffect = function() {}
#endregion