if (!is_grounded) exit;

if (!menu_open) {
    menu_open = true;
    menu_page = 1; 
    menu_index = 0;
    if (instance_exists(obj_player)) {
        obj_player.speed = 0; 
    }
}
