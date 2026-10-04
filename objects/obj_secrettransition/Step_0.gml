switch state 
{
	case 0:
	for (var i = 0; i < sticker_count; i++)
	{
		if sticktime >= 0 
		sticktime--
		else 
		{
			addStick()
			sticktime = 75
		}
	}
	if array_length(stickers) >= sticker_count
	{
		if alarm0 = 0
		{
			alarm0 = 1
alarm[0] = 60
		}
	}
	break;
	case 1:
	{
		if doalarm = 0
		{
			doalarm = 1
			alarm[1] = 128
		}
			for (var i = 0; i < array_length(stickers); i++)
	     {
		var e = stickers[i]
 e.image_alpha-=0.025
 e.y-=e.vspeed
 e.vspeed-= e.spd 
	
	     }
	
	}
	break
}


	for (var i = 0; i < array_length(stickers); i++)
	{

		var e = stickers[i]
 e.scale = approach(e.scale,1,0.1)
		
	}