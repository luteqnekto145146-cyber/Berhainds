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
if (mx >= b1_x1 && mx <= b1_x2 && my >= b1_y1 && my <= b1_y2) {
    if (global.coins >= price_medkit) {
        global.coins -= price_medkit; // Списываем 5 монет
        
        // Проверяем: если у игрока МЕНЬШЕ максимального здоровья — лечим его сразу
        if (obj_beg_terrei.player_hp < obj_beg_terrei.player_hp_max) {
            obj_beg_terrei.player_hp += 30; // Восстанавливаем 30 HP
            
            // Защита от превышения максимума
            if (obj_beg_terrei.player_hp > obj_beg_terrei.player_hp_max) {
                obj_beg_terrei.player_hp = obj_beg_terrei.player_hp_max;
            }
        } 
        else {
            // ЕСЛИ ЗДОРОВЬЕ ПОЛНОЕ (ФУЛЛ ХП) — выбрасываем аптечку на землю!
            // Спавним её рядом с игроком, который стоит у магазина, с небольшим случайным смещением
            instance_create_layer(obj_beg_terrei.x + random_range(-15, 15), obj_beg_terrei.y + random_range(-15, 15), "Instances", obj_medkit);
        }
    }
}
// ПОКУПКА СЮРИКЕНОВ
if (mx >= b2_x1 && mx <= b2_x2 && my >= b2_y1 && my <= b2_y2) {
    if (global.coins >= price_shurikens) {
        global.coins -= price_shurikens;
        obj_beg_terrei.shurikens += 3; // Добавляем 3 штуки в инвентарь
    }
}

// КЛИК МИМО ОКНА — ЗАКРЫТЬ МАГАЗИН
if (mx < cx - 200 || mx > cx + 200 || my < cy - 150 || my > cy + 150) {
    instance_destroy(); // Уничтожаем меню (сработает Clean Up и игра снимется с паузы)
}
