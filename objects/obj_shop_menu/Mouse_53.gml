// Получаем координаты мышки относительно интерфейса
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var cx = screen_w / 2;
var cy = screen_h / 2;

// Координаты кнопок (должны быть точно такими же, как в Draw GUI)
var b1_x1 = cx - 180; var b1_y1 = cy - 60; var b1_x2 = cx + 180; var b1_y2 = cy - 10;
var b2_x1 = cx - 180; var b2_y1 = cy + 20; var b2_x2 = cx + 180; var b2_y2 = cy + 70;

// ПОКУПКА АПТЕЧКИ (Кнопка 1)
// ПОКУПКА АПТЕЧКИ (Кнопка 1)
if (mx >= b1_x1 && mx <= b1_x2 && my >= b1_y1 && my <= b1_y2) {
    // 1. Проверяем, хватает ли у игрока монет (цена: 5 монет)
    if (global.coins >= price_medkit) {
        
        // 2. Проверяем, существует ли инвентарь, и пытаемся положить туда 1 Аптечку (ID = 3)
        if (instance_exists(obj_inventory)) {
            var success = obj_inventory.add_item_to_inv(global.db_items.potion, 1);
            
            // 3. Если в инвентаре нашлось место — списываем деньги!
            if (success) {
                global.coins -= price_medkit; // Списываем 5 монет
                show_debug_message("Аптечка куплена и добавлена в инвентарь!");
            } else {
                show_debug_message("Нет места в инвентаре для аптечки!");
            }
        }
    }
}

// ПОКУПКА СЮРИКЕНОВ (Кнопка 2)
if (mx >= b2_x1 && mx <= b2_x2 && my >= b2_y1 && my <= b2_y2) {
    // Предположим, пачка сюрикенов стоит 10 монет (замените price_shuriken на вашу переменную цены, если она есть)
    var price_shuriken = 5; 
    
    if (global.coins >= price_shuriken) {
        if (instance_exists(obj_inventory)) {
            
            // Пытаемся положить Сапфировый сюрикен (ID = 7) в количестве 5 штук напрямую в рюкзак!
            var success = obj_inventory.add_item_to_inv(global.db_items.shuriken, 5);
  
            if (success) {
                global.coins -= price_shuriken; // Списываем монеты
                show_debug_message("5 Сапфировых сюрикенов добавлены в инвентарь!");
            } else {
                show_debug_message("Нет места в инвентаре для сюрикенов!");
            }
        }
    }
}

// КЛИК МИМО ОКНА — ЗАКРЫТЬ МАГАЗИН
if (mx < cx - 200 || mx > cx + 200 || my < cy - 150 || my > cy + 150) {
    instance_destroy(); // Уничтожаем меню (сработает Clean Up и игра снимется с паузы)
}
