
var final_scale = 1;

if (room == r_doroga) {
    final_scale = 0.35; 
}


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * final_scale, image_yscale * final_scale, image_angle, image_blend, image_alpha);




    
	
	// Сначала рисуем самого игрока

// Если текст активен, рисуем его с анимацией
if (text_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Устанавливаем текущий цвет и прозрачность текста
    draw_set_color(text_color);
    draw_set_alpha(text_alpha);
    
    // Рисуем текст над головой игрока (базово -60 пикселей + динамическое смещение text_y_offset)
    draw_text(x, y - 60 + text_y_offset, shield_text);
    
 
    draw_set_alpha(1.0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}
	