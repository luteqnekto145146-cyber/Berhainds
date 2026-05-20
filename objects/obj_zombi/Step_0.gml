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
