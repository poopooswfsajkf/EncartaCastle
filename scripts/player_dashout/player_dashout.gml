function player_dashout()
{
	if fmod_studio_event_instance_get_playback_state("event:/sfx/player/dashout_slip") != FMOD_STUDIO_PLAYBACK_STATE.PLAYING
	fmod_studio_event_instance_oneshot_3d("event:/sfx/player/dashout_slip", x, y)
	if !grounded
	{
		if P_MOVE != 0
		{
			movespeed = 12 * P_MOVE
			hsp = approach(hsp,movespeed,1)
		}
		if scr_solid(x + xscale,y) && outofcrusher = false
		{
			wallbouncedampen += 2
			state = states.wallbounce
			vsp = -15 + wallbouncedampen
		}
	}
	else
	{
		outofcrusher = false
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
		outofcrusher = true
		vsp = 14
		movespeed = 12
		if P_MOVE != 0
		{
			xscale = P_MOVE
		}
		hsp = xscale * movespeed;
	}
	aftimg_timers.blur.do_it = true
	instakill = true
}