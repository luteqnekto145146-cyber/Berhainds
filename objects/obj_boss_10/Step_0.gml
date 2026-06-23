if (!instance_exists(obj_player)) exit;

if (hp <= 0) {
    repeat(15) {
        var c = instance_create_layer(x, y, "Instances", obj_coin);
        with(c) { direction = random(360); speed = random_range(2, 5); friction = 0.1; }
    }
    instance_destroy();
}

var dist = distance_to_object(obj_player);

if (state == "move") {
    var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y);
    if (dist < 200) {
        var escape_dir = dir_to_player + 180;
        x += lengthdir_x(speed_run, escape_dir);
        y += lengthdir_y(speed_run, escape_dir);
    } else if (dist > 400) {
        x += lengthdir_x(speed_run - 1, dir_to_player);
        y += lengthdir_y(speed_run - 1, dir_to_player);
    }
    
    throw_timer--;
    if (throw_timer <= 0) {
        state = "throw";
        throw_timer = 30; 
    }
}
else if (state == "throw") {
    throw_timer--;
    if (throw_timer <= 0) {
        var bomb = instance_create_layer(x, y, "Instances", obj_boss_bomb);
        var target_dir = point_direction(x, y, obj_player.x, obj_player.y);
        with(bomb) {
            direction = target_dir;
            speed = 6;
            target_x = obj_player.x;
            target_y = obj_player.y;
        }
        state = "move";
        throw_timer = throw_cooldown;
    }
}
