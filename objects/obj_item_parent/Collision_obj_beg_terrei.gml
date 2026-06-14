if (my_item_data != undefined && instance_exists(obj_inventory)) {
    
    // Проверяем: если этот предмет рюкзак — увеличиваем слоты
    if (my_item_data.type == "backpack" || my_item_data.type == "bag") {
        obj_inventory.upgrade_backpack_stats(my_item_data);
        instance_destroy();
    } 
    // Для всех остальных предметов (монеты, патроны и т.д.) — обычный подбор в инвентарь/хотбар
    else {
        var picked_up = obj_inventory.add_item_to_inv(my_item_data, amount);
        
        if (picked_up == true) {
            instance_destroy(); // Исчезает с земли, если успешно положили в инвентарь
        }
    }
} else {
    show_debug_message("Предмет до сих пор не знает, кто он такой, или нет инвентаря!");
}