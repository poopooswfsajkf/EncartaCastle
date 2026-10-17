//
// Dither opacity fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float red;
uniform float green;
uniform float blue;
uniform float dAlpha;

mat4 patCalc(float opacity)
{
    mat4 retval = mat4(0.0);

    int dPatlvl = int(clamp(opacity, 0.0, 1.0) * 16.0);

    for (int i = 1; i <= 16; i++)
    {
        if (i <= dPatlvl)
        {
            float iFl = float(i);

            int xPat = int(
                floor(iFl / 2.0) * 2.0
                + floor((iFl - 1.0) / 4.0)
                - floor((iFl - 1.0) / 8.0)
            );

            xPat -= int(floor(float(xPat) / 4.0) * 4.0);

            int yPat = int(
                abs(sign(mod(iFl, 2.0)) - 1.0) * 2.0
                + floor((iFl - 1.0) / 4.0)
            );

            yPat -= int(floor(float(yPat) / 4.0) * 4.0);

            retval[xPat][yPat] = 1.0;
        }
    }

    return retval;
}

void main()
{
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord)
               * v_vColour;

    mat4 dPattern = patCalc(dAlpha);

    int xPos = int(mod(floor(gl_FragCoord.x), 4.0));
    int yPos = int(mod(floor(gl_FragCoord.y), 4.0));

    float patternAlpha = dPattern[xPos][yPos];

    gl_FragColor = vec4(red, green, blue, color.a * patternAlpha);
}