// =====================================================
// PLAYER GROUNDPOUND
// =====================================================

if (obj_player.visual_size < 1)
{
    do_hold_player(false);
}
else if (state == 0)
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
// PORTAL ANIMATION
// =====================================================

if (!secret_cutscene)
{
    xscaleMulti = lerp(xscaleMulti, wave(1, 1.3, 3, 4), 0.2);
    yscaleMulti = lerp(yscaleMulti, wave(1, 0.8, 3, 4), 0.2);
}
else
{
    if (sprite_index == spr_secretportal_spawnclose)
    {
        xscaleMulti = approach(xscaleMulti, 0, 0.05);
        yscaleMulti = approach(yscaleMulti, 0, 0.05);

        if (xscaleMulti <= 0 && yscaleMulti <= 0 && !did)
        {
            did = true;
            instance_destroy();
        }
    }
    else
    {
        xscaleMulti = lerp(xscaleMulti, 1, 0.2);
        yscaleMulti = lerp(yscaleMulti, 1, 0.2);
    }
}