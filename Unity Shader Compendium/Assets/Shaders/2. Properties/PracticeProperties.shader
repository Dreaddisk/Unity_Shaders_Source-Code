Shader "Properties/ PracticeProperties"
{
	Properties
	{
		myColor("Color", Color) = (1,1,1,1)
		myRange("Range", Range(0,5)) = 1
		myTex("Texture", 2D) = "white"{}
		myCube("Cube", Cube) = "" {}
		myFloat("Float", Float) = 0.5
			myVector("Example Vector", Vector) = (0.5,1,1,1)
	}
		SubShader
		{
			CGPROGRAM
#pragma surface surf Lambert

		fixed4 myColor;
		half myRange;
		sampler2D myTex;
		samplerCUBE myCube;
		float myFloat;
		float4 myVector;

		struct Input
		{
			float2 uv_myTex;
			float3 worldRefl;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = (tex2D(myTex, IN.uv_myTex) * myRange).rgb;
			o.Emission = texCUBE(myCube, IN.worldRefl).rgb;
		}
		ENDCG

		}
			Fallback "Diffuse"
}