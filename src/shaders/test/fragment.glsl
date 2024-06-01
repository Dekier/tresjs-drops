 uniform vec2 mousePos;
 uniform sampler2D normalMap;
void main() {
    float dist = distance(gl_FragCoord.xy, mousePos);
    vec4 normalColor = texture2D(normalMap, gl_FragCoord.xy / resolution.xy);

    // Logika ucieczki
    if (dist < 0.1) {
        // Możesz tutaj wykorzystać normalColor, jeśli chcesz, np.
        // gl_FragColor = vec4(normalColor.rgb, 1.0);
    }

    gl_FragColor = vec4(normalColor.rgb, 1.0);
}