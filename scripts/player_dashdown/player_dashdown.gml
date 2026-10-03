function player_dashdown()
{
	var _evilgubbythis = 14
	//after i redid the code i felt like the joke wasnt funny anymore please somebody kill me im tired
    if P_MOVE != 0 && sprite_index = spr_player_downdashstart
    {
	movespeed = _evilgubbythis
	hsp = approach(hsp,movespeed * P_MOVE,0.7)
    }
	if !grounded
	{
		sprite_index = spr_player_downdashstart
	}
	else
	{
		if sprite_index = spr_player_downdashstart
		{
			image_index = 0
			sprite_index = spr_player_downdashend
						fmod_studio_event_instance_stop(dashdown_snd, FMOD_STUDIO_STOP_MODE.IMMEDIATE)
			fmod_studio_event_instance_oneshot_3d("event:/sfx/player/crusherjump_end", x, y)
			hsp = 0
		}
		if anim_ended() && spr_player_downdashend
		{
			flash = 8;
		
		with (create_effect(x, y, spr_crazyruneffect))
		{
			image_xscale = other.xscale;
			depth = -150;
		}
			if P_MOVE != 0
			{
				xscale = P_MOVE
				hsp = 12 * P_MOVE
			}
			outofcrusher = true
			sprite_index = spr_player_dashout
			state = states.dashout
			vsp = -12
			grounded = false
		}
	}
	instakill = true
	aftimg_timers.blur.do_it = true
}