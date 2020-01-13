Shader "Compendium/RimLight"
{
	Properties
	{
		RimColor("Rim Color", Color) = (0,0.5, 0.5, 0.0)
		RimPower("Rim POwer", Range(0.5,8.0)) = 3.0
	}
		SubShader
	{
		CGPROGRAM
#pragma surface surf Lambert
		struct Input
	{
		float viewDir;
	};

	float4 RimColor;
	float RimPower;

	void surf(Input IN, inout SurfaceOutput o)
	{
		half rim = 1.0 - saturate(dot(normalize(IN.viewDir), o.Normal));
		o.Emission = RimColor.rgb * pow(rim, RimPower);
	}
	ENDCG
	}

		Fallback "Diffuse"
}