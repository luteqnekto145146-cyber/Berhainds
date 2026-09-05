if (can_pickup && my_item_data != undefined) {
    if (instance_exists(obj_inventory)) {
        var picked_up = false;
        
        if (my_item_data.type == "backpack" || my_item_data.type == "bag") {
            obj_inventory.upgrade_backpack_stats(my_item_data);
            picked_up = scr_items(my_item_data, amount);
        } else {
            picked_up = scr_items(my_item_data, amount);
        }
        
        if (picked_up) {
            var thorn_chance = irandom(1); 
            if (thorn_chance == 0) {
                if (variable_instance_exists(other.id, "player_hp")) {
                    other.player_hp -= 5;
                }
                var popup = instance_create_depth(other.x, other.y - 20, depth - 100, obj_popup_text);
                if (instance_exists(popup)) {
                    popup.text = "Упс, предмет был с колючкой! Аккуратнее в следующий раз";
                }
            }
            instance_destroy(); 
        }
    }
}
