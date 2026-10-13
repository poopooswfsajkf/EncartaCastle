enum windowmode
{
	windowed,
	fullscreen,
	borderless
}

gui_surf = noone
surface_resize(application_surface, SCREEN_WIDTH, SCREEN_HEIGHT)

lb_sprs = [bg_letterbox, bg_letterbox2, bg_letterbox3]

depth = -999

ini_open("globalsave.ini")

lb_pos = ini_read_real("options", "letterbox_index", 0)

global.option_windowmode = ini_read_real("options", "windowmode", windowmode.windowed)
global.option_res_strings = [
    "320X240",
    "400X300",
    "480X360",
    "512X384",
    "640X480",
    "720X540",
    "800X600",
    "960X720",
    "1024X768",
    "1152X864",
    "1280X960",
    "1440X1080",
    "1600X1200",
    "1920X1440",
    "2560X1920",
    "2880X2160",
    "3200X2400"
];
global.option_chosen_res = ini_read_real("options", "chosen_res", 5);
global.option_texturefilter = ini_read_real("options", "texturefilter", 0)

display_reset(0, ini_read_real("options", "vsync", 1))

ini_close()

var _split = string_split(global.option_res_strings[global.option_chosen_res], "X")

window_set_size(real(_split[0]), real(_split[1]))

if global.option_windowmode == windowmode.fullscreen
	gameframe_set_fullscreen(global.option_windowmode == windowmode.fullscreen)
else if global.option_windowmode == windowmode.borderless
	gameframe_set_fullscreen(2)

window_center()

application_surface_draw_enable(false)

gameframe_init()

display_set_gui_size(720, 540)
