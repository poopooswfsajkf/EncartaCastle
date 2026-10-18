if (!global.panic.lap2)
    return;
	if (global.panic.lap2)
{
    dream_transition = min(
        dream_transition + dream_transition_speed * (delta_time / 1000000),
        1
    );
}
else
{
    dream_transition = 0;
}