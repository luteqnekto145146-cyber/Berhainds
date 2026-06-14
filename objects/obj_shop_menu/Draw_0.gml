// Рисуем кнопки на карте
for (var i = 0; i < item_count; i++) {
    var _item = shop_items[i];
    var _pos = item_positions[i];
    
    // Отрисовка рамки и фона кнопки
    if (i == selected_item) {
        // Белая полупрозрачная плашка при наведении
        draw_set_color(c_white);
        draw_set_alpha(0.2);
        draw_rectangle(_pos.x, _pos.y, _pos.x + btn_w, _pos.y + btn_h, false);
        draw_set_alpha(1.0);
        draw_rectangle(_pos.x, _pos.y, _pos.x + btn_w, _pos.y + btn_h, true);
    } else {
        // Обычная серая рамка
        draw_set_color(c_gray);
        draw_rectangle(_pos.x, _pos.y, _pos.x + btn_w, _pos.y + btn_h, true);
    }
    
    // Рисуем иконку предмета (смещаем к центру верхней части кнопки)
    if (sprite_exists(_item.item_data.sprite)) {
        // Центрируем иконку по горизонтали внутри рамки кнопки
        draw_sprite(_item.item_data.sprite, 0, _pos.x + (btn_w / 2), _pos.y + 20);
    }
    
    // Настройка шрифта и текста под иконкой
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text_transformed(_pos.x + (btn_w / 2), _pos.y + 36, _item.name, 0.8, 0.8, 0); // Текст чуть уменьшен (0.8), чтобы влезал
    draw_set_halign(fa_left); // Сбрасываем выравнивание в стандартное
}