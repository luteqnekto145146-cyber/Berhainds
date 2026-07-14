var base_enemies = 3;
var total_enemies_to_spawn = base_enemies + floor(global.current_floor / 3);

repeat(total_enemies_to_spawn) {
    var spawn_x = random_range(100, room_width - 100);
    var spawn_y = random_range(200, room_height - 200);
    
    var enemy_type = choose(obj_sceleton_sherif,obj_green_mag, obj_zombie); 
    var created_enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_type);
    
    with(created_enemy) {
        if (place_meeting(x, y, obj_wall)) {
            y -= 64; 
        }
    }
}

// Показываем дебаг-сообщение, что враги наконец-то прибыли
show_debug_message("ВРАГИ ЗАСПАВНИЛИСЬ!");

instance_destroy(); // Уничтожаем генератор
