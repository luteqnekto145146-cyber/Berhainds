// 1. Проверяем расстояние до игрока (например, в пределах 48 пикселей)
if (instance_exists(obj_beg_terrei) && distance_to_object(obj_beg_terrei) < 48) {
    
    // 2. Проверяем ОДНОКРАТНОЕ нажатие клавиши "E"
    if (keyboard_check_pressed(ord("E"))) {
        
        // 3. Проверяем, не открыт ли уже магазин, чтобы не спавнить копии
        if (!instance_exists(obj_shop)) {
            // Создаем объект меню на переднем плане (глубина -10000)
            instance_create_depth(0, 0, -10000, obj_shop);
        }
    }
}