amount = 1;
my_item_data = undefined;
can_pickup = true; 

if (variable_instance_exists(id, "item_key")) {
    if (variable_global_exists("db_items") && struct_exists(global.db_items, item_key)) {
        my_item_data = variable_clone(global.db_items[$ item_key]);
    }
}
