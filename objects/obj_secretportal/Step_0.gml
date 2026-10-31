// Only process activated portals.
if (ds_list_find_index(global.ds_saveroom, id) == -1)
    exit;


// =====================================================
// PLAYER GROUNDPOUND
// =====================================================

if (state == 1)
{
    if (obj_player.visual_size < 1)
    {
        do_hold_player(false);
    }
    else
    {
        state++;

        with (obj_player)
        {
            state = states.groundpound;
            movespeed = 0;
            vsp = 10;
        }
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

sprite_index = spr_secretportal_enter
    // Close the portal.
    if (sprite_index == spr_secretportal_enter)
    {
        xscaleMulti = approach(xscaleMulti, 0, 0.05);
        yscaleMulti = approach(yscaleMulti, 0, 0.05);

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

if (secret_cutscene && !did)
{
    do_hold_player(true);
}