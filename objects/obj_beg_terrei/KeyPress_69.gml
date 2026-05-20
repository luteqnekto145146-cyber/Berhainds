// 1. Ищем ближайший магазин на карте
var nearest_shop = instance_nearest(x, y, obj_shop);

if (nearest_shop != noone) {
    // Считаем расстояние до этого магазина
    var dist_to_shop = point_distance(x, y, nearest_shop.x, nearest_shop.y);
    
    // Если игрок стоит вплотную к магазину (ближе 60 пикселей)
    if (dist_to_shop <= 60) {
        
        // Проверяем, хватает ли у игрока монет
        if (global.coins >= nearest_shop.medkit_price) {
            
            global.coins -= nearest_shop.medkit_price; // Забираем монеты
            
            // Спавним аптечку прямо под ногами игрока
            instance_create_layer(x, y, "Instances", obj_medkit);
            
        } else {
            // Если монет не хватает, можно вывести сообщение или просто ничего не делать
            // Например, временно изменить цвет текста (по желанию)
        }
    }
}
