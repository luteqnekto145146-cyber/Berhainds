var _total_slots = array_length(inventory);

if (keyboard_check_pressed(ord("E"))) {
    if (inventory_slots > 0) {
        show_inventory = !show_inventory;
    } else {
        show_inventory = false;
    }
}

if (selected_slot < hotbar_slots) {
    var active = inventory[selected_slot];
    if (active != undefined && active != noone && active.item.type == "weapon" && active.item.item_id == 1) {
        current_weapon = "revolver";
    } else {
        current_weapon = "fists";
    }
}

if (mouse_wheel_up()) { 
    selected_slot -= 1; 
    if (selected_slot < 0) selected_slot = hotbar_slots - 1; 
}
if (mouse_wheel_down()) { 
    selected_slot += 1; 
    if (selected_slot >= hotbar_slots) selected_slot = 0; 
}

if (show_inventory) {
    if (mouse_check_button_pressed(mb_left) && hovered_slot != -1) {
        var _slot_content = inventory[hovered_slot];
        if (_slot_content != undefined && _slot_content != noone) {
            dragged_slot = hovered_slot;
            dragged_item_data = _slot_content; 
            inventory[hovered_slot] = undefined; 
        }
    }
    
    if (dragged_slot != -1 && keyboard_check_pressed(ord("Q"))) {
        if (instance_exists(obj_beg_terrei)) {
            var _dropped = instance_create_layer(obj_beg_terrei.x, obj_beg_terrei.y, "Instances", obj_item_parent);
            if (instance_exists(_dropped)) {
                _dropped.my_item_data = variable_clone(dragged_item_data.item);
                _dropped.amount = dragged_item_data.count;
                _dropped.sprite_index = dragged_item_data.item.sprite;
                _dropped.can_pickup = false; 
                _dropped.alarm[0] = 3 * game_get_speed(gamespeed_fps);
                
                var _keys = variable_struct_get_names(global.db_items);
                for (var k = 0; k < array_length(_keys); k++) {
                    if (global.db_items[$ _keys[k]].item_id == dragged_item_data.item.item_id) {
                        _dropped.item_key = _keys[k];
                        break;
                    }
                }
            }
            dragged_slot = -1;
            dragged_item_data = undefined;
        }
    }
    
    if (mouse_check_button_released(mb_left)) {
        if (dragged_slot != -1) {
            if (hovered_slot != -1) {
                var _target_content = inventory[hovered_slot];
                if (_target_content == undefined || _target_content == noone) {
                    inventory[hovered_slot] = dragged_item_data;
                } else {
                    inventory[dragged_slot] = _target_content; 
                    inventory[hovered_slot] = dragged_item_data; 
                }
            } else {
                inventory[dragged_slot] = dragged_item_data;
            }
            dragged_slot = -1;
            dragged_item_data = undefined;
        }
    }
}

if (keyboard_check_pressed(ord("R")) && current_weapon == "revolver" && instance_exists(obj_beg_terrei)) {
    var current_bullets_in_gun = obj_beg_terrei.revolver_ammo; 
    if (current_bullets_in_gun < 6) {
        for (var i = 0; i < _total_slots; i++) {
            var slot = inventory[i];
            if (slot != undefined && slot != noone && slot.item.type == "ammo") {
                var needed = 6 - current_bullets_in_gun;
                var to_load = min(needed, slot.count);
                obj_beg_terrei.revolver_ammo += to_load; 
                slot.count -= to_load;
                if (slot.count <= 0) inventory[i] = undefined;
                break; 
            }
        }
    }
}

if (keyboard_check_pressed(ord("Q")) && !show_inventory && instance_exists(obj_beg_terrei)) {
    for (var i = 0; i < _total_slots; i++) {
        var slot = inventory[i];
        if (slot != undefined && slot != noone && slot.item.item_id == 7) {
            slot.count -= 1; 
            obj_beg_terrei.shurikens += 1; 
            var _shur = instance_create_layer(obj_beg_terrei.x, obj_beg_terrei.y, "Instances", obj_sapfir_suriken);
            if (instance_exists(_shur)) {
                _shur.direction = point_direction(obj_beg_terrei.x, obj_beg_terrei.y, mouse_x, mouse_y);
                _shur.image_angle = _shur.direction; 
                _shur.speed = 6; 
            }
            if (slot.count <= 0) inventory[i] = undefined;
            break;
        }
    }
}

if (keyboard_check_pressed(ord("H")) && !show_inventory && instance_exists(obj_beg_terrei)) {
    for (var i = 0; i < _total_slots; i++) {
        var slot = inventory[i];
        if (slot != undefined && slot != noone && slot.item.item_id == 3) {
            slot.count -= 1;
            instance_create_layer(obj_beg_terrei.x, obj_beg_terrei.y, "Instances", obj_medkit);
            if (slot.count <= 0) inventory[i] = undefined;
            break;
        }
    }
}
