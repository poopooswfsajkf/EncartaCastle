if (!global.panic.active)
{
	if bar_surface != noone
	{
		surface_free(bar_surface)
		bar_surface = noone
	}
	exit;
}

var currentbarpos = global.panic.timer_max - global.panic.timer
var perc = currentbarpos / global.panic.timer_max
var max_x = 299
var barpos = max_x * perc

if (!surface_exists(bar_surface))
	bar_surface = surface_create(298, 30)
else
{
	var barfillpos = floor(barpos)
	if (barfillpos > 0)
	{
		surface_resize(bar_surface, barfillpos, 30)
		surface_set_target(bar_surface)
		draw_clear(c_black)
		var clip_x = x - 150
		var clip_y = y + 5
		
		barfill_x -= 0.2
		if (barfill_x < -173)
			barfill_x = 0
		
		draw_sprite_ext(spr_timer_fill, 0, barfill_x, 0, 3, 1, 0, c_white, 1)
		surface_reset_target()
		//draw_surface(bar_surface, clip_x, clip_y)
	}
}

if (global.panic.timer <= 0 && pizzaface.sprite_index != spr_timer_pizzaface_wake)
{
	pizzaface.sprite_index = spr_timer_pizzaface_wake
	pizzaface.image_index = 0
	pizzaface.image_speed = 0.35
	showtime_buffer = 200
}

john.image_index += john.image_speed // didnt work with a with statement, shit code it is
if john.image_index >= 22
	john.image_index = 0

if pizzaface.sprite_index == spr_timer_pizzaface_sleep
	pizzaface.image_speed = 0.35

pizzaface.image_index += pizzaface.image_speed
if pizzaface.image_index >= sprite_get_number(pizzaface.sprite_index) - 1
{
	if pizzaface.sprite_index == spr_timer_pizzaface_sleep
		pizzaface.image_index = 0
	else
	{
		pizzaface.image_index = sprite_get_number(pizzaface.sprite_index) - 1
		pizzaface.image_speed = 0
	}
}

draw_sprite(spr_timer_textbubble, 0, x - (SCREEN_WIDTH / 2), y - (SCREEN_HEIGHT - 76))

draw_set_font(global.tutorialfont)
draw_set_align(fa_center, fa_top)
draw_set_color(c_white)
	for (var i = 0; i < array_length(textes); i ++){
		textes[i][1] += 5
		draw_text(textes[i][1], y + 35, textes[i][0])	
		if textes[i][1] >= 1000 + string_width(textes[i][0])
			array_delete(textes, i, 1)
	}
	if keyboard_check_pressed(vk_f12)
		show_debug_message(textes)


news_image_index += 8 / room_speed;

if (news_image_index >= sprite_get_number(spr_timer_news))
	news_image_index = 0;

draw_sprite_ext(
	spr_timer_news,
	floor(news_image_index),
	x - (SCREEN_WIDTH / 2),
	y - (SCREEN_HEIGHT - 76),
	1,
	1,
	0,
	c_white,
	1
);

draw_sprite_ext(
    spr_timer_flowers,
    0,
    flower_x - (SCREEN_WIDTH / 2),
    flower_y - (SCREEN_HEIGHT - 76),
    1,
    1,
    0,
    c_white,
    1
);

//draw_sprite(spr_timer_john, john.image_index, (x - 150) + barpos, y + 20)

//draw_sprite(pizzaface.sprite_index, pizzaface.image_index, x + 150, y + 10)

draw_set_font(global.generic_font)
draw_set_color(c_white)
draw_set_alpha(1)
draw_set_align(fa_center, fa_top)

var minutes = 0
for (var seconds = ceil(global.panic.timer / 12); seconds > 59; seconds -= 60)
	minutes++

if (seconds < 10)
	seconds = string_concat("0", seconds)
else
	seconds = string(seconds)


if (!global.panic.lap2)
{
    draw_text(x - 165, y + 30, string_concat(minutes, ":", seconds));
}
else
{
    timer_x = approach(timer_x, SCREEN_WIDTH / 2, 1);
    

    draw_text(timer_x, timer_y, string_concat(minutes, ":", seconds));
}