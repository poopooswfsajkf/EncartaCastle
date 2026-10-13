/// @description Alpha & Scale

//Alpha
image_alpha = abs(dcos(get_timer()/50000));

//Scale
scale += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
scale = clamp(scale, 1, 10);
if (window_get_height() != width*scale){
	window_set_size(width*scale,height*scale);
}