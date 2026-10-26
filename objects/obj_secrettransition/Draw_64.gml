
for (var i = 0; i < array_length(stickers); i++)
{

    var s = stickers[i];

draw_sprite_ext(
spr_secret_transition_stickers,
s.image_index,
s.x + (sin(s.x + s.y + (current_time / 350)) * 3),
s.y + (sin((s.x - s.y) + (current_time / 220)) * 3),
s.scale,
s.scale,
0,
c_white,
s.image_alpha)
}