var ww = display_get_gui_width();
var hh = display_get_gui_height();

// 1. РИСУЕМ ВЕРХНИЙ ИНДИКАТОР (Показываем только во время испытаний)
if (room != rm_tower_lobby) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    // Подложка
    draw_set_color(c_black); draw_set_alpha(0.6);
    draw_rectangle((ww / 2) - 100, 10, (ww / 2) + 100, 45, false);
    
    // Текст
    draw_set_alpha(1.0);
    if (global.current_floor > 15) draw_set_color(c_orange); else draw_set_color(c_white);
    
    var floor_text = "ЭТАЖ: " + string(global.current_floor) + " / 25";
    draw_text(ww / 2, 18, floor_text);
}

// 2. РИСУЕМ ЭФФЕКТНЫЙ ТАЮЩИЙ СПЛЭШ ПО ЦЕНТРУ
if (splash_alpha > 0 && global.current_floor > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_alpha(splash_alpha);
    
    if (global.current_floor == 10 || global.current_floor == 25) {
        draw_set_color(c_red);
    } else if (global.current_floor > 15) {
        draw_set_color(c_orange);
    } else {
        draw_set_color(c_yellow);
    }
    
    var text_to_draw = "ЭТАЖ " + string(global.current_floor);
    if (global.current_floor == 10) text_to_draw = "БОСС: ПОДРЫВНИК";
    if (global.current_floor == 25) text_to_draw = "ФИНАЛЬНЫЙ БОСС";
    
    draw_text_transformed(ww / 2, hh / 2, text_to_draw, splash_scale, splash_scale, 0);
    
    // Сброс
    draw_set_alpha(1.0); draw_set_color(c_white);
    draw_set_halign(fa_left); draw_set_valign(fa_top);
}
