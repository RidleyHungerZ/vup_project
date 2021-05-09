//专门渲染红色类型颜色，红色为设定值，其他颜色为移动色
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 colSet;//颜色设定0-1，a为亮度

void main()
{
	#region 清除饱和度
	vec3 saturation=vec3(0.0,0.0,0.0);//饱和度
	vec3 luminanceWeighting = vec3(0.2125, 0.7154, 0.0721);//修改亮度分配
	vec4 texture = texture2D(gm_BaseTexture, v_vTexcoord);//原图rgba
	float luminanceNew = dot(texture.rgb, luminanceWeighting);//亮度
	vec3 greyScaleColor = vec3(luminanceNew);//灰色图数制转换
	vec4 textureGrey= vec4(mix(greyScaleColor, texture.rgb, saturation), texture.w);//灰色图rgba
	#endregion
	
	#region 渲染
	/*float colR=colSet.r * textureGrey.r * colSet.a;
	float colG=colSet.g * textureGrey.g * colSet.a;
	float colB=colSet.b * textureGrey.b * colSet.a;*/
	
	float colR=(1.0 - (1.0-colSet.r) * (1.0-textureGrey.r) * 2.0) * colSet.a;
	float colG=(1.0 - (1.0-colSet.g) * (1.0-textureGrey.g) * 2.0) * colSet.a;
	float colB=(1.0 - (1.0-colSet.b) * (1.0-textureGrey.b) * 2.0) * colSet.a;
	vec3 colRGB=vec3(colR,colG,colB);//要改变的颜色
	vec3 col=colRGB;
	vec4 textureRendering=vec4(col,texture.a);//渲染图rgba
	#endregion
	
	#region 设定颜色
	vec4 textureFinal=textureRendering;
	gl_FragColor=textureFinal;
	#endregion
}