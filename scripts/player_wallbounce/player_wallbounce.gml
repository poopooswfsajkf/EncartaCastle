function player_wallbounce()
{

	
	if (!grounded)
	{
		var _spd = 12;
	
	if (P_MOVE != 0)
	{
		movespeed = _spd * P_MOVE
		hsp = approach(hsp,movespeed,1)
	}
		sprite_index = spr_player_wallbounce;
		if input_check_pressed(INPUTS.down)
		{
						if fmod_studio_event_instance_get_playback_state(dashdown_snd) != FMOD_STUDIO_PLAYBACK_STATE.PLAYING
		fmod_studio_event_instance_start(dashdown_snd)
			state = states.downdash
			hsp = 0
			vsp = 15
			flash = 8;
		}
		if (input_check_pressed(INPUTS.dash) || input_check_pressed(INPUTS.grab))
		{
			flash = 8;
		
		with (create_effect(x, y, spr_crazyruneffect))
		{
			image_xscale = other.xscale;
			depth = -150;
		}
			movespeed = 16;
			if (P_MOVE != 0)
		{
		xscale = P_MOVE
		}
		hsp = xscale * movespeed;
			state = states.dashout
			vsp = -15
			sprite_index = spr_player_dashout
		}
		

	}
	else if ((!grounded || scr_slope(x, y + 1)) && scr_hitwall(x + xscale, y))
	{
					movespeed = 16;
			if (P_MOVE != 0)
		{
		xscale = P_MOVE
		}
		hsp = xscale * movespeed;
			state = states.dashout
			vsp = -15
			sprite_index = spr_player_dashout
	}
	else if (vsp >= 0)
	{
		flash = 8;
		
		with (create_effect(x, y, spr_crazyruneffect))
		{
			image_xscale = other.xscale;
			depth = -150;
		}
		
		// Landing from wallbounce goes directly into Mach 3
		wallbounce_mach3 = true;
		state = states.mach3;
		movespeed = 16;
		if (P_MOVE != 0)
		{
		xscale = P_MOVE
		hsp = xscale * movespeed;
		}
		
		sprite_index = spr_player_mach3;
	}
	
	image_speed = 0.5;
	
	do_taunt();
	
	aftimg_timers.mach.do_it = true
	instakill = true
}