// Changed from 1/3 (0.33) to 0.05 to make the expansion much slower
titlexscale = approach(titlexscale, 5, 0.05);
titleyscale = approach(titleyscale, 5, 0.05);

// Changed from 0.18 to 0.02 to make the fade-out last much longer
titlealpha = approach(titlealpha, 0, 0.02);

// Destroy the instance once it is completely invisible
if (titlealpha <= 0) {
    instance_destroy();
}
