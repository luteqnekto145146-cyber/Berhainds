// Проверяем положение мыши в комнате
var _mouse_x = mouse_x;
var _mouse_y = mouse_y;
var _hovered_any = false;

for (var i = 0; i < item_count; i++) {
    var _pos = item_positions[i];
    
    // Проверяем, находится ли курсор внутри границ конкретной кнопки
    if (_mouse_x >= _pos.x && _mouse_x <= _pos.x + btn_w && _mouse_y >= _pos.y && _mouse_y <= _pos.y + btn_h) {
        selected_item = i;
        _hovered_any = true;
        break;
    }
}

if (!_hovered_any) selected_item = -1;

// Обработка клика мыши для покупки
if (mouse_check_button_pressed(mb_left) && selected_item != -1) {
    var _current_item = shop_items[selected_item];
    var _player_coins = inventory_count_coins();
    
    if (_player_coins >= _current_item.cost) {
        inventory_remove_coins(_current_item.cost); 
        scr_items(_current_item.item_data, _current_item.quantity);
    }
}

// Закрытие магазина на Escape или повторное E
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("E"))) {
    instance_destroy();
}