function player_taunt()
{
	hsp = 0
	vsp = 0
	
	var endtaunt = false
	
	if !player_is_supertaunt(id, sprite_index)
	{
		if input_direction_check(INPUTS.up) && supertauntshow
		{
			reset_anim(choose(spr_player_supertaunt1, spr_player_supertaunt2, spr_player_supertaunt3, spr_player_supertaunt4))
			fmod_studio_event_instance_oneshot_3d("event:/sfx/player/supertaunt", x, y)
			var spds = [[0, -1], [1, -1], [1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1]]
			var i = 0
			var spd = 20
			repeat 8
			{
				with particle_create(x, y, particles.sparks)
				{
					hsp = spds[i][0] * spd
					vsp = spds[i][1] * spd
				}
				i++
			}
			exit;
		}
		
		if taunttimer > 0
			taunttimer--
		else
			endtaunt = true
	}
	else
	{
		supertauntcount = 0
		supertauntshow = false
		shake_camera(4, 5 / room_speed)
		image_speed = 0.4
		
		if anim_ended()
		{
			endtaunt = true
			with par_enemy
			{
				if (bbox_in_camera() && enemy_can_die())
					instance_destroy()
			}
		}
	}
	
	if endtaunt
	{
		state = prev.state
		vsp = prev.vsp + grav
		sprite_index = prev.sprite_index
	}
}
