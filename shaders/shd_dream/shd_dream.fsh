
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;
uniform float u_transition;

#define CHROMA_STRENGTH 0.75
#define CHROMA_SPREAD 2.0

float rgb_to_luma(vec3 c)
{
    return dot(c, vec3(0.299, 0.587, 0.114));
}

float hash(vec2 p)
{
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float noise(vec2 p)
{
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);

    return mix(
        mix(hash(i), hash(i + vec2(1.0, 0.0)), f.x),
        mix(hash(i + vec2(0.0, 1.0)), hash(i + vec2(1.0, 1.0)), f.x),
        f.y
    );
}

void main()
{
    vec2 original_uv = v_vTexcoord;
    vec2 uv = original_uv;

    float horror = clamp(u_transition, 0.0, 1.0);
    float t = u_time;

    // Gentle wave distortion
    float waves = sin(uv.y * 18.0 + t * 2.0)
                * cos(uv.y * 7.0 - t * 1.3);

    uv.x += waves * 0.004 * horror;

    uv.x += sin(uv.y * 75.0 + t * 8.0)
          * 0.001 * horror * horror;

    uv.y += sin(uv.x * 22.0 + t * 1.7)
          * 0.0015 * horror;

    // Rare, subtle horizontal signal tearing
    float row = floor(uv.y * 90.0);
    float tear_random = hash(vec2(row, floor(t * 5.0)));
    float tear = step(0.985, tear_random);

    float tear_offset =
        (hash(vec2(row, floor(t * 7.0))) - 0.5)
        * 0.018 * horror * tear;

    uv.x += tear_offset;

    // Restrained RGB separation
    vec2 rgb_offset = vec2(
        0.001 + horror * 0.002,
        sin(t * 3.0 + uv.y * 12.0) * 0.0005 * horror
    );

    vec3 col;
    col.r = texture2D(gm_BaseTexture, uv + rgb_offset).r;
    col.g = texture2D(gm_BaseTexture, uv).g;
    col.b = texture2D(gm_BaseTexture, uv - rgb_offset).b;

    // Composite-video chroma filtering
    float luma = rgb_to_luma(col);
    vec3 chroma = col - vec3(luma);

    vec2 spread1 = vec2(0.004 * CHROMA_SPREAD, 0.0);
    vec2 spread2 = vec2(0.009 * CHROMA_SPREAD, 0.0);

    vec3 c1 = texture2D(gm_BaseTexture, uv + spread1).rgb;
    vec3 c2 = texture2D(gm_BaseTexture, uv - spread1).rgb;
    vec3 c3 = texture2D(gm_BaseTexture, uv + spread2).rgb;
    vec3 c4 = texture2D(gm_BaseTexture, uv - spread2).rgb;

    vec3 filtered = chroma * 0.227027;

    filtered += (c1 - vec3(rgb_to_luma(c1))) * 0.1945946;
    filtered += (c2 - vec3(rgb_to_luma(c2))) * 0.1945946;
    filtered += (c3 - vec3(rgb_to_luma(c3))) * 0.1216216;
    filtered += (c4 - vec3(rgb_to_luma(c4))) * 0.1216216;

    col = vec3(luma) + mix(
        chroma,
        filtered,
        CHROMA_STRENGTH * horror
    );

    // Slight desaturation as the horror transition develops
    float gray = rgb_to_luma(col);
    col = mix(col, vec3(gray), horror * 0.25);

    // Slowly cycle between crimson, purple, and dark teal
    float palette_phase = t * 0.7;

    vec3 palette_a = vec3(0.65, 0.025, 0.08);
    vec3 palette_b = vec3(0.12, 0.025, 0.45);
    vec3 palette_c = vec3(0.02, 0.32, 0.30);

    vec3 palette = mix(
        palette_a,
        palette_b,
        0.5 + 0.5 * sin(palette_phase)
    );

    palette = mix(
        palette,
        palette_c,
        0.5 + 0.5 * sin(palette_phase * 0.63 + 2.0)
    );

    col = mix(
        col,
        col * 0.75 + palette * gray * 0.5,
        horror * 0.45
    );

    // Subtle crawling dark veins
    vec2 vein_uv = uv * vec2(11.0, 8.0);
    vein_uv.x += sin(vein_uv.y * 1.8 + t * 0.5) * 0.7;

    float vein_noise = noise(vein_uv + vec2(0.0, t * 0.12));
    float vein_lines = abs(noise(vein_uv * 2.0) - 0.5);

    float veins = smoothstep(0.025, 0.0, vein_lines)
                * smoothstep(0.35, 0.8, vein_noise);

    col = mix(
        col,
        vec3(0.32, 0.005, 0.025),
        veins * horror * 0.25
    );

    // Soft vignette
    vec2 centered = original_uv - 0.5;
    float dist = length(centered);
    float vignette = smoothstep(0.35, 0.85, dist);

    col *= 1.0 - vignette * horror * 0.35;

    // Rare, mild brightness flicker
    float flicker_random = hash(vec2(floor(t * 17.0), 4.0));
    float flicker = step(0.985, flicker_random) * horror * 0.08;

    col *= 1.0 - flicker;

    // Occasional subtle red/cyan color glitch
    float flash_random = hash(vec2(floor(t * 4.0), 8.0));
    float flash = step(0.97, flash_random) * horror;

    vec3 flash_color = mix(
        vec3(0.8, 0.015, 0.04),
        vec3(0.0, 0.45, 0.55),
        step(0.5, hash(vec2(floor(t * 4.0), 9.0)))
    );

    col = mix(col, flash_color, flash * 0.08);

    // Fine film grain
    float grain = hash(
        floor(original_uv * 700.0) + floor(t * 24.0)
    );

    col += (grain - 0.5) * horror * 0.015;

    // Very occasional faint scanline
    float scanline = step(
        0.985,
        hash(vec2(
            floor(original_uv.y * 240.0),
            floor(t * 5.0)
        ))
    );

    col = mix(
        col,
        vec3(0.28, 0.0, 0.015),
        scanline * horror * 0.10
    );

    // Preserve brightness and image detail
    col *= 1.0 + horror * 0.04;
    col = mix(
        col,
        vec3(0.16, 0.0, 0.012),
        horror * 0.035
    );

    // Start normal and gradually introduce the effect
    vec3 original = texture2D(
        gm_BaseTexture,
        original_uv
    ).rgb;

    col = mix(original, col, horror);

    gl_FragColor = vec4(
        clamp(col, 0.0, 1.0),
        1.0
    ) * v_vColour;
}
