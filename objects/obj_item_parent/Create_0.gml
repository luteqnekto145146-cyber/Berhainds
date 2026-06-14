// Количество предметов при подборе по умолчанию
amount = 1; 

// Игра автоматически ищет настройки в базе данных по текстовому имени
if (variable_instance_exists(id, "item_key")) {
    if (struct_exists(global.db_items, item_key)) {
        my_item_data = global.db_items[$ item_key];
    } else {
        my_item_data = undefined;
    }
} else {
    my_item_data = undefined;
}