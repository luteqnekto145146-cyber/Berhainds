// Проверяем, что анимация перехода еще не запущена
if (!instance_exists(obj_fade_controller)) {
    
    // Проверяем, есть ли вообще следующая комната в списке проекта
    if (room_next(room) != -1) {
        
        // Создаем наш контроллер затемнения экрана
        var changer = instance_create_layer(0, 0, "Instances", obj_fade_controller);
        
        // Автоматически передаем ему СЛЕДУЮЩУЮ по порядку комнату!
        changer.target_room = room_next(room); 
    }
}