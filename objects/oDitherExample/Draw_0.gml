//Here's for drawing debug variables.
draw_set_color(c_black);
draw_text(0,0,string_hash_to_newline("Alpha: " + string(opacity)));
draw_text(0,16,string_hash_to_newline("Pattern: " + string(opacity*16)));
draw_text(0,32,"<- and -> to change opacity");
draw_set_color(c_white);

//HERE'S where the shader actually gets applied to the sprite
shader_set(shdr_opacityDithering);
//We pass the opacity variable into the shader.
//You can replace opacity with your own variable.
shader_set_uniform_f(uniform_alpha,opacity);
draw_self();
shader_reset();

