if (array_length(mansion_items) > 0) {
    var spawn_x = irandom_range(64, room_width - 64);
    var spawn_y = irandom_range(64, room_height - 64);

    if (!position_meeting(spawn_x, spawn_y, obj_wall)) {
        var random_index = irandom(array_length(mansion_items) - 1);
        var chosen_item = mansion_items[random_index];
        instance_create_layer(spawn_x, spawn_y, "Instances", chosen_item);
    }
}

alarm = 60 * 7;
