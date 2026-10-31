otherindex += 0.35;

if (x != obj_player.x)
{
	image_xscale = sign(obj_player.x - x);
}

switch (state)
{
	case states.normal:
		sprite_index = idlespr;
		break;
	case states.throwing:
		if anim_ended()
		{
			image_index = image_number - 1;
		}
		if (floor(image_index) >= 3)
		{
			if !throwingcollects
			{
				alarm[1] = 1
				throwingcollects = true
			}
			if scoretogive == 0
			{
				state = states.jump;
				sprite_index = throwspr;
				repeat (10)
            instance_create(x + irandom_range(-50, 50), y + irandom_range(-50, 50), obj_memoryproj);
				image_index = 0;
			}
		}
		break;
	case states.transition:


		break;
	case states.jump:

			instance_destroy();
		break;
}

adjusted_y = y - 42