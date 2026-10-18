global.panic = {
	active: false,
	timer: 0,
	timer_max: 0,
	lap2: false
}
news_image_index = 0;

john = {
	image_index: 0,
	image_speed: 0.35
}

pizzaface = {
	sprite_index: spr_timer_pizzaface_sleep,
	image_index: 0,
	image_speed: 0.35
}

barfill_x = 0
bar_surface = noone
showtime_buffer = 0

xstart = SCREEN_WIDTH / 2
ystart = SCREEN_HEIGHT - 76
timer_x = xstart - 165;
timer_y = ystart + 30;
x = xstart
y = ystart + 212

flower_x = SCREEN_WIDTH / 2
flower_y = SCREEN_HEIGHT - 76
depth = -200

textes = []
 timer_add_text()