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
