event_inherited();
if !variable_instance_exists(id, "SS") SS=""
SS_open=asset_get_index(SS+"_open")
SS_opening=asset_get_index(SS+"_opening")
SS_close=asset_get_index(SS+"_close")
SS_closing=asset_get_index(SS+"_closing")
SS_bgs=asset_get_index(SS+"_bgs")
SE_open=se_door_open
SE_close=se_door_close
action=0
ready_open=false //满足只要按↑就能进入条件