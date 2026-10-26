function hud_get_visible(hideforboss = true)
{
    var _room_name = room_get_name(room);

    if (string_starts_with(_room_name, "tower"))
    {
        show_debug_message("HUD hidden: tower room");
        return false;
    }

    if (string_starts_with(_room_name, "tutorial"))
    {
        show_debug_message("HUD hidden: tutorial room");
        return false;
    }

    if (global.boss_room && hideforboss)
    {
        show_debug_message("HUD hidden: boss room");
        return false;
    }

    if (room == rank_room || room == rm_timesup ||
        room == mainmenu || room == StaffRoll)
    {
        show_debug_message("HUD hidden: excluded room");
        return false;
    }

    if (!global.option_showhud)
    {
        show_debug_message("HUD hidden: option_showhud is false");
        return false;
    }

    show_debug_message("HUD visible");
    return true;
}