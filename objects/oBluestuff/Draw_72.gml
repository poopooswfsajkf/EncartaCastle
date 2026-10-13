/// @description Blue gradient
if !surface_exists(surf) then surf = surface_create(64,64);
surface_set_target(surf);
draw_sprite_ext( sGradient, 0, 0, 0, 2, 2, 0, image_blend, image_alpha);
surface_reset_target();