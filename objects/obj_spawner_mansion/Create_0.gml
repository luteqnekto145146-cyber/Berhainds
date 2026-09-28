alarm = 60 * 5;
mansion_items = [];

var current_obj = 0;
while (object_exists(current_obj)) {
    if (object_is_ancestor(current_obj, obj_mansion_item_parent)) {
        array_push(mansion_items, current_obj);
    }
    current_obj++;
}
