if creditspart = 0
{
draw_sprite(velvetLogo_0,vivetkaiframes,480,kaicenatpos)
}
else if creditspart = 1
{
	draw_sprite(spr_blahbleh2,0,0,100)
}
else if creditspart = 2
{
	draw_sprite(spr_blahbleh,0,0,30)
}
else if creditspart = 3
{
	draw_sprite_ext(spr_blahbleh3,0,480 + irandom_range(shake,-shake),270 + irandom_range(shake,-shake),scale,scale,0,-1,1)
}
if creditspart = 1 || creditspart = 2
{
	if showlogo = true
	{
	for (var i = 0; i < maxlogos; i++)
	{
		if maxlogos <= 1
		{
			draw_sprite_ext(spr_CClogo,0,480,270,skibidi[i],skibidi[i],0,-1,1)
			skibidi[i] = approach(skibidi[i],1,0.2)
		}
		else
		{
			if i = 0
			{
				logopos[i] = 300
			draw_sprite_ext(logos[i],0,logopos[i],270,skibidi[i],skibidi[i],0,-1,1)
			}
			else if i = 1
			{
				draw_sprite_ext(logos[i],0,logopos[i - 1] + 400,200,skibidi[i],skibidi[i],0,-1,1)
			}
			else
			{
				draw_sprite_ext(logos[i],0,480,430,skibidi[i],skibidi[i],0,-1,1)
			}
			skibidi[i] = approach(skibidi[i],1,0.2)
		}
	}
	}
}
if encartacastlelogo = true
{
draw_set_alpha(1)
draw_set_colour(c_white)
draw_rectangle(0,0,SCREEN_WIDTH,SCREEN_HEIGHT,false)
draw_reset_color()
draw_sprite_ext(spr_EClogo,0,480,270,scale,scale,0,-1,1)
}
draw_set_alpha(alpha)
draw_set_colour(c_black)
draw_rectangle(0,0,SCREEN_WIDTH,SCREEN_HEIGHT,false)
draw_reset_color()