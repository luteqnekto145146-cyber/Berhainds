// ЕСЛИ ЗОМБИ УЖЕ УМИРАЕТ
if (state == Z_STATE.DIE) {
    speed = 0;                          // Полностью останавливаем движение
    sprite_index = spr_zombie_die;      // Включаем анимацию смерти
    
    // Проверяем, дошла ли анимация до самого последнего кадра
    if (image_index >= image_number - 1) {
        image_speed = 0;                // Останавливаем анимацию
        image_index = image_number - 1; // Фиксируем последний кадр
        
        // ---- СИСТЕМА ВЫПАДЕНИЯ ЛУТА (СПАВН ПРЕДМЕТОВ) ----
        
        // 1. Опыт падает со 100% вероятностью
        instance_create_layer(x, y, "Instances", obj_exp);
        
        // Генерируем случайное число от 0 до 100 для шансов монет
        var chance = random(100);
        
        // 2. Проверяем 10% шанс на 3 монеты (от 0 до 10)
        if (chance <= 10) {
            // Создаем 3 монеты с небольшим случайным смещением, чтобы они не слиплись
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
        }
        // 3. Проверяем 40% шанс на 1 монету (от 10 до 50 — как раз диапазон в 40 единиц)
        else if (chance > 10 && chance <= 50) {
            instance_create_layer(x, y, "Instances", obj_coin);
        }
        
        // Уничтожаем объект зомби ПОСЛЕ того, как создали предметы
        instance_destroy(); 
    }
    exit; 
}
// ЕСЛИ ЗОМБИ ЕЩЕ ЖИВ, НО ЗДОРОВЬЕ КОНЧИЛОСЬ — ПЕРЕХОДЕМ В СОСТОЯНИЕ СМЕРТИ
if (hp <= 0) {
    state = Z_STATE.DIE;
    image_index = 0; // Сбрасываем анимацию смерти на 1-й кадр, чтобы она началась сначала
    image_speed = 1; // Убеждаемся, что скорость анимации нормальная
    exit;
}
// Проверяем, существует ли на уровне твой объект игрока
if (instance_exists(obj_beg_terrei)) {
    
    // Считаем точное расстояние до игрока obj_beg_terrei
    var dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    
    // Переменная для записи угла движения
    var move_dir = direction; 
    
    switch (state) {
        
        case Z_STATE.WANDER:
            // 1. ЛОГИКА БЛУЖДАНИЯ
            speed = move_speed;
            
            wander_timer++;
            if (wander_timer >= 120) {
                // Проверяем расстояние от зомби до его дома
                var dist_to_home = point_distance(x, y, home_x, home_y);
                
                if (dist_to_home > 100) {
                    direction = point_direction(x, y, home_x, home_y); // Идем к дому
                } else {
                    direction = random(360); // Гуляем случайно
                }
                wander_timer = 0;
            }
            
            move_dir = direction;
            
            // Если заметил игрока — преследуем
            if (dist < detection_radius) {
                state = Z_STATE.CHASE;
            }
            break;
            
        case Z_STATE.CHASE:
            // 2. ЛОГИКА ПОГОНИ
            mp_potential_step(obj_beg_terrei.x, obj_beg_terrei.y, chase_speed, false);
            move_dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
            
            // Если игрок убежал далеко — зомби решает вернуться домой!
            if (dist > detection_radius * 1.5) {
                state = Z_STATE.RETURN; 
            }
            else if (dist <= attack_radius) {
                state = Z_STATE.ATTACK;
                image_index = 0;
            }
            break;
            
        case Z_STATE.ATTACK:
            // 3. ЛОГИКА АТАКИ
            speed = 0;
            sprite_index = spr_idet_na_nas_zombie; 
            
            if (dist > attack_radius) {
                state = Z_STATE.CHASE;
            }
            break;
            
        case Z_STATE.RETURN:
            // 4. ЛОГИКА ВОЗВРАЩЕНИЯ ДОМОЙ
            // Спокойно идем к точке спавна (со скоростью move_speed)
            mp_potential_step(home_x, home_y, move_speed, false);
            move_dir = point_direction(x, y, home_x, home_y);
            
            // Считаем, сколько пикселей осталось до точного центра зоны
            var dist_to_home = point_distance(x, y, home_x, home_y);
            
            // Как только зомби дошел до дома (осталось меньше 10 пикселей) — он снова блуждает
            if (dist_to_home <= 10) {
                state = Z_STATE.WANDER;
                wander_timer = 120; // Сразу заставим его выбрать случайное направление
            }
            
            // Важно: даже по пути домой зомби оглядывается! Если игрок снова подойдет близко — он нападет
            if (dist < detection_radius) {
                state = Z_STATE.CHASE;
            }
            break;
    }
    
    // ---- БЛОК СМЕНЫ ТВОИХ СПРАЙТОВ НАПРАВЛЕНИЯ ----
    if (state != Z_STATE.ATTACK) {
        
        move_dir = (move_dir + 360) % 360;
        
        if (move_dir >= 45 && move_dir < 135) {
            sprite_index = spr_idet_ot_nas_zombie;    // Назад
        } 
        else if (move_dir >= 135 && move_dir < 225) {
            sprite_index = spr_idet_v_levo_zombie;    // Влево
        } 
        else if (move_dir >= 225 && move_dir < 315) {
            sprite_index = spr_idet_na_nas_zombie;    // На нас
        } 
        else {
            sprite_index = spr_idet_v_pravo_zombie;   // Вправо
        }
        
        image_xscale = 1;
    }
    
} else {
    speed = 0;
    sprite_index = spr_idet_na_nas_zombie;
}
