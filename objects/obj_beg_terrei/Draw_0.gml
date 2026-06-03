
var final_scale = 1;

if (room == r_doroga) {
    final_scale = 0.35; 
}


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * final_scale, image_yscale * final_scale, image_angle, image_blend, image_alpha);