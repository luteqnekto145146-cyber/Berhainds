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
if (has_parry_item == true) {
    
    var _radius = 120; 
    var _near_bullet = instance_nearest(x, y, obj_pyli_sceleton_sherif); 
    
    if (_near_bullet != noone) {
        
        var _dist = point_distance(x, y, _near_bullet.x, _near_bullet.y);
        
        if (_dist <= _radius) {
            
            var _dice = random(100); 
            
            // ИСХОД А: Отбивание (2%)
            if (_dice <= 2) {
                _near_bullet.direction += 180; 
                _near_bullet.speed *= 1.5;     
                _near_bullet.image_blend = c_green; 
                
                // Вставь сюда СВОЁ слово для отбивания вместо "ОТБИТО!"
                popup_text = "prect!"
            } 
            // ИСХОД Б: Блокировка (60%)
            else if (_dice <= (2 + 60)) {
                instance_destroy(_near_bullet);
                
                // Вставь сюда СВОЁ слово для блока вместо "БЛОК!"
                popup_text = "Block!"
            }
            // ИСХОД В: Осечка предмета (остальные проценты)
            else {
                // Вставь сюда СВОЁ слово для промаха вместо "ОСЕЧКА!"
                popup_text =  "wanted!"
            }
        }
    }
}