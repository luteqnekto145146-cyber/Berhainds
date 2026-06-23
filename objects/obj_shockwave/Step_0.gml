image_xscale += wave_speed;
image_yscale += wave_speed;
image_alpha = 1 - (image_xscale / max_scale);
if (image_xscale >= max_scale) {
    instance_destroy();
}
