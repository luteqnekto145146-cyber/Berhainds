
if (mouse_wheel_up()) {
    if (has_revolver) { 
        weapon_select = 1;
        current_weapon = "revolver";
    }
}

if (mouse_wheel_down()) {
    weapon_select = 0;
    current_weapon = "none";
}
hdir = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) 
vdir = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) 

beg_cod();

move_and_collide(hdir * move_speed, vdir * move_speed, obj_wall, 4, 0,0, move_speed, move_speed)
// Если здоровье закончилось — перемещаем игрока в комнату главного меню
if (player_hp <= 0) {
	instance_destroy()
    room_goto(r_menu_i);
	exit
}
// Проверяем, идет ли сейчас анимация броска
if (sprite_index == spr_terrei_brosok_suriken) {
    
    // Если анимация дошла до 6-го кадра (в коде это 5) и мы еще НЕ выпустили снаряд
    if (floor(image_index) == 5 && shuriken_thrown == false) {
        
shuriken_thrown = true; // Отмечаем, что сюрикен выпущен
        
        if (global.crazy_mode == false) {
            var my_shuriken = instance_create_layer(x, y, "Instances", obj_sapfir_suriken);
            var target_dir = point_direction(x, y, mouse_x, mouse_y);
            my_shuriken.direction = target_dir;
            my_shuriken.speed = 8; // Скорость полета
        } else {
            var my_hornet = instance_create_layer(x, y, "Instances", obj_hornet);
            var target_dir = point_direction(x, y, mouse_x, mouse_y);
            
            // Шершень летит в сторону мышки, но с веерным разбросом!
            my_hornet.direction = target_dir + irandom_range(-15, 15);
            my_hornet.speed = 12; // Сделаем шершня чуть быстрее сюрикена!
        }
    }
}
// Проверяем нажатие ЛКМ и что в руках именно револьвер (смотрим в инвентарь)
var is_revolver_equipped = false;
if (instance_exists(obj_inventory)) {
    var active_slot = obj_inventory.inventory[obj_inventory.selected_slot];
    if (active_slot != undefined && active_slot != noone and active_slot.item.item_id == 1) {
        is_revolver_equipped = true; // Револьвер действительно выбран в хот-баре
    }
}

if (mouse_check_button_pressed(mb_left) && is_revolver_equipped) {
    if (revolver_ammo > 0) {
        revolver_ammo -= 1; // Тратим 1 патрон
        
        // Создаем пулю на координатах игрока
        var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
        
        // Направляем пулю в сторону мышки
        bullet.direction = point_direction(x, y, mouse_x, mouse_y);
        bullet.speed = 8; // Задаем пуле скорость
        
        // ПОВОРАЧИВАЕМ СПРАЙТ ПУЛИ ПО НАПРАВЛЕНИЮ ПОЛЕТА
        bullet.image_angle = bullet.direction; 
    }
}
// Управление анимацией всплывающего текста
if (text_timer > 0) {
    text_timer -= 1;
    
    // Текст плавно летит вверх (каждый кадр поднимается на 1.5 пикселя)
    text_y_offset -= 1.5; 
    
    // В последние 20 кадров текст начинает плавно растворяться
    if (text_timer < 20) {
        text_alpha = text_timer / 20; 
    }
    
    // Когда время вышло, полностью сбрасываем параметры
    if (text_timer <= 0) {
        shield_text = "";
    }
}
if (room == rm_tower_floor_1) {
    
    // Фора для генератора рельефа на старте
    if (!variable_instance_exists(id, "tower_start_timer")) {
        tower_start_timer = 5; 
        floor_cleared = false; // Переменная, чтобы таймер перехода не срабатывал дважды
        clear_timer = 0;       // Наш новый таймер на 20 секунд
    }
    
    if (tower_start_timer > 0) {
        tower_start_timer--;
        exit; 
    }
    
    // Считаем живых врагов
    var total_enemies = instance_number(obj_sceleton_sherif) + instance_number(obj_zombie);
    
    // Выводим инфо, только если враги уже заспавнились
    if (instance_exists(obj_sceleton_sherif) || instance_exists(obj_zombie) || floor_cleared) {
        show_debug_message("РЕАЛЬНО ЖИВЫХ ВРАГОВ = " + string(total_enemies));
    }
    
    // ЕСЛИ ВСЕ ВРАГИ УБИТЫ
    if (total_enemies == 0 && !floor_cleared && (instance_exists(obj_sceleton_sherif) == false && instance_exists(obj_zombie) == false)) {
        floor_cleared = true;
        clear_timer = 600; // Запускаем задержку в 20 секунд (1200 кадров)
        
        // ЕСЛИ ЭТО 5-Й ЭТАЖ: Лифт падает СРАЗУ, чтобы вы успели его увидеть и воспользоваться!
        if (global.current_floor % 5 == 0 && instance_number(obj_elevator) == 0) {
            instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_elevator);
        }
    }
    
    // ОТСЧЕТ 20 СЕКУНД ПОСЛЕ ПОБЕДЫ
    if (floor_cleared) {
        clear_timer--;
        
        // Если это обычный этаж (без лифта), пишем сколько секунд осталось до телепорта
        if (global.current_floor % 5 != 0) {
            show_debug_message("До перехода на следующий этаж осталось: " + string(ceil(clear_timer / 60)) + " сек.");
        }
        
        // Когда 20 секунд истекли
        if (clear_timer <= 0) {
            
            // Если на 5-м этаже игрок ТАК И НЕ ЗАШЕЛ в лифт за 20 секунд — везем его принудительно
            if (global.current_floor % 5 == 0) {
                global.current_floor += 1;
                room_restart();
                exit;
            }
            
            // Сброс настроек для следующего этажа
            tower_start_timer = 5; 
            floor_cleared = false;
            
            if (instance_exists(obj_tower_controller)) {
                with(obj_tower_controller) {
                    global.current_floor += 1;
                    if (global.current_floor > global.max_floor_reached) global.max_floor_reached = global.current_floor;
                    
                    if (global.current_floor == 10) room_goto(rm_boss_flour_10);
                    else if (global.current_floor == 25) room_goto(rm_boss_flour_25);
                    else room_restart(); 
                }
            } else {
                global.current_floor += 1;
                room_restart(); 
            }
        }
    }
}
// ЧИТ-КОД: Нажмите клавишу F4, чтобы сразу прыгнуть на 20 этаж для теста
if (keyboard_check_pressed(vk_f4)) {
    global.current_floor = 20;
    
    // Принудительно обновляем рекорд, чтобы лифт в меню разблокировал этот этаж
    if (global.current_floor > global.max_floor_reached) {
        global.max_floor_reached = global.current_floor;
    }
    
    room_restart(); // Перезапускаем комнату, чтобы сработал лифт 20-го этажа
}
