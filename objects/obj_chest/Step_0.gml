if (!variable_instance_exists(id, "is_opened")) {
    is_opened = false;
}

if (!is_opened && instance_exists(obj_beg_terrei)) {
    var dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    
    if (dist < 50) {
        if (keyboard_check_pressed(ord("E"))) {
            if (!instance_exists(obj_dialogwindow)) {
                if (instance_exists(obj_dialog_spawn)) {
                    var dialog = instance_create_layer(obj_dialog_spawn.x, obj_dialog_spawn.y, "Instances", obj_dialogwindow);
                    
                    with (dialog) {
                        timeline_index = t_chest;
                        timeline_position = 0;
                        dialogue_step = 0;
                        timeline_running = true;
                    }
                    
                    is_opened = true;
                }
            }
        }
    }
}
if (instance_exists(obj_beg_terrei)) {
    var p_dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    
    if (p_dist < 32) {
        var p_dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
        
        obj_beg_terrei.x = x + lengthdir_x(32, p_dir);
        obj_beg_terrei.y = y + lengthdir_y(32, p_dir);
    }
}