  // 1. ЕСЛИ ЗОМБИ УЖЕ УМИРАЕТ — ОСТАНАВЛИВАЕМСЯ И ЖДЕМ КОНЦА АНИМАЦИИ
if (state == Z_STATE.DIE) {
    speed = 0;                          
    sprite_index = spr_zombie_die;      
    
    if (image_index >= image_number - 1) {
        image_speed = 0;                
        image_index = image_number - 1; 
        
        // Система выпадения лута
        instance_create_layer(x, y, "Instances", obj_exp);
        var chance = random(100);
        
        if (chance <= 10) {
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
        }
        else if (chance > 10 && chance <= 50) {
            instance_create_layer(x, y, "Instances", obj_coin);
        }
        
        instance_destroy(); 
    }
    exit; 
}

// 2. ЕСЛИ ЗДОРОВЬЕ КОНЧИЛОСЬ — ПЕРЕХОДИМ В СОСТОЯНИЕ СМЕРТИ
if (hp <= 0) {
    state = Z_STATE.DIE;
    image_index = 0; 
    image_speed = 1; 
    exit;
}

// 3. ---- БЛОК РАСТАЛКИВАНИЯ ЗОМБИ (ОБХОД ДРУГ ДРУГА) ----
// Ищем, не наложился ли на этого зомби другой зомби
var neighbor = instance_place(x, y, obj_zombie); 

if (neighbor != noone) {
    // Вычисляем угол в противоположную сторону от соседа и плавно сдвигаем
    var push_dir = point_direction(neighbor.x, neighbor.y, x, y);
    x += lengthdir_x(1.5, push_dir);
    y += lengthdir_y(1.5, push_dir);
}


