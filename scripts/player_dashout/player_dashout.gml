function player_dashout()
{
	if fmod_studio_event_instance_get_playback_state("event:/sfx/player/dashout_slip") != FMOD_STUDIO_PLAYBACK_STATE.PLAYING
	fmod_studio_event_instance_oneshot_3d("event:/sfx/player/dashout_slip", x, y)
	if !grounded
	{
		if P_MOVE != 0
		{
			movespeed = 12 * P_MOVE
			hsp = lerp(hsp,movespeed,0.07)
		}
	}
	else
	{
		flash = 8;
		
		with (create_effect(x, y, spr_crazyruneffect))
		{
			image_xscale = other.xscale;
			depth = -150;
		}
		wallbounce_mach3 = true;
		state = states.mach3;
		movespeed = 12;
		if (P_MOVE != 0)
		{
		xscale = P_MOVE
		hsp = xscale * movespeed;
		}
		sprite_index = spr_player_mach3;
	}
	if input_check_pressed(INPUTS.down)
	{
		vsp = 14
	}
	aftimg_timers.blur.do_it = true
}