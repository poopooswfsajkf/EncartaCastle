varying vec2 v_vTexcoord;

uniform float u_step;

#define step_zero 7.0

void main()
{
    vec4 newColour = texture2D(gm_BaseTexture, v_vTexcoord);

    // Map the GML fadeAlpha range of 0-30
    // onto the shader's original 0-21 range.
    float step = (u_step / 30.0) * 21.0;

    vec3 factor = vec3(
        clamp(step, 0.0, step_zero),
        clamp(step - step_zero, 0.0, step_zero),
        clamp(step - step_zero * 2.0, 0.0, step_zero)
    );

    newColour.rgb -= factor.rgb * (1.0 / step_zero);

    gl_FragColor = clamp(newColour, 0.0, 1.0);
}