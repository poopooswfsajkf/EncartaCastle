// =====================================================
// STEP EVENT
// =====================================================

switch (state)
{
    // =================================================
    // 0 = SPAWN
    // =================================================
    case 0:
    {
        

        // ONLY ONE sticker can spawn here
        if (spawned < sticker_count)
        {
            spawn_timer = 0;

            var s = stickers[spawned];

            s.x = random(SCREEN_WIDTH);
            s.y = random(SCREEN_HEIGHT);

            s.image = irandom(
                sprite_get_number(spr_secret_transition_stickers) - 1
            );

            s.scale = 1.2;
            s.alpha = 1;
            s.active = true;

            stickers[spawned] = s;

            spawned++;
        }


        // Animate stickers that already exist
        for (var i = 0; i < spawned; i++)
        {
            var s = stickers[i];

s.scale = approach(s.scale, 1, 0.1)

            stickers[i] = s;
        }


        // Every sticker has appeared
        if (spawned >= sticker_count)
        {
            state = 1;
        }
    }
    break;


    // =================================================
    // 1 = CHANGE ROOM
    // =================================================
    case 1:
    {
        if (!room_changed)
        {
            room_changed = true;

            room_goto(targetRoom);
        }

        hold_timer = 0;
        state = 2;
    }
    break;


    // =================================================
    // 2 = HOLD FOR 1 SECOND
    // =================================================
    case 2:
    {
        hold_timer++;

        if (hold_timer >= hold_time)
        {
            state = 3;
        }
    }
    break;


    // =================================================
    // 3 = MOVE UP + FADE
    // =================================================
    case 3:
    {
var finished = true;

for (var i = 0; i < spawned; i++)
{
    var s = stickers[i];

    if (!s.active)
        continue;

		s.y -= s.vspeed
		s.vspeed += s.targetSpeed / 15

    // Fade out
    s.alpha = max(
        0,
        s.alpha - 0.025
    );

    if (s.alpha > 0)
        finished = false;

    stickers[i] = s;
}

// All spawned stickers finished fading
if (spawned >= sticker_count && finished)
{
    instance_destroy();
}
    }
    break;
}