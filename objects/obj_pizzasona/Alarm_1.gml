var _val = 10;

global.score += _val;

fmod_studio_event_instance_oneshot_3d(
    "event:/sfx/misc/collectPiece", x, y
);

// Get a random memory piece sprite.
var _spr = asset_get_index(
    "spr_memory_piece" + string(irandom_range(1, 5))
);

// Check that the sprite exists.
if (_spr == -1)
{
    show_debug_message("ERROR: Memory piece sprite not found!");
}
else
{
    var c = {
        sprite_index: _spr,
        image_index: self.image_index,
        x: self.x - obj_camera.campos.x,
        y: self.adjusted_y - obj_camera.campos.y,
        val: _val
    };

    array_push(obj_collect_got_visual.collects, c);
}

if (scoretogive > _val)
{
    alarm[1] = 5;
}

scoretogive -= _val;