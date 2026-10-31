sprite_index = spr_secretportal_spawn;
image_speed = 0.35;

state = 0;

xscaleMulti = 1;
yscaleMulti = 1;

secret_cutscene = true;
did = false;

global.level_data.secret_count++;

var _str = string(global.level_data.secret_count) + " secret";

if (global.level_data.secret_count != 1)
    _str += "s";

do_tip("\{u}You have found " + _str + " out of 3!");