
create_effect(x, y, spr_keysparkle)

global.score += 2;
global.combo.timer = 60;
points--;

if (points > 0)
    alarm[0] = 4;
else
create_effect(x, y, spr_genericpoofeffect)
    instance_destroy();

