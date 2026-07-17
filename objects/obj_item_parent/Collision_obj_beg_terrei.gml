if (can_pickup) {
    if (my_item_data != undefined && instance_exists(obj_inventory)) {
        var picked_up = false;
        if (my_item_data.type == "backpack" || my_item_data.type == "bag") {
            obj_inventory.upgrade_backpack_stats(my_item_data);
            picked_up = obj_inventory.add_item_to_inv(my_item_data, amount);
        } else {
            picked_up = obj_inventory.add_item_to_inv(my_item_data, amount);
        }
        if (picked_up) {
            instance_destroy(); 
        }
    } else {
        show_debug_message("Ошибка: данные предмета пустые или obj_inventory не создан!");
    }
}
