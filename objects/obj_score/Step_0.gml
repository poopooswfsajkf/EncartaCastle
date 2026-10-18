global.score = max(0, global.score)
shake_mag = max(shake_mag - 1, 0)

visible = hud_get_visible()

var y_goto = 90
if (obj_player.x < 300 && obj_player.y < 125 || global.panic.lap2)
	y_goto = -500

display_y = approach(display_y, y_goto,  global.panic.lap2 ? 1 : 25)

if (global.panic.lap2)
{
r_pos.x = approach(r_pos.x, 64, 1);
r_pos.y = approach(r_pos.y, 64, 1);
}

x = 121
y = display_y + shake_mag
