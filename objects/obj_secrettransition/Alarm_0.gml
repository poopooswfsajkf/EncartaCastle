var _add_spot = function(_x, _y, _scale)
{
    var q =
    {
        x: _x,
        y: _y,
        scale: _scale,
        alpha: 1,
        image_index: irandom(sprite_get_number(spr_secret_transition_stickers) - 1),
        visible: true
    };

    array_push(noisehead, q);
    return q;
};

if (noiseAmt <= 0)
{
    alarm[1] = 5;
    exit;
}

alarm[0] = 1;

repeat (5)
{
    var _x = irandom_range(-32, display_get_gui_width() + 32);
    var _y = irandom_range(-32, display_get_gui_height() + 32);

    _add_spot(_x, _y, 1.1);
}

noiseAmt -= 5;