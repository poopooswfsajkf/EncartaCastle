if (!global.panic.lap2)
    return;

// Create the dream surface
if (!surface_exists(surf_dream))
{
    surf_dream = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
}

surface_set_target(surf_dream);
draw_clear_alpha(c_black, 0);

shader_set(shd_dream);
shader_set_uniform_f(dream_time, current_time / 1000);
draw_surface(application_surface, 0, 0);
shader_reset();

surface_reset_target();

// Draw the finished dream surface to the screen
draw_surface(surf_dream, 0, 0);

// Pulse on beat stuff
if (!global.secret)
{
    var _bpm = 93;
    var _beat_time = 60 / _bpm;
    var _beat = floor((current_time / 1000) / _beat_time) mod 4;

    if (_beat == 0 || _beat == 2)
    {

        var _scale = 1

        draw_surface_ext(surf_dream,
            0 - (surface_get_width(surf_dream) * (_scale - 1) * 0.5),
            0 - (surface_get_height(surf_dream) * (_scale - 1) * 0.5),
            _scale, _scale, 0, c_white, 1);
    }
    else
    {
        draw_surface(surf_dream, 0, 0);
    }
}