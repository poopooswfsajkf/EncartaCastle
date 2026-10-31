if (ds_list_find_index(global.ds_saveroom, id) != -1 && !did)
    exit;

if (!secret_cutscene)
{
    reset_anim(spr_secretportal_enter);

    secret_cutscene = true;

    fmod_studio_event_instance_oneshot_3d(
        "event:/sfx/misc/secretenter", x, y
    );
}

other.target_room = "secret";

do_hold_player(true);