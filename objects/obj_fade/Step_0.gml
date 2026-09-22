fadeAlpha += (fade ? fadeadd : -fadeadd);

if (fadeAlpha >= 30)
{
    fadeAlpha = 30;
    fade = false;

    if (room != target_room)
        room_goto(target_room);
}

if (!fade && fadeAlpha <= 0)
{
    fadeAlpha = 0;

}