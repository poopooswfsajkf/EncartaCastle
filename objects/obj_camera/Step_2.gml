
 // CAMERA POSITION
if (state == 2)
{
    campos.x = target_x - (SCREEN_WIDTH / 2);
    campos.y = target_y - (SCREEN_HEIGHT / 2);
}
else
{
    campos.x = obj_player.x - (SCREEN_WIDTH / 2);
    campos.y = obj_player.y - (SCREEN_HEIGHT / 2) - constant_y_offset;
}

if (obj_player.state == states.backtohub)
    campos.y = obj_player.ystart - (SCREEN_HEIGHT / 2) - 50;

campos.x += cam_charge;
campos.y += cam_y_offset;

campos.x = clamp(campos.x, 0, room_width - SCREEN_WIDTH);
campos.y = clamp(campos.y, 0, room_height - SCREEN_HEIGHT);

if (global.panic.active && !global.secret)
    mag = 1;

// CAMERA TILT
if (global.panic.active && global.option_camTilt)
{
    angle_phase += inclination_speed;

    if (angle_phase >= 2 * pi)
        angle_phase -= 2 * pi;

    var max_inclination = 1.2;

    target_angle = sin(angle_phase) * max_inclination;

    camera_angle = approach(camera_angle, target_angle, 0.05);
}
else
{
    target_angle = 0;

    camera_angle = approach(camera_angle, 0, 0.05);

    if (abs(camera_angle) < 0.01)
        camera_angle = 0;
}

// SCREEN SHAKE
if (mag > 0 && global.option_screenshake)
{
    campos.x += irandom_range(-mag, mag);
    campos.y += irandom_range(-mag, mag);
}

mag = max(mag - mag_decel, 0);

cam_y_offset = approach(cam_y_offset, 0, 4);

// APPLY CAMERA POSITION + TILT
if (state == 2 || (!obj_player.secret_exit && obj_player.sprite_index != spr_pizzaportalend))
{
    var _smooth = (state == 2) ? 0.08 : 0.30;

    cam_x = lerp(cam_x, campos.x, _smooth);
    cam_y = lerp(cam_y, campos.y, _smooth);

    camera_set_view_pos(view_camera[0], cam_x, cam_y);
    camera_set_view_angle(view_camera[0], camera_angle);
}
else
{
    camera_set_view_angle(view_camera[0], 0);
}