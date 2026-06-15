
// 1. ОТКРЫТИЕ И ЗАКРЫТИЕ ИНВЕНТАРЯ 
if (keyboard_check_pressed(ord("E"))) {
    show_inventory = !show_inventory;
}

// 2. ВЫБОР ОРУЖИЯ 
var active = inventory[selected_slot];
if (active != undefined && active != noone && active.item.type == "weapon" &&  active.item.item_id == 1) {
    current_weapon = "revolver";
} else {
    current_weapon = "fists";
}

// 3. ПРОКРУТКА ХОТ-БАРА КОЛЕСИКОМ МЫШИ
if (mouse_wheel_up()) { selected_slot -= 1; if (selected_slot < 0) selected_slot = hotbar_slots - 1; }
if (mouse_wheel_down()) { selected_slot += 1; if (selected_slot >= hotbar_slots) selected_slot = 0; }

// 4. ВЫБОР ЯЧЕЕК КЛИКОМ МЫШКИ 
if (show_inventory && hovered_slot != -1) {
    if (mouse_check_button_pressed(mb_left)) {
        selected_slot = hovered_slot;
    }
}

// 5. ПЕРЕЗАРЯДКА РЕВОЛЬВЕРА 
if (keyboard_check_pressed(ord("R")) && current_weapon == "revolver" && instance_exists(obj_beg_terrei)) {
    
    
    var current_bullets_in_gun = obj_beg_terrei.revolver_ammo; 
    
    if (current_bullets_in_gun < 6) {
        for (var i = 0; i < inventory_slots; i++) {
            if (inventory[i] != undefined && inventory[i].item.type == "ammo") {
                var needed = 6 - current_bullets_in_gun;
                var to_load = min(needed, inventory[i].count);
                
              
                obj_beg_terrei.revolver_ammo += to_load; 
                
                inventory[i].count -= to_load;
                if (inventory[i].count <= 0) inventory[i] = undefined;
                break; 
            }
        }
    }
}

// 6. БЫСТРОЕ МЕТАНИЕ СЮРИКЕНА 
if (keyboard_check_pressed(ord("Q")) && !show_inventory && instance_exists(obj_beg_terrei)) {
    
    for (var i = 0; i < inventory_slots; i++) {
        var slot = inventory[i];
        
        
        if (slot != undefined && slot.item.item_id == 7) {
            
            slot.count -= 1; 
            
           
            obj_beg_terrei.shurikens += 1; 
            
        
        var _shur = instance_create_layer(obj_beg_terrei.x, obj_beg_terrei.y, "Instances", obj_sapfir_suriken);
        
        // Сразу заставляем созданный сюрикен лететь в сторону мышки
        if (instance_exists(_shur)) {
            _shur.direction = point_direction(obj_beg_terrei.x, obj_beg_terrei.y, mouse_x, mouse_y);
            _shur.image_angle = _shur.direction; // Чтобы спрайт сюрикена тоже повернулся по направлению полета
            _shur.speed = 6; // Скорость полета (поставьте свою, если 10 — это мало или много)
        }
        
        // Проверяем, закончились ли сюрикены в слоте
        if (slot.count <= 0) {
            inventory[i] = undefined;
        }
        
        // Останавливаем цикл, чтобы не вылетало по 2 штуки
        break;
		}
	}
}
// 7. ИСПОЛЬЗОВАНИЕ АПТЕЧКИ 
if (keyboard_check_pressed(ord("H")) && !show_inventory && instance_exists(obj_beg_terrei)) {
    
    // Пробегаем по инвентарю в поиске аптечки
    for (var i = 0; i < inventory_slots; i++) {
        var slot = inventory[i];
        
        // Ищем предмет с ID 3 (это ваше Зелье ОЗ / аптечка)
        if (slot != undefined && slot.item.item_id == 3) {
            
            // 1. Уменьшаем количество аптечек в инвентаре на 1
            slot.count -= 1;
            
            // 2. Создаем объект аптечки прямо под ногами игрока
            // Замените obj_medkit на точное имя объекта аптечки, который лежит на земле
            instance_create_layer(obj_beg_terrei.x, obj_beg_terrei.y, "Instances", obj_medkit);
            
            // 3. Если аптечки в слоте закончились, очищаем его
            if (slot.count <= 0) {
                inventory[i] = undefined;
            }
            
            // Прерываем цикл, чтобы выбросить только одну аптечку за раз
            break;
        }
    }
}