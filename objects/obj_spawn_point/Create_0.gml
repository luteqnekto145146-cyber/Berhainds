// Спавнпоинт проверяет, есть ли на уровне игрок
if (instance_exists(obj_beg_terrei)) {
    // Насильно притягиваем игрока в свои координаты
    obj_beg_terrei.x = x;
    obj_beg_terrei.y = y;
}