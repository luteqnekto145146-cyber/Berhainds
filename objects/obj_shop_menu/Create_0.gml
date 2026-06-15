selected_item = -1;

// Размеры кнопок
btn_w = 90;
btn_h = 70;

// Все 4 товара в одном массиве!
shop_items = [
    { item_data: global.db_items.suriken, name: "Сюрикены\n(3 шт.)\n5 мон.", cost: 5, quantity: 3, stock: 5, is_sell: false },
    { item_data: global.db_items.potion, name: "Аптечка\n(1 шт.)\n2 мон.", cost: 2, quantity: 1, stock: 3, is_sell: false },
    { item_data: global.db_items.ammo, name: "Патроны\n(6 шт.)\n10 мон.", cost: 10, quantity: 6, stock: 10, is_sell: false },
    { item_data: global.db_items.revolver, name: "Продать\nРевольвер\n+10 мон.", cost: 10, quantity: 1, stock: 999, is_sell: true } // Это кнопка продажи!
];

// Автоматически будет равно 4
item_count = array_length(shop_items);

// Безопасный поиск торговца
var _merchant_instance = instance_find(obj_shop, 0);
var _base_x = room_width / 2;
var _base_y = room_height / 2;

if (_merchant_instance != noone) {
    _base_x = _merchant_instance.x;
    _base_y = _merchant_instance.y;
}

// Позиции для всех 4 кнопок (справа, сверху, слева, снизу)
item_positions = [
    { x: _base_x + 80 - (btn_w / 2),  y: _base_y - (btn_h / 2) },       // Сюрикен
    { x: _base_x - (btn_w / 2),       y: _base_y - 90 - (btn_h / 2) },  // Аптечка
    { x: _base_x - 80 - (btn_w / 2),  y: _base_y - (btn_h / 2) },       // Патроны
    { x: _base_x - (btn_w / 2),       y: _base_y + 90 - (btn_h / 2) }   // Продажа револьвера
];

item_positions[3] = { x: _base_x - (btn_w / 2), y: _base_y + 90 - (btn_h / 2) };



