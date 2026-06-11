
var final_scale = 1;

if (room == r_doroga) {
    final_scale = 0.35; 
}


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * final_scale, image_yscale * final_scale, image_angle, image_blend, image_alpha);




    
	if(variable_instance_exists(id, "popur_text") and popup_text != "") {
	
	
	draw_set_font(fnt_main)
	
	
    draw_set_halign(fa_center); // Выравниваем текст по центру
    
    // Выбираем цвет: если отбито — зеленый, если блок — белый, если осечка — красный
    if (popup_text == "prect!") draw_set_color(c_green);
    else if (popup_text == "Block!") draw_set_color(c_white);
    else draw_set_color(c_red);
	
	var _old_depth = depth
	depth = - 10000
	
	
	
    // Рисуем текст чуть выше головы персонажа (y - 40 пикселей)
    draw_text(x, y - 80, popup_text); 
depth = _old_depth
	}
	