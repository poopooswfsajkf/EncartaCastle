surface_reset_target()

var ratio = window_get_width() / window_get_height()

if ratio != SCREEN_WIDTH / SCREEN_HEIGHT
	draw_sprite_tiled(lb_sprs[lb_pos], 0, SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)

gpu_set_blendmode_normal_fixed()
draw_reset_color()
var _width = 200;
var _height = 100;

draw_rectangle(
    (SCREEN_WIDTH - _width) / 2,
    (SCREEN_HEIGHT - _height) / 2,
    (SCREEN_WIDTH + _width) / 2,
    (SCREEN_HEIGHT + _height) / 2,
    false
);

var screen_x = 0
var screen_y = 0

if global.option_texturefilter && 
	!(
		(window_get_width() == 960 && window_get_height() == 720) || //default res
		(window_get_width() == 1920 && window_get_height() == 1440) //res x2
	)
	gpu_set_texfilter(global.option_texturefilter)

with (obj_fade)
{
    shader_set(shd_sonicfade);
    shader_set_uniform_f(shader_get_uniform(shd_sonicfade, "u_step"), fadeAlpha);
}

draw_surface(application_surface, screen_x, screen_y)
shader_reset()


with (obj_fade)
{
    shader_set(shd_sonicfade);
    shader_set_uniform_f(shader_get_uniform(shd_sonicfade, "u_step"), fadeAlpha);
}

draw_surface(gui_surf, screen_x, screen_y)
shader_reset()

gpu_set_texfilter(false)

gpu_set_blendmode_normal_fixed()

draw_set_font(fnt_caption)

if gameframe_alpha > 0
	gameframe_draw()
