function player_wallbounce()
{
	var _spd = 8;
	
	if (P_MOVE != 0)
	{
		movespeed = P_MOVE * _spd;
		xscale = P_MOVE;
	}
	
	hsp = movespeed;
	
	if (!grounded)
	{
		sprite_index = spr_player_mach3;
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
		movespeed = max(abs(movespeed), 12);
		hsp = xscale * movespeed;
		sprite_index = spr_player_mach3;
	}
	
	image_speed = 0.5;
	
	do_grab();
	do_taunt();
}