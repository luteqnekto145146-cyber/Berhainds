
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
        
shuriken_thrown = true; 
        
        if (global.crazy_mode == false) {
            var my_shuriken = instance_create_layer(x, y, "Instances", obj_sapfir_suriken);
            var target_dir = point_direction(x, y, mouse_x, mouse_y);
            my_shuriken.direction = target_dir;
            my_shuriken.speed = 8; 
        } else {
            var my_hornet = instance_create_layer(x, y, "Instances", obj_hornet);
            var target_dir = point_direction(x, y, mouse_x, mouse_y);
            
            
            my_hornet.direction = target_dir + irandom_range(-15, 15);
            my_hornet.speed = 12;
        }
    }
}
var is_revolver_equipped = false;
if (instance_exists(obj_inventory)) {

var active_slot = obj_inventory.inventory[obj_inventory.selected_slot];

// ИСПРАВЛЕННАЯ СТРОКА 51 (Бронированная проверка):
if (active_slot != undefined && active_slot != noone && is_struct(active_slot) && struct_exists(active_slot, "item") && active_slot.item != undefined) {
    
    
    if (active_slot.item.item_id == 1) {
        current_weapon = "revolver"; 
    }
} else {
  
    current_weapon = "fists"; 
}
  
var active_slot = obj_inventory.inventory[obj_inventory.selected_slot];


if (active_slot != undefined && active_slot != noone && is_struct(active_slot)) {
    
   
    if (struct_exists(active_slot, "item") && active_slot.item != undefined) {
        
        
        if (active_slot.item.item_id == 1) {
            current_weapon = "revolver";
        } else {
            current_weapon = "fists";
        }
        
    } else {
        current_weapon = "fists";
    }
    
} else {
    
    current_weapon = "fists"; 
}


if (mouse_check_button_pressed(mb_left) && is_revolver_equipped) {
    if (revolver_ammo > 0) {
        revolver_ammo -= 1; 
        
       
        var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
        
      
        bullet.direction = point_direction(x, y, mouse_x, mouse_y);
        bullet.speed = 8; 
        
        bullet.image_angle = bullet.direction; 
    }
}

if (text_timer > 0) {
    text_timer -= 1;
    
    text_y_offset -= 1.5; 

    if (text_timer < 20) {
        text_alpha = text_timer / 20; 
    }
    

    if (text_timer <= 0) {
        shield_text = "";
    }
}
if (room == rm_tower_floor_1) {
    
    // 1. Инициализация переменных при старте этажа
    if (!variable_instance_exists(id, "tower_start_timer")) {
        tower_start_timer = 5; 
        floor_cleared = false; 
        clear_timer = 0;       
    }
    
    if (tower_start_timer > 0) {
        tower_start_timer--;
        exit; 
    }
    
    // 2. Прямой подсчет врагов (Убедитесь, что имена объектов совпадают с Asset Browser!)
    var total_enemies = instance_number(obj_sceleton_sherif) + instance_number(obj_zombie);
    
    // Вывод информации в консоль только во время боя
    if (total_enemies > 0) {
        show_debug_message("РЕАЛЬНО ЖИВЫХ ВРАГОВ = " + string(total_enemies));
    }
    
      // 3. Логика фиксации победы
   
    if (tower_start_timer <= 0) {
        
        
        if (!instance_exists(obj_tower_generator)) {
            
            
            if (total_enemies == 0 && !floor_cleared) {
                floor_cleared = true;
                clear_timer = 1200; 
                
               
                if (global.current_floor % 5 == 0 && instance_number(obj_elevator) == 0) {
                    instance_create_layer(room_width / 2, room_height / 2, "Instances", obj_elevator);
                }
            }
        }
    }

    
    if (total_enemies > 0) {
        floor_cleared = false;
        clear_timer = 0;
    }
    
    // 4. Отсчет времени передышки и выполнение перехода
    if (floor_cleared) {
        clear_timer--;
 
       
        if (global.current_floor % 5 != 0) {
            show_debug_message("До перехода на следующий этаж осталось: " + string(ceil(clear_timer / 60)) + " сек.");
		}
        
        
        if (clear_timer <= 0) {
            
            
            if (global.current_floor % 5 == 0) {
                global.current_floor += 1;
                room_restart();
                exit;
            }
            
           
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

if (keyboard_check_pressed(vk_f4)) {
    global.current_floor = 24;
    
    if (global.current_floor > global.max_floor_reached) {
        global.max_floor_reached = global.current_floor;
    }
    
    room_restart(); 
}
}