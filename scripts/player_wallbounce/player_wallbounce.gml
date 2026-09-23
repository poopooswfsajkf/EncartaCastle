function player_wallbounce()
{
	var _spd = 8;
	
	movespeed = approach(
		movespeed,
		P_MOVE != 0 ? P_MOVE * _spd : 0,
		P_MOVE != 0 ? 1 : 0.5
	);
	
	hsp = movespeed;
	
	if !grounded
	{
		// Airborne behavior
	}
	else if vsp >= 0
	{
		flash = 8;
		
		with create_effect(x, y, spr_crazyruneffect)
		{
			image_xscale = other.xscale;
			depth = -150;
		}
		
		if p_move != 0
		{
			xscale = p_move;
			state = states.mach3;
			movespeed = max(abs(movespeed), 12);
			sprite_index = spr_player_mach3;
		}
		else
		{
			state = states.normal;
		}
	}
	
	image_speed = 0.5;
	
	do_taunt();
}