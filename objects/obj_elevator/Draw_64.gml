if (menu_open) {
    var ww = display_get_gui_width();
    var hh = display_get_gui_height();
    
    draw_set_color(c_black); draw_set_alpha(0.75);
    draw_rectangle(0, 0, ww, hh, false);
    
    draw_set_alpha(1.0); draw_set_color(c_white); draw_set_halign(fa_center);
    draw_text(ww / 2, hh / 2 - 120, "УПРАВЛЕНИЕ: СТРЕЛКИ И ENTER (ESC ДЛЯ ВЫХОДА)");
    
    var start_y = hh / 2 - 40; 
    var line_height = 40;
    var current_item = 0; 
    
    if (menu_page == 1) {
        var draw_y = start_y;
        if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_white);
        draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Этаж 0 (Хаб)");
        draw_y += line_height; current_item++;
        
        if (global.max_floor_reached >= 5) {
            if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_white);
            draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Этаж 5");
            draw_y += line_height; current_item++;
        }
        if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_yellow);
        draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Далее ->");
    }
    else if (menu_page == 2) {
        var draw_y = start_y;
        if (global.max_floor_reached >= 10) {
            if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_white);
            draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Этаж 10");
            draw_y += line_height; current_item++;
        }
        if (global.max_floor_reached >= 15) {
            if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_white);
            draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Этаж 15");
            draw_y += line_height; current_item++;
        }
        if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_yellow);
        draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Еще далее ->");
    }
    else if (menu_page == 3) {
        var draw_y = start_y;
        if (global.max_floor_reached >= 20) {
            if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_white);
            draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Этаж 20");
            draw_y += line_height; current_item++;
        }
        if (global.max_floor_reached >= 24) {
            if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_white);
            draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Этаж 24 (Предбосс)");
            draw_y += line_height; current_item++;
        }
        if (menu_index == current_item) draw_set_color(c_green); else draw_set_color(c_yellow);
        draw_text(ww / 2, draw_y, (menu_index == current_item ? "> " : "") + "Вернуться на стр. 1");
    }
    draw_set_color(c_white); draw_set_halign(fa_left);
}
