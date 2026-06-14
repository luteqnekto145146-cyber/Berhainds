// 1. Проверяем расстояние до игрока (ближе 64 пикселей)
if (instance_exists(obj_beg_terrei) && distance_to_object(obj_beg_terrei) < 64) {
    
    // 2. Проверяем однократное нажатие клавиши "E"
    if (keyboard_check_pressed(ord("`"))) {
        
        // 3. Открываем магазин, если он еще не открыт
        if (!instance_exists(obj_shop_menu)) {
            instance_create_depth(0, 0, -10000, obj_shop_menu);
        }
    }
}