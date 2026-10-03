with other
{
	if state != states.ball
	{
		sprite_index = obj_player.spr_player_ball
		movespeed = 10
		state = states.ball
		x = other.x
		y = other.y
	}
}
