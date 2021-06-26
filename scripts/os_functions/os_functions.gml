/// @desc 返回os类型
/// @arg os
function os_type_is(os) {
	switch os {
		case OS.PC:{
			if in(os_type,os_windows,os_uwp,os_macosx,os_linux,os_win8native) return true
			else return false
		}
		case OS.MOBILE:{
			if in(os_type,os_android,os_ios,os_winphone) return true
			else return false
		}
		case OS.HOST:{
			if in(os_type,os_ps3,os_ps4,os_psvita,os_xboxone,os_switch) return true
			else return false
		}
		case OS.NS:{
			if in(os_type,os_switch) return true
			else return false
		}
		case OS.PS:{
			if in(os_type,os_ps3,os_ps4,os_psvita) return true
			else return false
		}
		case OS.XBOX:{
			if in(os_type,os_xboxone) return true
			else return false
		}
	}
}
