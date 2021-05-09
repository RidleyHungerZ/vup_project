/// @arg posxy
/// @arg hcon
/// @arg vcon
function scr_view_freedom(posxy, hcon, vcon) {
	var objx=posxy.x,
		objy=posxy.y,
		vw=view_wpos(0),
		vh=view_hpos(0),
		halfw=vw/2,
		halfh=vh/2;

	with(obj_view){
	    if global.view_control=0{
		#region 横坐标控制区
			if hcon{
	        #region 自由活动空间
		        if objx>=global.room_xl+vw/2 && objx<=global.room_xr-vw/2{
		            if view_xpos(0)<objx-halfw{
		                if global.room_change_xr=1{
		                    if view_xpos(0)<objx-halfw-224
		                        view_addx(10+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-192
		                        view_addx(9+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-160
		                        view_addx(8+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-128
		                        view_addx(7+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-96
		                        view_addx(6+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-64
		                        view_addx(5+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-48
		                        view_addx(4+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-32
		                        view_addx(3+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-16
		                        view_addx(2+global.player_dx)
		                    else if view_xpos(0)<objx-halfw-8
		                        view_addx(1+global.player_dx)
		                    else{
		                        view_setx(objx-halfw)
								global.room_change_xr=0
							}
		                }
		                else if global.room_change_xr=0
		                    view_setx(objx-halfw)
		            }
		            else if view_xpos(0)>objx-halfw{
		                if global.room_change_xl=1{
		                    if view_xpos(0)>objx-halfw+224
		                        view_addx(-10+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+192
		                        view_addx(-9+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+160
		                        view_addx(-8+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+128
		                        view_addx(-7+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+96
		                        view_addx(-6+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+64
		                        view_addx(-5+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+48
		                        view_addx(-4+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+32
		                        view_addx(-3+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+16
		                        view_addx(-2+global.player_dx)
		                    else if view_xpos(0)>objx-halfw+8
		                        view_addx(-1+global.player_dx)
		                    else{
								view_setx(objx-halfw)
								global.room_change_xl=0
							}
		                }
		                else if global.room_change_xl=0
		                    view_setx(objx-halfw)
		            }
		            else{
		                global.room_change_xl=0
						global.room_change_xr=0
		                view_setx(objx-halfw)
		            }
		        }
			#endregion
	        #region 小房间左侧半个真空期
		        else if /*objx>=global.room_xl && */objx<global.room_xl+vw/2{
		            if view_xpos(0)>global.room_xl+halfw
		                view_addx(-10)
		            else if view_xpos(0)>global.room_xl+224
		                view_addx(-9)
		            else if view_xpos(0)>global.room_xl+192
		                view_addx(-8)
		            else if view_xpos(0)>global.room_xl+160
		                view_addx(-7)
		            else if view_xpos(0)>global.room_xl+128
		                view_addx(-6)
		            else if view_xpos(0)>global.room_xl+96
		                view_addx(-5)
		            else if view_xpos(0)>global.room_xl+64
		                view_addx(-4)
		            else if view_xpos(0)>global.room_xl+32
		                view_addx(-3)
		            else if view_xpos(0)>global.room_xl+16
		                view_addx(-2)
		            else if view_xpos(0)>global.room_xl
		                view_addx(-1)
		        }
			#endregion
	        #region 小房间右侧半个真空期
		        else if objx>global.room_xr-vw/2/* && objx<=global.room_xr*/{
		            if view_xpos(0)<global.room_xr-vw-halfw
		                view_addx(10)
		            else if view_xpos(0)<global.room_xr-vw-224
		                view_addx(9)
		            else if view_xpos(0)<global.room_xr-vw-192
		                view_addx(8)
		            else if view_xpos(0)<global.room_xr-vw-160
		                view_addx(7)
		            else if view_xpos(0)<global.room_xr-vw-128
		                view_addx(6)
		            else if view_xpos(0)<global.room_xr-vw-96
		                view_addx(5)
		            else if view_xpos(0)<global.room_xr-vw-64
		                view_addx(4)
		            else if view_xpos(0)<global.room_xr-vw-32
		                view_addx(3)
		            else if view_xpos(0)<global.room_xr-vw-16
		                view_addx(2)
		            else if view_xpos(0)<global.room_xr-vw
		                view_addx(1)
		        }
			#endregion
	        #region 分段小房间（进入）
		        if objx>=global.room_xl && objx<=global.room_xr{
		            if view_xpos(0)<=global.room_xl{
		                if view_xpos(0)<global.room_xl-halfw
		                    view_addx(10)
		                else if view_xpos(0)<global.room_xl-224
		                    view_addx(9)
		                else if view_xpos(0)<global.room_xl-192
		                    view_addx(8)
		                else if view_xpos(0)<global.room_xl-160
		                    view_addx(7)
		                else if view_xpos(0)<global.room_xl-128
		                    view_addx(6)
		                else if view_xpos(0)<global.room_xl-96
		                    view_addx(5)
		                else if view_xpos(0)<global.room_xl-64
		                    view_addx(4)
		                else if view_xpos(0)<global.room_xl-32
		                    view_addx(3)
		                else if view_xpos(0)<global.room_xl-16
		                    view_addx(2)
		                else if view_xpos(0)<global.room_xl
		                    view_addx(1)
		            }
		            else if view_xpos(0)>=global.room_xr-vw{
		                if view_xpos(0)>global.room_xr-vw+halfw
		                    view_addx(-10)
		                else if view_xpos(0)>global.room_xr-vw+224
		                    view_addx(-9)
		                else if view_xpos(0)>global.room_xr-vw+192
		                    view_addx(-8)
		                else if view_xpos(0)>global.room_xr-vw+160
		                    view_addx(-7)
		                else if view_xpos(0)>global.room_xr-vw+128
		                    view_addx(-6)
		                else if view_xpos(0)>global.room_xr-vw+96
		                    view_addx(-5)
		                else if view_xpos(0)>global.room_xr-vw+64
		                    view_addx(-4)
		                else if view_xpos(0)>global.room_xr-vw+32
		                    view_addx(-3)
		                else if view_xpos(0)>global.room_xr-vw+16
		                    view_addx(-2)
		                else if view_xpos(0)>global.room_xr-vw
		                    view_addx(-1)
		            }
		            if global.room_xr-global.room_xl<=512{
		                if view_xpos(0)>global.room_xr-vw
		                    view_addx(-1)
		                else if view_xpos(0)<global.room_xl
		                    view_addx(1)
		                else
		                    view_setx(global.room_xl)
                    
		                if view_xpos(0)>global.room_xr-vw && view_xpos(0)<global.room_xr-vw+1
		                    view_setx(global.room_xr-vw)
		                if view_xpos(0)<global.room_xl && view_xpos(0)>global.room_xl-1
		                    view_setx(global.room_xl)
                
		            }
		        }
			#endregion
			}
		#endregion
		#region 纵坐标控制区
			if vcon{
			#region 自由活动空间
		        if objy>=global.room_yt+vh/2 && objy<=global.room_yb-vh/2{
		            if global.player_reversed=0{
		                if view_ypos(0)<objy-halfh{
		                    if view_ypos(0)<objy-halfh-144
		                        view_addy(16+global.player_dy)
		                    else if view_ypos(0)<objy-halfh-128
		                        view_addy(16)
		                    else if view_ypos(0)<objy-halfh-112
		                        view_addy(15)
		                    else if view_ypos(0)<objy-halfh-104
		                        view_addy(14)
		                    else if view_ypos(0)<objy-halfh-96
		                        view_addy(13)
		                    else if view_ypos(0)<objy-halfh-88
		                        view_addy(12)
		                    else if view_ypos(0)<objy-halfh-80
		                        view_addy(11)
		                    else if view_ypos(0)<objy-halfh-64
		                        view_addy(10)
		                    else if view_ypos(0)<objy-halfh-56
		                        view_addy(9)
		                    else if view_ypos(0)<objy-halfh-48
		                        view_addy(8)
		                    else if view_ypos(0)<objy-halfh-40
		                        view_addy(7)
		                    else if view_ypos(0)<objy-halfh-32
		                        view_addy(6)
		                    else if view_ypos(0)<objy-halfh-24
		                        view_addy(5)
		                    else if view_ypos(0)<objy-halfh-16
		                        view_addy(4)
		                    else if view_ypos(0)<objy-halfh-12
		                        view_addy(3)
		                    else if view_ypos(0)<objy-halfh-8
		                        view_addy(2)
		                    else if view_ypos(0)<objy-halfh-4
		                        view_addy(1)
		                    else
		                        view_sety(objy-halfh)
		                }
		                else if view_ypos(0)>objy-halfh{
		                    if view_ypos(0)<objy-halfh+8
		                        view_sety(objy-halfh)
		                    else if view_ypos(0)<objy-halfh+16
		                        view_addy(-1)
		                    else if view_ypos(0)<objy-halfh+24
		                        view_addy(-2)
		                    else if view_ypos(0)<objy-halfh+32
		                        view_addy(-3)
		                    else if view_ypos(0)<objy-halfh+48
		                        view_addy(-4)
		                    else if view_ypos(0)<objy-halfh+80
		                        view_addy(-5+global.player_dy)
		                    else if view_ypos(0)<objy-halfh+112
		                        view_addy(-6+global.player_dy)
		                    else if view_ypos(0)<objy-halfh+128
		                        view_addy(-7+global.player_dy)
		                    else
		                        view_addy(-8+global.player_dy)
		                }
		                else
		                    view_sety(objy-halfh)
		            }
		            else if global.player_reversed=1{
		                if view_ypos(0)>objy-halfh{
		                    if view_ypos(0)>objy
		                        view_addy(-16+global.player_dy)
		                    else if view_ypos(0)>objy-4
		                        view_addy(-16)
		                    else if view_ypos(0)>objy-8
		                        view_addy(-15)
		                    else if view_ypos(0)>objy-12
		                        view_addy(-14)
		                    else if view_ypos(0)>objy-16
		                        view_addy(-13)
		                    else if view_ypos(0)>objy-24
		                        view_addy(-12)
		                    else if view_ypos(0)>objy-32
		                        view_addy(-11)
		                    else if view_ypos(0)>objy-40
		                        view_addy(-10)
		                    else if view_ypos(0)>objy-48
		                        view_addy(-9)
		                    else if view_ypos(0)>objy-56
		                        view_addy(-8)
		                    else if view_ypos(0)>objy-64
		                        view_addy(-7)
		                    else if view_ypos(0)>objy-72
		                        view_addy(-6)
		                    else if view_ypos(0)>objy-80
		                        view_addy(-5)
		                    else if view_ypos(0)>objy-88
		                        view_addy(-4)
		                    else if view_ypos(0)>objy-96
		                        view_addy(-3)
		                    else if view_ypos(0)>objy-112
		                        view_addy(-2)
		                    else if view_ypos(0)>objy-128
		                        view_addy(-1)
		                    else
		                        view_sety(objy-halfh)
		                }
		                if view_ypos(0)<objy-halfh{
		                    if view_ypos(0)>objy-halfh-8
		                        view_sety(objy-halfh)
		                    else if view_ypos(0)>objy-halfh-16
		                        view_addy(1)
		                    else if view_ypos(0)>objy-halfh-24
		                        view_addy(2)
		                    else if view_ypos(0)>objy-halfh-32
		                        view_addy(3)
		                    else if view_ypos(0)>objy-halfh-48
		                        view_addy(4)
		                    else if view_ypos(0)>objy-halfh-80
		                        view_addy(5+global.player_dy)
		                    else if view_ypos(0)>objy-halfh-112
		                        view_addy(6+global.player_dy)
		                    else if view_ypos(0)>objy-halfh-128
		                        view_addy(7+global.player_dy)
		                    else
		                        view_addy(8+global.player_dy)
		                }
		                else
		                    view_sety(objy-halfh)
		            }
		        }
			#endregion
			#region 小房间上方半个真空期
		        else if /*objy>global.room_yt && */objy<=global.room_yt+vh/2{
		            if view_ypos(0)>global.room_yt+halfh
		                view_addy(-17)
		            else if view_ypos(0)>global.room_yt+128
		                view_addy(-16)
		            else if view_ypos(0)>global.room_yt+112
		                view_addy(-15)
		            else if view_ypos(0)>global.room_yt+96
		                view_addy(-14)
		            else if view_ypos(0)>global.room_yt+88
		                view_addy(-13)
		            else if view_ypos(0)>global.room_yt+80
		                view_addy(-12)
		            else if view_ypos(0)>global.room_yt+72
		                view_addy(-11)
		            else if view_ypos(0)>global.room_yt+64
		                view_addy(-10)
		            else if view_ypos(0)>global.room_yt+56
		                view_addy(-9)
		            else if view_ypos(0)>global.room_yt+48
		                view_addy(-8)
		            else if view_ypos(0)>global.room_yt+40
		                view_addy(-7)
		            else if view_ypos(0)>global.room_yt+32
		                view_addy(-6)
		            else if view_ypos(0)>global.room_yt+24
		                view_addy(-5)
		            else if view_ypos(0)>global.room_yt+16
		                view_addy(-4)
		            else if view_ypos(0)>global.room_yt+12
		                view_addy(-3)
		            else if view_ypos(0)>global.room_yt+8
		                view_addy(-2)
		            else if view_ypos(0)>global.room_yt+4
		                view_addy(-1)
		        }
			#endregion
			#region 小房间下方半个真空期
		        else if objy>=global.room_yb-vh/2/* && objy<global.room_yb*/{
		            if view_ypos(0)<global.room_yb-vh-halfh
		                view_addy(17)
		            else if view_ypos(0)<global.room_yb-vh-128
		                view_addy(16)
		            else if view_ypos(0)<global.room_yb-vh-112
		                view_addy(15)
		            else if view_ypos(0)<global.room_yb-vh-96
		                view_addy(14)
		            else if view_ypos(0)<global.room_yb-vh-88
		                view_addy(13)
		            else if view_ypos(0)<global.room_yb-vh-80
		                view_addy(12)
		            else if view_ypos(0)<global.room_yb-vh-72
		                view_addy(11)
		            else if view_ypos(0)<global.room_yb-vh-64
		                view_addy(10)
		            else if view_ypos(0)<global.room_yb-vh-56
		                view_addy(9)
		            else if view_ypos(0)<global.room_yb-vh-48
		                view_addy(8)
		            else if view_ypos(0)<global.room_yb-vh-40
		                view_addy(7)
		            else if view_ypos(0)<global.room_yb-vh-32
		                view_addy(6)
		            else if view_ypos(0)<global.room_yb-vh-24
		                view_addy(5)
		            else if view_ypos(0)<global.room_yb-vh-16
		                view_addy(4)
		            else if view_ypos(0)<global.room_yb-vh-12
		                view_addy(3)
		            else if view_ypos(0)<global.room_yb-vh-8
		                view_addy(2)
					else if view_ypos(0)<global.room_yb-vh-4
		                view_addy(1)
		        }
			#endregion
	        #region 分段小房间（进入）
		        if objy>=global.room_yt && objy<=global.room_yb{
		            if view_ypos(0)<global.room_yt{
		                if view_ypos(0)<global.room_yt-halfh
		                    view_addy(17)
		                else if view_ypos(0)<global.room_yt-128
		                    view_addy(16)
		                else if view_ypos(0)<global.room_yt-112
		                    view_addy(15)
		                else if view_ypos(0)<global.room_yt-96
		                    view_addy(14)
		                else if view_ypos(0)<global.room_yt-88
		                    view_addy(13)
		                else if view_ypos(0)<global.room_yt-80
		                    view_addy(12)
		                else if view_ypos(0)<global.room_yt-72
		                    view_addy(11)
		                else if view_ypos(0)<global.room_yt-64
		                    view_addy(10)
		                else if view_ypos(0)<global.room_yt-56
		                    view_addy(9)
		                else if view_ypos(0)<global.room_yt-48
		                    view_addy(8)
		                else if view_ypos(0)<global.room_yt-40
		                    view_addy(7)
		                else if view_ypos(0)<global.room_yt-32
		                    view_addy(6)
		                else if view_ypos(0)<global.room_yt-24
		                    view_addy(5)
		                else if view_ypos(0)<global.room_yt-16
		                    view_addy(4)
		                else if view_ypos(0)<global.room_yt-12
		                    view_addy(3)
		                else if view_ypos(0)<global.room_yt-8
		                    view_addy(2)
						else if view_ypos(0)<global.room_yt-4
		                    view_addy(1)
		            }
		            else if view_ypos(0)>global.room_yb-vh{
		                if view_ypos(0)>global.room_yb-vh+halfh
		                    view_addy(-17)
		                else if view_ypos(0)>global.room_yb-vh+128
		                    view_addy(-16)
		                else if view_ypos(0)>global.room_yb-vh+112
		                    view_addy(-15)
		                else if view_ypos(0)>global.room_yb-vh+96
		                    view_addy(-14)
		                else if view_ypos(0)>global.room_yb-vh+88
		                    view_addy(-13)
		                else if view_ypos(0)>global.room_yb-vh+80
		                    view_addy(-12)
		                else if view_ypos(0)>global.room_yb-vh+72
		                    view_addy(-11)
		                else if view_ypos(0)>global.room_yb-vh+64
		                    view_addy(-10)
		                else if view_ypos(0)>global.room_yb-vh+56
		                    view_addy(-9)
		                else if view_ypos(0)>global.room_yb-vh+48
		                    view_addy(-8)
		                else if view_ypos(0)>global.room_yb-vh+40
		                    view_addy(-7)
		                else if view_ypos(0)>global.room_yb-vh+32
		                    view_addy(-6)
		                else if view_ypos(0)>global.room_yb-vh+24
		                    view_addy(-5)
		                else if view_ypos(0)>global.room_yb-vh+16
		                    view_addy(-4)
		                else if view_ypos(0)>global.room_yb-vh+12
		                    view_addy(-3)
		                else if view_ypos(0)>global.room_yb-vh+8
		                    view_addy(-2)
						else if view_ypos(0)>global.room_yb-vh+4
		                    view_addy(-1)
		            }
					if global.room_yb-global.room_yt<=vh{
			            if view_ypos(0)>global.room_yb-vh
			                view_addy(-1)
			            else if view_ypos(0)<global.room_yt
			                view_addy(1)
			            else
			                view_sety(global.room_yt)
                    
			            if view_ypos(0)>global.room_yb-vh && view_ypos(0)<global.room_yb-vh+1
			                view_sety(global.room_yb-vh)
			            if view_ypos(0)<global.room_yt && view_ypos(0)>global.room_yt-1
			                view_sety(global.room_yt)
			        }
		        }
			#endregion
		    }
		#endregion
		}
		//整个房间的掌控
		if view_xpos(0)<0
		    view_setx(0)
		else if view_xpos(0)>room_width-vw
		    view_setx(room_width-vw)
		if view_ypos(0)<0
		    view_sety(0)
		else if view_ypos(0)>room_height-vh
		    view_sety(room_height-vh)
	}
}
