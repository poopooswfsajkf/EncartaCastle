
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_step;
uniform float u_composite;

#define STEP_ZERO 7.0

float rgb_to_luma(vec3 col)
{
    return dot(col, vec3(0.299, 0.587, 0.114));
}

void main()
{
    vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord);

    // Original fade
    float fade_step = (u_step / 30.0) * 21.0;

    vec3 factor = vec3(
        clamp(fade_step, 0.0, STEP_ZERO),
        clamp(fade_step - STEP_ZERO, 0.0, STEP_ZERO),
        clamp(fade_step - STEP_ZERO * 2.0, 0.0, STEP_ZERO)
    ) / STEP_ZERO;

    vec3 faded = clamp(tex.rgb - factor, 0.0, 1.0);

    // Composite chroma filtering
    vec2 uv = v_vTexcoord;
    vec3 center = tex.rgb;

    float luma = rgb_to_luma(center);
    vec3 chroma = center - vec3(luma);

    vec3 left = texture2D(gm_BaseTexture, uv - vec2(0.006, 0.0)).rgb;
    vec3 right = texture2D(gm_BaseTexture, uv + vec2(0.006, 0.0)).rgb;

    vec3 left_chroma = left - vec3(rgb_to_luma(left));
    vec3 right_chroma = right - vec3(rgb_to_luma(right));

    vec3 composite = vec3(luma) + (
        chroma * 0.5
        + left_chroma * 0.25
        + right_chroma * 0.25
    );

    composite = clamp(composite - factor, 0.0, 1.0);

    vec3 result = mix(
        faded,
        composite,
        clamp(u_composite, 0.0, 1.0)
    );

    gl_FragColor = vec4(result, tex.a) * v_vColour;
}
