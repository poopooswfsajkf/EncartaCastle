// Inherit the parent event
event_inherited();

if do_particles
{
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/v_enemyhurt_calculator", x, y)
}