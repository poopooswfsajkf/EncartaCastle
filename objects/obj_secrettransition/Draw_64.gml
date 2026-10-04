// =====================================================
// DRAW EVENT
// =====================================================

for (var i = 0; i < sticker_count; i++)
{
    var s = stickers[i];

    if (!s.active || s.alpha <= 0)
        continue;

    draw_sprite_ext(
        spr_secret_transition_stickers,
        s.image,
        s.x,
        s.y,
        s.scale,
        s.scale,
        0,
        c_white,
        s.alpha
    );
}