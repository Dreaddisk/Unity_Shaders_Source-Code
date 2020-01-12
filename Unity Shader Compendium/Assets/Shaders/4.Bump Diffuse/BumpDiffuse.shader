Shader "Coompendium/BumpedDiffuse"
{
	Properties
	{
		myDiffuse("Diffuse Texture", 2D) = "white"{}
		myBump("Bump Texture", 2D) = "bump"{}
		mySlider("Bymo Amount", Range(0,10)) = 1
		myBright("Brightness", Range(0,10)) = 1
		myCube("Cube Map", CUBE) = "white"{}

	}
		SubShader
	{
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D myDiffuse;
	sampler2D myBump;
	half mySlider;
	half myBright;
	samplerCUBE myCube;

	struct Input
	{
		float2 uv_myDiffuse;
		float2 uv_myBump;
		float3 worldRefl;	INTERNAL_DATA

	};

	void surf(Input IN, inout SurfaceOutput o)
	{
		o.Albedo = tex2D(myDiffuse, IN.uv_myDiffuse).rgb;
		o.Normal = UnpackNormal(tex2D(myBump, IN.uv_myBump)) * myBright;
		o.Normal *= float3(mySlider, mySlider, 1);
		o.Emission = texCUBE(myCube, WorldReflectionVector(IN, o.Normal)).rgb;
	}

	ENDCG
	}
			Fallback "Diffuse"
}