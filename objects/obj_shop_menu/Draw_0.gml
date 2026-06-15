// Баланс монет на экране
var _current_coins = inventory_count_coins();
draw_set_color(c_yellow);
draw_text(32, 32, "Монеты: " + string(_current_coins));

// Цикл рисует ВСЕ 4 КНОПКИ автоматически!
for (var i = 0; i < item_count; i++) {
    var _item = shop_items[i];
    var _pos = item_positions[i];
    
    // 1. Проверяем ограничение товара (только для обычных товаров)
    if (!_item.is_sell && _item.stock <= 0) {
        draw_set_color(c_red);
        draw_rectangle(_pos.x, _pos.y, _pos.x + btn_w, _pos.y + btn_h, true);
        
        draw_set_color(c_maroon);
        draw_set_halign(fa_center);
        draw_text(_pos.x + (btn_w / 2), _pos.y + (btn_h / 2) - 8, "НЕТ");
        draw_set_halign(fa_left);
        continue; // Теперь continue работает идеально!
    }
    
    // 2. Рисуем рамку кнопки (обычную или подсвеченную)
    if (i == selected_item) {
        draw_set_color(c_white);
        draw_set_alpha(0.2);
        draw_rectangle(_pos.x, _pos.y, _pos.x + btn_w, _pos.y + btn_h, false);
        draw_set_alpha(1.0);
        draw_rectangle(_pos.x, _pos.y, _pos.x + btn_w, _pos.y + btn_h, true);
    } else {
        // Кнопку продажи подсветим зеленым оттенком, остальные — серые
        draw_set_color(_item.is_sell ? c_green : c_gray);
        draw_rectangle(_pos.x, _pos.y, _pos.x + btn_w, _pos.y + btn_h, true);
    }
    
    // 3. Рисуем иконку из базы данных предметов
    if (sprite_exists(_item.item_data.sprite)) {
        draw_sprite(_item.item_data.sprite, 0, _pos.x + (btn_w / 2), _pos.y + 20);
    }
    
    // 4. Текст цены и лимита склада
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    
    if (_item.is_sell) {
        draw_text_transformed(_pos.x + (btn_w / 2), _pos.y + 36, _item.name, 0.7, 0.7, 0);
    } else {
        draw_text_transformed(_pos.x + (btn_w / 2), _pos.y + 36, _item.name + "\nОст: " + string(_item.stock), 0.7, 0.7, 0);
    }
    
    draw_set_halign(fa_left);
}