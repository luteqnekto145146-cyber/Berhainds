// 1. Инициализируем переменную здоровья, чтобы игра НЕ вылетала
hp_percent = 0; 

// 2. РЕЖИМ БЕЗУМИЯ: Если съели гриб и зомби жив — нагло подменяем его спрайт на sproite
if (global.crazy_mode == true && state != Z_STATE.DIE) {
    draw_sprite_ext(sproite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
} else {
    // В обычном режиме или при смерти рисуем стандартного зомби
    draw_self(); 
}

// 3. ОРИГИНАЛЬНЫЙ КОД ПРОГРАММИСТА: Рисуем полоску здоровья, только если зомби ранен
if (hp < hp_max) {
    hp_percent = (hp / hp_max) * 100;
    
    // Задаем координаты для шкалы над головой зомби
    var x1 = x - 20;
    var y1 = y - 40;
    var x2 = x + 20;
    var y2 = y - 34; // Толщина полоски будет 6 пикселей
    
    // Встроенная функция GameMaker для рисования шкалы здоровья
    draw_healthbar(x1, y1, x2, y2, hp_percent, c_black, c_red, c_green, 0, true, true);
}