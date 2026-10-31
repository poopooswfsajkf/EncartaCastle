/// CAMERA ZOOM

var _zoom = global.option_camZoom ? zoom : 1;

// Smoothly approach target zoom.
camzoom = lerp(camzoom, _zoom, camzoom_speed);

// Snap when close enough.
if (abs(camzoom - _zoom) < 0.002)
{
    camzoom = _zoom;
}

// Calculate zoomed camera dimensions.
var cam_width = SCREEN_WIDTH * camzoom;
var cam_height = SCREEN_HEIGHT * camzoom;


// =====================================================
// CAMERA POSITION
// =====================================================

var _cam_x = obj_player.x - (cam_width / 2);
var _cam_y = obj_player.y - (cam_height / 2) - constant_y_offset;

if (obj_player.state == states.backtohub)
{
    _cam_y = obj_player.ystart - (cam_height / 2) - 50;
}

_cam_x += cam_charge;
_cam_y += cam_y_offset;

// Clamp camera to room boundaries.
_cam_x = clamp(_cam_x, 0, max(0, room_width - cam_width));
_cam_y = clamp(_cam_y, 0, max(0, room_height - cam_height));


// =====================================================
// CAMERA TILT
// =====================================================

if (global.panic.active && global.option_camTilt)
{
    angle_phase = (angle_phase + inclination_speed) mod (2 * pi);

    var _max_inclination = 1.2;
    target_angle = sin(angle_phase) * _max_inclination;
}
else
{
    target_angle = 0;
}

camera_angle = lerp(camera_angle, target_angle, 0.05);

if (abs(camera_angle) < 0.01)
{
    camera_angle = 0;
}


// =====================================================
// SCREEN SHAKE
// =====================================================

var _shake_x = 0;
var _shake_y = 0;

if (mag > 0 && global.option_screenshake)
{
    _shake_x = irandom_range(-mag, mag);
    _shake_y = irandom_range(-mag, mag);
}

mag = max(mag - mag_decel, 0);


// =====================================================
// CAMERA OFFSETS
// =====================================================

cam_y_offset = approach(cam_y_offset, 0, 4);


// =====================================================
// APPLY CAMERA POSITION, SIZE AND TILT
// =====================================================

if (!obj_player.secret_exit && obj_player.sprite_index != spr_pizzaportalend)
{
    camera_set_view_size(
        view_camera[0],
        cam_width,
        cam_height
    );

    camera_set_view_pos(
        view_camera[0],
        _cam_x + _shake_x,
        _cam_y + _shake_y
    );

    camera_set_view_angle(
        view_camera[0],
        camera_angle
    );
}
else
{
    camera_set_view_angle(view_camera[0], 0);
}