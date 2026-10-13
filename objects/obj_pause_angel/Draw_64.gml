shader_set(shdr_opacityDithering)
shader_set_uniform_f(uniform_alpha, image_alpha);
draw_self()
shader_reset()