
// 1. Насильно привязываем игрока к слою "Instances" в новой комнате
if (layer_exists("Instances")) {
    layer_add_instance("Instances", id);
}

// 2. И только после этого перемещаем его на белую стрелочку
if (instance_exists(obj_spawn_point)) {
    var current_spawn = instance_find(obj_spawn_point, 0);
    x = current_spawn.x;
    y = current_spawn.y;
}


// Этот код сработает ТОЛЬКО во второй комнате (r_doroga)!
// Если имя твоей второй комнаты другое (например, r_hram), замени r_doroga на него.
if (room == r_doroga) {
    
    view_enabled = true;
    view_set_visible(0, true);

    // 1. Устанавливаем размер камеры для этой комнаты
    camera_set_view_size(view_camera, 640, 360);

    // 2. Сжимаем порт, чтобы вернуть персонажу нормальный рост
    view_set_wport(0, 640);
    view_set_hport(0, 360);

    // 3. Камера центрируется на герое
    camera_set_view_target(view_camera, id);
    camera_set_view_border(view_camera, 320, 180); 
    
    // 4. Сжимаем холст пикселей строго для этого уровня
    surface_resize(application_surface, 640, 360);
}