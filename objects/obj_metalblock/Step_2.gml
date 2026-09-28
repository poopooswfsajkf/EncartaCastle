with obj_player
{
	var kill = false
	if (state == states.mach3 || state == states.slip || state == states.downdash) && place_meeting(x + hsp + xscale, y, other)
		kill = true
	else if ((state == states.groundpound && freefallsmash >= 10) || state == states.slip || state == states.piledriver || state == states.downdash) && place_meeting(x, y + 1, other)
		kill = true
	
	if kill
		instance_destroy(other)
}
