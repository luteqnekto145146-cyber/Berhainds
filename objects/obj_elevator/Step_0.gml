if (!is_grounded) {
    fall_speed += gravity_power; 
    y += fall_speed;             
    if (y >= target_y) {
        y = target_y;        
        fall_speed = 0;      
        is_grounded = true;  
    }
}

if (is_grounded && menu_open) {
    if (keyboard_check_pressed(vk_escape)) {
        menu_open = false;
        exit;
    }
    
    var max_options = 1; 
    if (menu_page == 1) {
        max_options += 1; 
        if (global.max_floor_reached >= 5) max_options += 1;
    }
    else if (menu_page == 2) {
        if (global.max_floor_reached >= 10) max_options += 1;
        if (global.max_floor_reached >= 15) max_options += 1;
    }
    else if (menu_page == 3) {
        if (global.max_floor_reached >= 20) max_options += 1;
        if (global.max_floor_reached >= 24) max_options += 1;
    }
    
    if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        menu_index -= 1;
        if (menu_index < 0) menu_index = max_options - 1; 
    }
    if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        menu_index += 1;
        if (menu_index >= max_options) menu_index = 0; 
    }
    
    if (keyboard_check_pressed(vk_enter)) {
        if (menu_page == 1) {
            if (menu_index == 0) { 
                global.current_floor = 0;
                room_goto(rm_tower_lobby);
            }
            else if (menu_index == 1 && global.max_floor_reached >= 5) { 
                global.current_floor = 5;
                room_restart();
            }
            else { 
                menu_page = 2;
                menu_index = 0; 
            }
        }
        else if (menu_page == 2) {
            var has_10 = (global.max_floor_reached >= 10);
            var has_15 = (global.max_floor_reached >= 15);
            if (menu_index == 0 && has_10) {
                global.current_floor = 10; room_restart();
            }
            else if ((menu_index == 1 && has_10 && has_15) || (menu_index == 0 && !has_10 && has_15)) {
                global.current_floor = 15; room_restart();
            }
            else { 
                menu_page = 3;
                menu_index = 0;
            }
        }
        else if (menu_page == 3) {
            var has_20 = (global.max_floor_reached >= 20);
            var has_24 = (global.max_floor_reached >= 24);
            if (menu_index == 0 && has_20) {
                global.current_floor = 20; room_restart();
            }
            else if ((menu_index == 1 && has_20 && has_24) || (menu_index == 0 && !has_20 && has_24)) {
                global.current_floor = 24; room_restart();
            }
            else { 
                menu_page = 1;
                menu_index = 0;
            }
        }
    }
}
