
switch (creditspart)
{
	case 0:
if logoappear = true
{
	if presents = false
	{
	if vivetkaiframes < 12
	{
		vivetkaiframes += 1 / logospeed
	}
	else
	{
		vivetkaiframes = 13
		if goup = false
		{
		goup = true
		}
	}
	}
	else
	{
		if vivetkaiframes < 21
	{
		vivetkaiframes += 1 / logospeed
	}
	else
	{
		if alarm[2] = -1 && godown = false
		alarm[2] = 60
	}
	}
}
if goup == true
{
	kaicenatpos = approach(kaicenatpos,200,1)
	if kaicenatpos == 200
	{
		presents = true
	}
}
if godown == true
{
	kaicenatpos = approach(kaicenatpos,800,3)
	if kaicenatpos == 800
	{
		godown = false
		transition = true
		alarm[4] = 20
	}
}
break;
case 1:
if showlogo = false
{
if showlogoframe < showlogomax
{
	showlogoframe++
}
else
{
	showlogoframe = 0
	showlogo = true
	if alarm[1] = -1
	alarm[1] = 80

}
}

break;
case 2:
maxlogos = 3
if showlogo = false
{
if showlogoframe < showlogomax
{
	showlogoframe++
}
else
{
	showlogoframe = 0
	showlogo = true
	if alarm[1] = -1
	alarm[1] = 80
}
}
break;
case 3:
if grow = false
{
if thisisframes < thisismax
{
	thisisframes++
}
else
{
	thisisframes = 0
	grow = true
}
}
else
{
	
}

break;
}
if grow = true
{
	if encartacastlelogo = false
	{
	scale = approach(scale,10,0.1)
	shake = approach(shake,10,0.5)
	if scale = 8
	{
		encartacastlelogo = true
	}
	}
	else
	{
		scale = approach(scale,1,0.5)
	shake = 0
	if scale = 1
	{
		grow = false
		alarm[4] = 60
	}
	}
}
if killme = true
{
	killme = false
	transition = true
	trans2 = false
		alarm[4] = 40
}
if trans1 = true
{
alpha = approach(alpha,1,0.05)
if alpha = 1
{
	trans1 = false
	trans2 = false
	if creditspart != 3
	creditspart++
	else
	room_goto(init_objs_room)
	showlogo = false
		for (var i = 0; i < array_length(logos); i++)
{
	skibidi[i] = 4
}
}
}
if trans2 = true
{
alpha = approach(alpha,0,0.05)
if alpha = 0
{
	trans2 = false
	trans1 = false
}
}
if transition = true
{
	transition = false
	if alpha <= 0.5
	{
		trans1 = true
	}
	else if alpha >= 0.5 
	{
		trans2 = true
	}
}
if keyboard_check_pressed(vk_anykey) || gamepad_check_any()
{
	if creditspart != 3
	{
	alarm[1] = -1
	showlogoframe = 0 
	showlogo = false
	skipped = true
	alpha = 1
	transition = true
	creditspart++
			for (var i = 0; i < array_length(logos); i++)
{
	skibidi[i] = 4
}
	}
	else
	{
		if encartacastlelogo = false
		{
		encartacastlelogo = true
		scale = 7
		grow = true
		}
		else
		{
			if trans1 = false
			{
			alarm[4] = -1
	showlogoframe = 0 
	showlogo = false
	skipped = true
	transition = true
			}
		}
	}
}