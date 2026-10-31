if (sprite_index == spr_secretportal_spawn)
{
    alarm[0] = 120;

    reset_anim(spr_secretportal_spawnidle);

    fmod_studio_event_instance_oneshot_3d(
        "event:/sfx/misc/secretexit", x, y
    );

    with (obj_player)
    {
        secret_cutscene = false;
        secret_exit = false;
    }

    secret_cutscene = false;
}

