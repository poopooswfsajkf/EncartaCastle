function player_wallbounce()
{

	
	if (!grounded)
	{
		var _spd = 12;
	
	if (P_MOVE != 0)
	{
		movespeed = _spd * P_MOVE
		hsp = lerp(hsp,movespeed,0.1)
	}
		sprite_index = spr_player_wallbounce;
		if input_check_pressed(INPUTS.down)
		{
			state = states.downdash
			hsp = 0
			vsp = 13
		}
		if (input_check_pressed(INPUTS.dash))
		{
			movespeed = 12;
			if (P_MOVE)
		{
		xscale = P_MOVE
		hsp = xscale * movespeed;
		}
			state = states.dashout
			vsp = -5
			sprite_index = spr_player_dashout
		}
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
		movespeed = 12;
		if (P_MOVE != 0)
		{
		xscale = P_MOVE
		hsp = xscale * movespeed;
		}
		
		sprite_index = spr_player_mach3;
	}
	
	image_speed = 0.5;
	
	do_grab();
	do_taunt();
	aftimg_timers.mach.do_it = true
}