selected_item = -1;

// Список товаров (0 - сюрикен, 1 - аптечка, 2 - патроны)
shop_items = [
    { item_data: global.db_items.suriken, name: "Сюрикены\n(3 шт.)\n5 мон.", cost: 5, quantity: 3 },
    { item_data: global.db_items.potion, name: "Аптечка\n(1 шт.)\n2 мон.", cost: 2, quantity: 1 },
    { item_data: global.db_items.ammo, name: "Патроны\n(6 шт.)\n10 мон.", cost: 10, quantity: 6 }
];

item_count = array_length(shop_items);

// Размеры кликабельной области для каждой кнопки
btn_w = 90;
btn_h = 70;

// Привязываемся к координатам торговца на карте.
// Если объект торговца называется иначе (например, obj_merchant), замените имя тут:
var _base_x = obj_shop.x; 
var _base_y = obj_shop.y;

// Высчитываем точные координаты кнопок вокруг торговца (сдвиг от центра его спрайта)
item_positions = [
    { x: _base_x + 80 - (btn_w / 2),  y: _base_y - (btn_h / 2) }, // 0: Сюрикен (СПРАВА)
    { x: _base_x - (btn_w / 2),       y: _base_y - 90 - (btn_h / 2) }, // 1: Аптечка (СВЕРХУ)
    { x: _base_x - 80 - (btn_w / 2),  y: _base_y - (btn_h / 2) }  // 2: Патроны (СЛЕВА)
];