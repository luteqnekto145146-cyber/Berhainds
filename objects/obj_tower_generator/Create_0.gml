
var random_chunk = choose(obj_chunk_flat, obj_chunk_hills, obj_chunk_pits);
instance_create_layer(room_width / 2, room_height / 2, "Instances", random_chunk);

var base_enemies = 3;
var total_enemies_to_spawn = base_enemies + floor(global.current_floor / 3);

repeat(total_enemies_to_spawn) {
    var spawn_x = random_range(100, room_width - 100);
    var spawn_y = random_range(200, room_height - 200);
    
    // СЛУЧАЙНЫЙ ВЫБОР: выбираем между Шерифом и Зомби
    var enemy_type = choose(obj_sceleton_sherif, obj_zombie); 
    
    var created_enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_type);
    
    // Проверка, чтобы враг не застрял в вашей твердой стене obj_wall
    with(created_enemy) {
        if (place_meeting(x, y, obj_wall)) {
            y -= 64; 
        }
    }
}

instance_destroy();
