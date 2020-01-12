Shader "First Shader/NormalSurface"
{
	Properties
	{
		myColor(" Color", Color) = (1,1,1,1)
		myEmission(" Emission", Color) = (1,1,1,1)
		myNormal(" Normal", Color) = (1,1,1,1)
	}
		SubShader
	{
		CGPROGRAM
#pragma surface surf Lambert

		struct Input
	{
		float2 uvMainTex;
	};

	fixed4 myColor;
	fixed4 myEmission;
	fixed4 myNormal;

	void surf(Input IN, inout SurfaceOutput o)
	{
		o.Albedo = myColor.rgb;
		o.Emission = myEmission.rgb;
		o.Normal = myNormal.rgb;
	}
	ENDCG
	}
		FallBack "Diffuse"
}