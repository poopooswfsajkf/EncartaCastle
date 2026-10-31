var _val = 10

global.score += _val
fmod_studio_event_instance_oneshot_3d("event:/sfx/misc/collectPiece", x, y);
var c = {
	sprite_index: asset_get_index(string("spr_memory_piece", irandom_range(1, 3))),
	image_index: self.image_index,
	x: self.x - obj_camera.campos.x,
	y: self.adjusted_y - obj_camera.campos.y,
	val: _val
}

array_push(obj_collect_got_visual.collects, c)

if scoretogive > _val
	alarm[1] = 5

scoretogive -= _val