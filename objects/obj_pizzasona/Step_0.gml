// =====================================================
// GENERAL
// =====================================================

otherindex += 0.35;

if (instance_exists(obj_player) && x != obj_player.x)
{
    image_xscale = sign(obj_player.x - x);
}

adjusted_y = y - 42;


// =====================================================
// STATES
// =====================================================

switch (state)
{
    case states.normal:
    {
        if (sprite_index != idlespr)
        {
            sprite_index = idlespr;
            image_index = 0;
            image_speed = 0.35;
        }

        break;
    }

    case states.throwing:
    {
        if (sprite_index != throwspr)
        {
            sprite_index = throwspr;
            image_index = 0;
            image_speed = 0.35;
        }



            if (!throwingcollects)
            {
                alarm[1] = 1;
                throwingcollects = true;
            }

            // Finish when all collectibles are processed.
            if (scoretogive <= 0)
            {
                state = states.jump;
                image_speed = 0.35;
                image_index = 0;

                repeat (10)
                {
                    instance_create(
                        x + irandom_range(-50, 50),
                        y + irandom_range(-50, 50),
                        obj_memoryproj
                    );
                }
            }
        

        break;
    }

    case states.transition:
    {
        break;
    }

    case states.jump:
    {
        instance_destroy();
        break;
    }
}