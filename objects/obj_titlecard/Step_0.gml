if (state == 0)
{
    if (fade_alpha < 1)
    {
        zoom_progress = min(zoom_progress + fade_spd, 1);

        var _t = zoom_progress;
        obj_camera.zoom -= _t * _t / 5;

        fade_alpha = min(fade_alpha + fade_spd, 1);
    }
    else
    {
        state = 1;
        alarm[0] = 190;

        if (music != noone)
            fmod_studio_event_instance_oneshot(music);
    }
}
else if (state == 1)
{
    fade_alpha = max(fade_alpha - fade_spd, 0);
}
else if (state == 2)
{
    if (zoom_progress > 0)
    {
        zoom_progress = max(zoom_progress - fade_spd, 0);

        var _t = zoom_progress;
        obj_camera.zoom += _t * _t / 5;
    }
}