// 4. ГЛАВНАЯ ЛОГИКА ПОВЕДЕНИЯ И ДВИЖЕНИЯ
if (instance_exists(obj_beg_terrei)) {
    
    // Считаем точное расстояние до твоего игрока obj_beg_terrei
    var dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    var move_dir = direction; 
    
    switch (state) {
        
        case Z_STATE.WANDER:
            // ЛОГИКА БЛУЖДАНИЯ С УМНЫМИ ПАУЗАМИ (Вариант 2, шанс 15%)
            wander_timer++;
            if (wander_timer >= 120) {
                var dist_to_home = point_distance(x, y, home_x, home_y);
                
                if (dist_to_home > 100) {
                    direction = point_direction(x, y, home_x, home_y);
                    speed = move_speed;
                } else {
                    var wander_chance = random(100);
                    var decide_to_walk = (wander_chance > 15); // 85% идет, 15% стоит
                    
                    if (decide_to_walk) {
                        direction = random(360); 
                        speed = move_speed;
                    } else {
                        speed = 0;
                    }
                }
                wander_timer = 0;
            }
            
            if (speed > 0) move_dir = direction;
            
            if (dist < detection_radius) {
                state = Z_STATE.CHASE;
            }
            break;
            
             case Z_STATE.CHASE:
            // ЛОГИКА ПОГОНИ (Исправленная под маску ботинок)
            
            // Заставляем зомби бежать не в центр игрока, а чуть ниже — к его ногам (ботинкам)
            // Смещение +16 или +20 пикселей вниз по оси Y (подстрой под размер своего спрайта)
            var target_x = obj_beg_terrei.x;
            var target_y = obj_beg_terrei.y; 
            
            mp_potential_step(target_x, target_y, chase_speed, true);
            move_dir = point_direction(x, y, target_x, target_y);
            
            // Считаем дистанцию атаки тоже до ног, чтобы зомби вовремя останавливался и бил
            var dist_to_feet = point_distance(x, y, target_x, target_y);
            
            if (dist > detection_radius * 1.5) {
                state = Z_STATE.RETURN;
            }
            // Слегка увеличиваем attack_radius (например, до 45-50), если зомби всё равно не достает
            else if (dist_to_feet <= attack_radius) {
                state = Z_STATE.ATTACK;
                image_index = 0;
            }
            break;

            
          case Z_STATE.ATTACK:
            // 3. ЛОГИКА АТАКИ С ДЕЛИКАТНЫМ УРОНОМ
            speed = 0; // Полностью останавливаемся для удара
            
            // Считаем угол до ног игрока для выбора спрайта
            var attack_dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y + 16);
            attack_dir = (attack_dir + 360) % 360; 
            
            // Выбираем правильный спрайт атаки (все с заглавной Spr_)
            if (attack_dir >= 45 && attack_dir < 135) sprite_index = Spr_zombie_ataka_ot_nas;    
            else if (attack_dir >= 135 && attack_dir < 225) sprite_index = Spr_zombie_ataka_v_levo;    
            else if (attack_dir >= 225 && attack_dir < 315) sprite_index = Spr_zombie_ataka_na_nas;    
            else sprite_index = Spr_zombie_ataka_v_pravo;   
            
            image_xscale = 1; 
            
            // ---- ПРОВЕРКА НАДЁЖНОГО УРОНА НА 6-М КАДРЕ (индекс 5) ----
            // Использован floor(), чтобы урон считался ровно 1 раз за анимацию
            if (floor(image_index) == 5 && attack_cooldown <= 0) {
                
                // Проверяем, что игрок ВСЁ ЕЩЕ рядом в момент самого удара, а не убежал
                var check_dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y + 16);
                if (check_dist <= attack_radius + 10) { 
                    obj_beg_terrei.player_hp -= 15; // Наносим 15 единиц урона
                    attack_cooldown = 1; // Блокируем повторный урон в этом цикле анимации
                }
            }
            
            // Сбрасываем блокировку урона, когда анимация начинается заново
            if (image_index < 1) {
                attack_cooldown = 0;
            }
            
            // Если игрок успел отбежать дальше радиуса атаки — возвращаемся в погоню
            var current_dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y + 16);
            if (current_dist > attack_radius + 10) {
                state = Z_STATE.CHASE;
                attack_cooldown = 0;
            }
            break;

            
        case Z_STATE.RETURN:
            // ЛОГИКА ВОЗВРАЩЕНИЯ ДОМОЙ
            mp_potential_step(home_x, home_y, move_speed, true);
            move_dir = point_direction(x, y, home_x, home_y);
            
            var dist_to_home = point_distance(x, y, home_x, home_y);
            if (dist_to_home <= 10) {
                state = Z_STATE.WANDER;
                wander_timer = 120; 
            }
            
            if (dist < detection_radius) {
                state = Z_STATE.CHASE;
            }
            break;
    }
    
    // 5. ---- БЛОК СМЕНЫ АНИМАЦИЙ ДВИЖЕНИЯ / ПОКОЯ ----
    if (state != Z_STATE.ATTACK) {
        move_dir = (move_dir + 360) % 360;
        
        if (speed > 0) {
            // Если идет — включаем анимацию ходьбы
            if (move_dir >= 45 && move_dir < 135) sprite_index = spr_idet_ot_nas_zombie;
            else if (move_dir >= 135 && move_dir < 225) sprite_index = spr_idet_v_levo_zombie;
            else if (move_dir >= 225 && move_dir < 315) sprite_index = spr_idet_na_nas_zombie;
            else sprite_index = spr_idet_v_pravo_zombie;
        } else {
            // Если стоит — включаем анимацию покоя
            if (move_dir >= 45 && move_dir < 135) sprite_index = spr_ne_dvigayetsa_zombie_ot_nas;
            else if (move_dir >= 135 && move_dir < 225) sprite_index = spr_ne_dvigayetsa_zombie_v_levo;
            else if (move_dir >= 225 && move_dir < 315) sprite_index = spr_ne_dvigayetsa_zombie_na_nas;
            else sprite_index = spr_ne_dvigayetsa_zombie_v_pravo;
        }
        image_xscale = 1; 
    }
    
} else {
    speed = 0;
    sprite_index = spr_ne_dvigayetsa_zombie_na_nas;
}
