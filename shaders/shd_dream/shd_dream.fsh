varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;

void main()
{
    vec2 uv = v_vTexcoord;

    // Gentle wave distortion
    uv.x += sin(uv.y * 8.0 + u_time * 1.2) * 0.006;
    uv.y += cos(uv.x * 6.0 + u_time * 0.9) * 0.004;

    // Soft RGB split
    vec2 off = vec2(0.002, 0.0);

    float r = texture2D(gm_BaseTexture, uv + off).r;
    float g = texture2D(gm_BaseTexture, uv).g;
    float b = texture2D(gm_BaseTexture, uv - off).b;

    vec3 col = vec3(r, g, b);

    // Soft glow
    col *= 1.08;

    // Gentle fade toward white
    col = mix(col, vec3(1.0), 0.06);

    gl_FragColor = vec4(col, 1.0) * v_vColour;
}