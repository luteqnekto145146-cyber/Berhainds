if (instance_exists(other)) {
    show_debug_message("БУМ! Сгусток попал в игрока!");
    
    if (variable_instance_exists(other.id, "hp")) {
        other.hp -= 45;
    } else if (variable_instance_exists(other.id, "my_hp")) {
        other.my_hp -= 45;
    } else if (variable_instance_exists(other.id, "player_hp")) {
        other.player_hp -= 45;
    } else if (variable_global_exists("player_hp")) {
        global.player_hp -= 45;
    } else if (variable_global_exists("hp")) {
        global.hp -= 45;
    }
    
    instance_destroy();
}