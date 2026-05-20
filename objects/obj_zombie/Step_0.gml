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
            // 1. ЛОГИКА БЛУЖДАНИЯ С УМНЫМИ ПАУЗАМИ
            wander_timer++;
            
            // Каждые 2 секунды (120 кадров) принимаем новое решение
            if (wander_timer >= 120) {
                
                // Проверяем расстояние от зомби до его дома
                var dist_to_home = point_distance(x, y, home_x, home_y);
                
                if (dist_to_home > 100) {
                    // Если ушел слишком далеко, принудительно возвращаем домой
                    direction = point_direction(x, y, home_x, home_y);
                    speed = move_speed;
                } else {
                    // Если он внутри зоны, выбираем: идти или стоять (шанс 50 на 50)
                    var decide_to_walk = choose(true, false);
                    
                    if (decide_to_walk) {
                        // Зомби идет в случайном направлении
                        direction = random(360); 
                        speed = move_speed;
                    } else {
                        // Зомби останавливается на месте
                        speed = 0;
                    }
                }
                wander_timer = 0;
            }
            
            // Если зомби идет — запоминаем и обновляем угол движения для анимации ходьбы
            if (speed > 0) {
                move_dir = direction;
            } else {
                // ЕСЛИ ЗОМБИ СТОИТ: включаем правильный спрайт покоя на основе последнего направления движения
                move_dir = (move_dir + 360) % 360;
                
                if (move_dir >= 45 && move_dir < 135) {
                    sprite_index = spr_ne_dvigayetsa_zombie_ot_nas; // Стоит спиной
                } 
                else if (move_dir >= 135 && move_dir < 225) {
                    sprite_index = spr_ne_dvigayetsa_zombie_v_levo; // Твой спрайт: стоит влево
                } 
                else if (move_dir >= 225 && move_dir < 315) {
                    sprite_index = spr_ne_dvigayetsa_zombie_na_nas; // Стоит лицом к нам
                } 
                else {
                    sprite_index = spr_ne_dvigayetsa_zombie_v_pravo; // Стоит вправо
                }
            }
            
            // Если заметил игрока obj_beg_terrei — мгновенно прерывает отдых и бежит за ним
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
            // 3. ЛОГИКА АТАКИ ВО ВСЕ 4 СТОРОНЫ
            speed = 0; // Останавливаемся, чтобы ударить
            
            // Вычисляем точный угол направления на игрока
            var attack_dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
            attack_dir = (attack_dir + 360) % 360; // Корректируем угол от 0 до 360
            
            // Включаем нужный спрайт атаки в зависимости от угла
            if (attack_dir >= 45 && attack_dir < 135) {
                sprite_index = Spr_zombie_ataka_ot_nas;    // Атака НАЗАД (вверх)
            } 
            else if (attack_dir >= 135 && attack_dir < 225) {
                sprite_index = Spr_zombie_ataka_v_levo;    // Атака ВЛЕВО
            } 
            else if (attack_dir >= 225 && attack_dir < 315) {
                sprite_index = Spr_zombie_ataka_na_nas;    // Атака НА НАС (вниз)
            } 
            else {
                sprite_index = Spr_zombie_ataka_v_pravo;   // Атака ВПРАВО
            }
            
            image_xscale = 1; // Убираем отзеркаливание
            
            // Логика нанесения урона по таймеру (раз в секунду)
            if (attack_cooldown <= 0) {
                obj_beg_terrei.player_hp -= 15; // Наносим 15 единиц урона
                attack_cooldown = 60;          // Перезарядка 1 секунда
            } else {
                attack_cooldown--; // Уменьшаем таймер перезарядки
            }
            
            // Если игрок отбежал — продолжаем погоню
            if (dist > attack_radius) {
                state = Z_STATE.CHASE;
                attack_cooldown = 0;
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
