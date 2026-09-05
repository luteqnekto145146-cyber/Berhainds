if (delivery_active && delivery_timer > 0) {
    delivery_timer -= 1 / game_get_speed(gamespeed_fps);
    if (delivery_timer <= 0) {
        delivery_timer = -1;
        delivery_active = false;
        
        var _spawner_asset = asset_get_index("Obj_loot_spawner");
        if (_spawner_asset != -1) {
            instance_create_depth(x, y + 32, depth, _spawner_asset);
        }
    }
}

if (instance_exists(obj_beg_terrei) && instance_exists(obj_inventory)) {
    var dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    
    if (dist < 65) {
        var has_card_in_hand = false;
        var active_slot = obj_inventory.selected_slot;
        var slot_data = obj_inventory.inventory[active_slot];
        
        if (slot_data != undefined && slot_data != noone && is_struct(slot_data)) {
            if (struct_exists(slot_data, "item") && slot_data.item != undefined) {
                var _item = slot_data.item;
                if (struct_exists(_item, "item_id") && _item.item_id == 8) {
                    has_card_in_hand = true;
                }
            }
        }
        
        if (has_card_in_hand) {
            if (keyboard_check_pressed(ord("F"))) {
                is_open = !is_open;
            }
            
            if (is_open) {
                var current_player_coins = inventory_count_coins();
                
                if (keyboard_check_pressed(ord("1"))) {
                    if (current_player_coins >= 10 && global.bank_gold < global.bank_max_cap) {
                        inventory_remove_coins(10);
                        global.bank_gold += 10;
                    }
                }
                
                if (keyboard_check_pressed(ord("2"))) {
                    if (global.bank_gold >= 10) {
                        if (scr_items(global.db_items.coin, 10)) {
                            global.bank_gold -= 10;
                        }
                    }
                }
                
                if (keyboard_check_pressed(ord("3"))) {
                    if (global.bank_gold >= 50 && !delivery_active) {
                        global.bank_gold -= 50;
                        delivery_timer = 120;
                        delivery_active = true;
                    }
                }
            }
        } else {
            is_open = false;
        }
    } else {
        is_open = false;
    }
}
