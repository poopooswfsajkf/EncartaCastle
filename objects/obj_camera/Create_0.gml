mag = 0
mag_decel = 0.5
cam_charge = 0
info_visible = false
cam_y_offset = 0
constant_y_offset = 50
inclination_speed = 0.02; 
state = 1
target_x = obj_player.x;
target_y = obj_player.y;
    cam_x = camera_get_view_x(view_camera[0]);
    cam_y = camera_get_view_y(view_camera[0]);
target_door = noone;
// --- MISSING VARIABLES ADDED HERE ---
angle_phase = 0;   // Tracks the progress of the continuous rocking wave
target_angle = 0;  // Holds the destination tilt angle 
camera_angle = 0;  // Holds the actual current camera tilt angle


campos = {
	x: 0,
	y: 0
}

//version = "DEBLOATED";

depth = -10000
