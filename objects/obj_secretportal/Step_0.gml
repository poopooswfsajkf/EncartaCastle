// =====================================================
// VALIDATION
// =====================================================

if (ds_list_find_index(global.ds_saveroom, id) == -1)
    exit;


// =====================================================
// PLAYER GROUNDPOUND
// =====================================================

if (obj_player.visual_size < 1 && state == 1)
{
    do_hold_player(false);
}
else if (state == 1)
{
    state++;

    with (obj_player)
    {
        state = states.groundpound;
        movespeed = 0;
        vsp = 10;
    }
}


// =====================================================
// SECRET CUTSCENE ACTIVATION
// =====================================================

if (!secret_cutscene)
{
    if (sprite_index != spr_secretportal_enter)
    {
        reset_anim(spr_secretportal_enter);

        secret_cutscene = true;

        fmod_studio_event_instance_oneshot_3d(
            "event:/sfx/misc/secretenter", x, y
        );
    }
}


// =====================================================
// PORTAL ANIMATION
// =====================================================

if (!secret_cutscene)
{
    xscaleMulti = lerp(xscaleMulti, wave(1, 1.3, 3, 4), 0.2);
    yscaleMulti = lerp(yscaleMulti, wave(1, 0.8, 3, 4), 0.2);
}
else
{
    // Wait for the enter animation to finish
    if (sprite_index == spr_secretportal_enter && anim_ended())
    {
        reset_anim(spr_secretportal_spawnclose);
    }

    // Close the portal
    if (sprite_index == spr_secretportal_spawnclose)
    {
        xscaleMulti = approach(xscaleMulti, 0, 0.05);
        yscaleMulti = approach(yscaleMulti, 0, 0.05);

        // Create transition when fully closed
        if (xscaleMulti <= 0 && yscaleMulti <= 0 && !did)
        {
            did = true;

            var _transition = instance_create(x, y, obj_secrettransition);
            _transition.targetRoom = t_room;
        }
    }
    else
    {
        xscaleMulti = lerp(xscaleMulti, 1, 0.2);
        yscaleMulti = lerp(yscaleMulti, 1, 0.2);
    }
}


// =====================================================
// PLAYER HOLD
// =====================================================

other.target_room = "secret";

do_hold_player(true);