image_blend = c_white


if (global.showcollisions)
{
draw_text(x, y - 50, $"movespred: {obj_player.movespeed}")
draw_text(x, y - 70, $"vsp: {obj_player.vsp}")
draw_text(x, y - 90, $"hsp {obj_player.hsp}")
draw_text(x, y - 110, $"{obj_player.sprite_index}")
draw_text(x, y - 130, $"state: {obj_player.state}")
draw_text(x, y - 160, $"char: {obj_player.char}")
}
else
{
	
}
var xx = x
var yy = y

if visual_size == 0
	exit;

if hitstun > 0
{
	var range = 5
	xx += irandom_range(-range, range)
	yy += irandom_range(-range, range)
}

if sprite_index == obj_player.spr_player_walkfront
	image_blend = make_color_hsv(0, 0, (1 - ((image_number - image_index) / image_number)) * 255)

/*image_alpha = 1

if (i_frames > 0 && state != states.hurt && state != states.fireass)
	image_alpha = round(wave(0, 1, 0.01, 0))*/

// Prevent invalid sprite reference
if sprite_index == -1
{
	show_debug_message("INVALID PLAYER SPRITE!");
	show_debug_message("state = " + string(state));
	show_debug_message("sprite_index = " + string(sprite_index));
	show_debug_message("spr_player_mach3 = " + string(obj_player.spr_player_mach3));
	show_debug_message("spr_player_wallbounce = " + string(obj_player.spr_player_wallbounce));
	exit;
}

if pal_select == 12
	pattern_draw(sprite_index, image_index, xx, yy, pattern_spr, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)

pal_swap_set(pal_peppino, pal_select, false)
draw_sprite_ext(sprite_index, image_index, xx, yy, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)
pal_swap_reset()

if flash > 0
{
	shader_set(shd_flash)
	draw_sprite_ext(sprite_index, image_index, xx, yy, xscale * visual_size, image_yscale * visual_size, image_angle, image_blend, image_alpha)
	shader_reset()
}

with uparrow
{
	if visible
		draw_sprite(sprite_index, image_index, other.x, other.y + yoffset)
	image_index += image_speed
}