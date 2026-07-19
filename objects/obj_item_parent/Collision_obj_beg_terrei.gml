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
            var picked_up = scr_items(my_item_data, amount);
            if (picked_up) {
                instance_destroy(); 
            }
        } else {
            show_debug_message("Ошибка: Предмет с ID " + string(id) + " не смог найти свой ключ '" + string(variable_instance_exists(id, "item_key") ? item_key : "НЕТ КЛЮЧА") + "' в global.db_items!");
        }
        
    } else {
        show_debug_message("Ошибка: Объект obj_inventory отсутствует на сцене комнаты!");
    }
}