if (sprite_index == spr_secretportal_enter)
{
    if (ds_list_find_index(global.ds_saveroom, id) == -1)
    {
        ds_list_add(global.ds_saveroom, id);
        global.secret = !global.secret;
    }
}

if (sprite_index == spr_secretportal_spawn)
{
    alarm[0] = 120;

    reset_anim(spr_secretportal_spawnidle);

    fmod_studio_event_instance_oneshot_3d(
        "event:/sfx/misc/secretexit", x, y
    );

    with (obj_player)
    {
        secret_exit = false;
        secret_cutscene = false;
    }

    secret_cutscene = false;
}