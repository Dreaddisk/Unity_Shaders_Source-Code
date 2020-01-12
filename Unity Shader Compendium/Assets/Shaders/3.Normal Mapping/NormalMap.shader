Shader "Compendium/ Normal Map"
{
	Properties
	{
		myDiffuse("Diffuse Texture", 2D) = "white"{}
		myBump("Bump Texture", 2D) = "bump" {}
		mySlider("Bump Amount", Range(0,10)) = 1
	}
		SubShader
		{
			CGPROGRAM
		#pragma surface surf Lambert

		sampler2D myDiffuse;
		sampler2D myBump;
		half mySlider;

		struct Input
		{
			float2 uv_myDiffuse;
			float2 uv_myBump;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(myDiffuse, IN.uv_myDiffuse).rgb;
			o.Normal = UnpackNormal(tex2D(myBump, IN.uv_myBump));
			o.Normal *= float3(mySlider, mySlider, 1);
		}

		ENDCG
		}
			Fallback "Diffuse"
}