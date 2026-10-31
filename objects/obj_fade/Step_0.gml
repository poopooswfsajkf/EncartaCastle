// =====================================================
// FADE
// =====================================================

fadeAlpha = clamp(fadeAlpha + (fade ? fadeadd : -fadeadd), 0, 30);

if (fadeAlpha >= 30)
{
    fade = false;

    if (room != target_room)
        room_goto(target_room);
}


// =====================================================
// CAMERA ZOOM
// =====================================================

if (fade)
{
    zoom_progress = min(zoom_progress + fadeadd / 30, 1);

    var _t = zoom_progress;
    obj_camera.zoom -= _t * _t / 5;
}
else
{
    zoom_progress = 0;
    obj_camera.zoom = 1;
}