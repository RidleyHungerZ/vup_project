function anykey_check() {
	if keystate_check(global.Left_state)
	|| keystate_check(global.Right_state)
	|| keystate_check(global.Up_state)
	|| keystate_check(global.Down_state)
	|| keystate_check(global.A_state)
	|| keystate_check(global.B_state)
	|| keystate_check(global.X_state)
	|| keystate_check(global.Y_state)
	|| keystate_check(global.L_state)
	|| keystate_check(global.R_state)
	|| keystate_check(global.Select_state)
	|| keystate_check(global.Start_state)
	|| keystate_check(global.att_state)
	|| keystate_check(global.sub_state)
	|| keystate_check(global.dash_state)
	|| keystate_check(global.jump_state)
	|| keystate_check(global.true_state)
	|| keystate_check(global.select_state)
	|| keystate_check(global.tformL_state)
	|| keystate_check(global.tformR_state)
		return true
	else return false
}
function anykey_pressed() {
	if keystate_check_pressed(global.Left_state)
	|| keystate_check_pressed(global.Right_state)
	|| keystate_check_pressed(global.Up_state)
	|| keystate_check_pressed(global.Down_state)
	|| keystate_check_pressed(global.A_state)
	|| keystate_check_pressed(global.B_state)
	|| keystate_check_pressed(global.X_state)
	|| keystate_check_pressed(global.Y_state)
	|| keystate_check_pressed(global.L_state)
	|| keystate_check_pressed(global.R_state)
	|| keystate_check_pressed(global.Select_state)
	|| keystate_check_pressed(global.Start_state)
	|| keystate_check_pressed(global.att_state)
	|| keystate_check_pressed(global.sub_state)
	|| keystate_check_pressed(global.dash_state)
	|| keystate_check_pressed(global.jump_state)
	|| keystate_check_pressed(global.true_state)
	|| keystate_check_pressed(global.select_state)
	|| keystate_check_pressed(global.tformL_state)
	|| keystate_check_pressed(global.tformR_state)
		return true
	else return false
}
