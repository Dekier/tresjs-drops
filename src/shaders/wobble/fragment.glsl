uniform vec3 uColorA;
uniform vec3 uColorB;
// uniform sampler2D normalMap;
varying vec2 vUv; 

varying float vWobble;

void main()
{
    float colorMix = smoothstep(-1.0, 1.0, vWobble);

    // Pobierz normalMap kolor na podstawie UV
    // vec3 normalColor = texture2D(normalMap, vUv).rgb;

    // Użyj normalColor do manipulacji kolorem (lub innymi właściwościami)
    // vec3 finalColor = mix(uColorA, uColorB, colorMix) * normalColor;

    vec3 finalColor = mix(uColorA, uColorB, colorMix);

    // Ustaw csm_DiffuseColor na finalColor
    csm_DiffuseColor.rgb = finalColor;

    // Mirror step
    // csm_Metalness = step(0.25, vWobble);
    // csm_Roughness = 1.0 - csm_Metalness;

    // Shinny tip
    csm_Roughness = 1.0 - colorMix;
}