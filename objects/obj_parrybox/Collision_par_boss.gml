if !other.hurtplayer
	exit;

with obj_player
{
	state = states.parry
	var ix = irandom_range(1, 3)
	var parry_sprites = [obj_player.spr_player_parry1, obj_player.spr_player_parry2, obj_player.spr_player_parry3]
	reset_anim(parry_sprites[ix - 1])
	movespeed = -5
	flash = 10
	create_effect(x, y, spr_parryflash).depth = -100
}

with other
{
	var xh = lerp(bbox_left, bbox_right, 0.5)
	obj_player.xscale = x - xh > 0 ? 1 : -1
	
	create_effect(x, y, spr_parryflash).depth = -100
}

event_user(0)