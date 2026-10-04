// =====================================================
// CREATE EVENT
// =====================================================
persistent = true;
state = 0;
// 0 = Spawn
// 1 = Change Room
// 2 = Hold
// 3 = Fade Up

room_changed = false;

sticker_count = 175;
stickers = [];


// 1.5 seconds at 60 FPS
spawn_timer = 0;
spawn_delay = 90;

spawned = 0;


// 1 second at 60 FPS
hold_timer = 0;
hold_time = 60;


// Create sticker data
for (var i = 0; i < sticker_count; i++)
{
    stickers[i] =
    {
        x: 0,
        y: 0,
targetSpeed: irandom_range(-5, -15),
vspeed: 0,
        image: irandom(sprite_get_number(spr_secret_transition_stickers) - 1),

        scale: 1.2,
        alpha: 0,

        active: false
    };
}