function player_dashdown()
{
	var _evilgubbythis = 14
	//after i redid the code i felt like the joke wasnt funny anymore please somebody kill me im tired
    if P_MOVE != 0 && sprite_index = spr_player_downdashstart
    {
	movespeed = _evilgubbythis
	hsp = lerp(hsp,movespeed * P_MOVE,0.08)
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
			hsp = 0
		}
		if anim_ended() && spr_player_downdashend
		{
			if P_MOVE != 0
			{
				xscale = P_MOVE
				hsp = 12 * P_MOVE
			}
			// insert some fucking function that destroys the downstart sfx and plays the dashout one
			sprite_index = spr_player_dashout
			state = states.dashout
			vsp = -12
			grounded = false
		}
	}
	aftimg_timers.blur.do_it = true
}