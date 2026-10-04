stickers = []
targetRoom  = 0
state = 0
sticker_count = 175
addStick = function()
{
	var StickerStruct = 
	{
		x: irandom_range(-32,SCREEN_WIDTH + 32),
		y: irandom_range(-32,SCREEN_HEIGHT + 32),
		scale: 1.25,
		vspeed: 0,
		image_index: irandom_range(0,sprite_get_number(spr_secret_transition_stickers) - 1),
		image_alpha: 1,
		spd: irandom_range(-1.6,-3)
	}
	array_push(stickers,StickerStruct)
}
		sticktime =90
		addStick()
		doalarm = 0
		alarm0 = 0