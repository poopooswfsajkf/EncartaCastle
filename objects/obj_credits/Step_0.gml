yy -= 1;
layer_y(credits_layer, yy);

if (yy + credits_height < 0)
{
    game_end();
}