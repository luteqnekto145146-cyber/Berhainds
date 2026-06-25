 // 1. Дистанция удара кулаком (в пикселях)
var attack_distance = 50; 

// 2. Ищем БЛИЖАЙШЕГО зомби на всей карте
var nearest_zombie = instance_nearest(x, y, obj_vrag);

// 3. Проверяем, нашли ли мы зомби вообще
if (nearest_zombie != noone) {
    
    // Считаем расстояние от игрока до этого ближайшего зомби
    var dist_to_zombie = point_distance(x, y, nearest_zombie.x, nearest_zombie.y);
    
    // Если зомби находится в радиусе удара кулаком
    if (dist_to_zombie <= attack_distance) {
        
        // Отнимаем у этого конкретного зомби 10 единиц здоровья
        nearest_zombie.hp -= 10;
        
        // Сюда можно добавить эффект удара, например, отталкивание:
        // nearest_zombie.x += lengthdir_x(10, point_direction(x, y, nearest_zombie.x, nearest_zombie.y));
        // nearest_zombie.y += lengthdir_y(10, point_direction(x, y, nearest_zombie.x, nearest_zombie.y));
    }
}
// 1. Запоминаем точную ссылку на нашего игрока
var _player = id;

// 2. Защита: создаем переменную текста на игроке, если её вдруг нет
if (!variable_instance_exists(_player, "popup_text")) {
    _player.popup_text = "";
}

// 3. Проверяем, подобран ли предмет

    
// Если игрок подобрал хоть какой-то щит
if (my_shield_object != noone) 
{
    if (has_shield == false) 
    {
        has_shield = true;
        
        // Сбрасываем анимацию текста
        text_y_offset = 0;
        text_alpha = 1.0;
        text_timer = 45;
        
        // Проверяем объект кулака и подбираем название
        if (my_shield_object == obj_derev_kylak) {
            shield_text = "ДЕРЕВЯННЫЙ ЩИТ";
            text_color = c_orange; 
        }
        else if (my_shield_object == obj_iron_kylak) {
            shield_text = "ЖЕЛЕЗНЫЙ ЩИТ";
            text_color = c_gray; 
        }
        else if (my_shield_object == obj_sapfir_kylak) {
            shield_text = "САПФИРОВЫЙ ЩИТ";
            text_color = c_aqua; 
        }
    }
}