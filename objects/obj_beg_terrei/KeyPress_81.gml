 // Если открыто меню магазина, бросать нельзя
if (instance_exists(obj_shop_menu)) exit;

// Проверяем, есть ли сюрикены и не замахнулся ли игрок уже
if (shurikens > 0 && sprite_index != spr_terrei_brosok_suriken) {
    shurikens -= 1; // Сразу тратим один сюрикен из запаса
    
    // Включаем анимацию замаха
    sprite_index = spr_terrei_brosok_suriken;
    image_index = 0; // Начинаем строго с самого первого кадра (кадр 0)
    image_speed = 1; // Скорость анимации
    
    // Переменная-флаг, чтобы сюрикен вылетел ровно ОДИН раз, а не создавался каждый кадр
    shuriken_thrown = false; 
}
