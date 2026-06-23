// 1. Анимация тающего текста по центру экрана
if (splash_alpha > 0) {
    splash_scale += splash_speed_scale; 
    splash_alpha -= splash_speed_fade;  
}

// 2. Логика переходов (срабатывает, ТОЛЬКО если игрок уже в боевой комнате и все враги мертвы)
if (room != rm_tower_lobby && room != rm_boss_floor_10 && room != rm_boss_floor_25) {
    
    // Если на уровне не осталось ни одного обычного врага
    if (instance_number(obj_enemy) == 0) {
        
        // ПРОВЕРКА ДЛЯ КАЖДОГО 5-ГО ЭТАЖА (5, 15, 20)
        // Если этаж кратен 5 и лифт еще не прилетел
        if (global.current_floor % 5 == 0 && instance_number(obj_elevator) == 0) {
            // Спавним лифт в центре комнаты. Игра ждет, пока игрок сам зайдет в него!
            instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_elevator);
            exit; 
        }
        
        // ДЛЯ ВСЕХ ОСТАЛЬНЫХ ЭТАЖЕЙ: Автоматически шагаем дальше
        global.current_floor += 1;
        
        // Обновляем рекорд
        if (global.current_floor > global.max_floor_reached) {
            global.max_floor_reached = global.current_floor;
        }
        
        // Проверяем, куда отправить игрока
        if (global.current_floor == 10) {
            room_goto(rm_boss_floor_10); // К первому боссу
        } 
        else if (global.current_floor == 25) {
            room_goto(rm_boss_floor_25); // К финальному боссу
        } 
        else if (global.current_floor > 25) {
            show_message("Поздравляем! Башня полностью пройдена!");
            room_goto(rm_main_menu);
        } 
        else {
            room_restart(); // Обычный перезапуск для новой генерации
        }
    }
}
