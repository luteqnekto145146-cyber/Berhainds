// Проверяем, есть ли рядом объект магазина
var nearest_shop = instance_nearest(x, y, obj_shop);

if (nearest_shop != noone) {
    var dist = point_distance(x, y, nearest_shop.x, nearest_shop.y);
    
    // Если стоим близко к магазину и меню ЕЩЕ НЕ открыто
    if (dist <= 60 && !instance_exists(obj_shop_menu)) {
        // Создаем интерфейс меню
        instance_create_layer(0, 0, "Instances", obj_shop_menu);
    }
}
