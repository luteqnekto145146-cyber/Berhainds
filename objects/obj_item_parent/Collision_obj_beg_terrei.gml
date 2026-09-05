if (can_pickup) {
    if (instance_exists(obj_inventory)) {
        if (my_item_data == undefined) {
            if (variable_instance_exists(id, "item_key")) {
                var _key = string(item_key);
                if (variable_global_exists("db_items") && struct_exists(global.db_items, _key)) {
                    my_item_data = variable_clone(global.db_items[$ _key]);
                }
            }
        }
        if (my_item_data != undefined) {
            var picked_up = false;
            if (my_item_data.type == "backpack" || my_item_data.type == "bag") {
                obj_inventory.upgrade_backpack_stats(my_item_data);
                picked_up = scr_items(my_item_data, amount);
            } else {
                picked_up = scr_items(my_item_data, amount);
            }
            if (picked_up) {
                instance_destroy(); 
            }
        }
    }
}
