
// 1. ОТКРЫТИЕ И ЗАКРЫТИЕ ИНВЕНТАРЯ 
if (keyboard_check_pressed(ord("E"))) {
    show_inventory = !show_inventory;
}

// 2. ВЫБОР ОРУЖИЯ 
var active = inventory[selected_slot];
if (active != undefined && active.item.type == "weapon" && active.item.item_id == 1) {
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
            
        
            instance_create_layer(obj_beg_terrei.x, obj_beg_terrei.y, "Instances", obj_sapphire_shuriken_projectile);
            
            if (slot.count <= 0) {
                inventory[i] = undefined;
            }
            break; 
        }
    }
}
