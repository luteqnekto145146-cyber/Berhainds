if (instance_exists(obj_dialog_spawn)) {
    x = obj_dialog_spawn.x;
    y = obj_dialog_spawn.y;
}

if (timeline_running) {
    var _prev_pos = timeline_position;
    timeline_position = dialogue_step;
    timeline_running = false;
}

if (char_count < string_length(raw_text)) {
    char_count += char_speed;
    show_text = string_copy(raw_text, 1, floor(char_count));
}

if (mouse_check_button_pressed(mb_left)) {
    if (char_count < string_length(raw_text)) {
        char_count = string_length(raw_text);
        show_text = raw_text;
    } else {
        dialogue_step += 1; 
        
        var last_moment = -1;
        if (timeline_index == t_introdiushen) last_moment = 1;
        if (timeline_index == t_chest) last_moment = 0;
        if (timeline_index == t_guard) last_moment = 0;
        
        if (dialogue_step <= last_moment) {
            char_count = 0;
            show_text = "";
            raw_text = "";
            timeline_position = dialogue_step; 
            timeline_running = true; 
        } else {
            
            if (instance_exists(obj_tower_guard)) {
                obj_tower_guard.timeline_position = 1;
                obj_tower_guard.timeline_running = true;
            }
            instance_destroy(); 
        }
    }
}