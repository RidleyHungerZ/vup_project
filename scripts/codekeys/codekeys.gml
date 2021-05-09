/// @arg hdir
function codekey_Hdirect(hdir) {
	if hdir==1
		global.right=1
	else if hdir==-1
		global.left=1
	else{
		global.left=0
		global.right=0
	}
}
/// @arg vdir
function codekey_Vdirect(vdir) {
	if vdir==1
		global.down=1
	else if vdir==-1
		global.up=1
	else{
		global.up=0
		global.down=0
	}
}
/// @arg state
function codekey_attack(state) {
	global.att=state
}
/// @arg state
function codekey_jump(state) {
	global.jump=state
}
/// @arg state
function codekey_dash(state) {
	global.dash=state
}
/// @arg state
function codekey_sub(state) {
	global.sub=state
}
/// @arg state
function codekey_tformL(state) {
	global.tformL=state
}
/// @arg state
function codekey_tformR(state) {
	global.tformR=state
}
