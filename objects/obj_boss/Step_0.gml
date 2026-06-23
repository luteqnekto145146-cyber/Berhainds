if (!instance_exists(obj_beg_terrei)) exit;

if (hp <= 0) {
    repeat(30) { 
        var coin_x = x + random_range(-20, 20);
        var coin_y = y + random_range(-20, 20);
        var c = instance_create_layer(coin_x, coin_y, "Instances", obj_coin);
        with(c) { direction = random(360); speed = random_range(3, 7); friction = 0.2; }
    }
    var p_system = part_system_create();
    var p_type = part_type_create();
    part_type_shape(p_type, pt_shape_disk); 
    part_type_size(p_type, 0.5, 2.0, -0.05, 0); 
    part_type_color3(p_type, c_red, c_orange, c_gray); 
    part_type_alpha3(p_type, 1, 0.8, 0); 
    part_type_life(p_type, 30, 60); 
    part_type_speed(p_type, 4, 12, -0.2, 0); 
    part_type_direction(p_type, 0, 360, 0, 0); 
    part_particles_create(p_system, x, y, p_type, 100);
    instance_destroy();
}

if (state == "walk") {
    var dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    x += lengthdir_x(speed_walk, dir);
    y += lengthdir_y(speed_walk, dir);
    
    jump_timer--;
    if (jump_timer <= 0) {
        var next_attack = choose(1, 2);
        if (next_attack == 1) {
            state = "prepare";
            jump_timer = 40; 
        } else {
            state = "shoot_circle";
            shoot_timer = shoot_duration;
            spiral_direction = choose(1, -1); 
        }
    }
}
else if (state == "prepare") {
    jump_timer--;
    if (jump_timer <= 0) {
        state = "jump";
        jump_current_frame = 0;
        start_x = x;
        start_y = y;
        jump_target_x = obj_beg_terrei.x;
        jump_target_y = obj_beg_terrei.y;
    }
}
else if (state == "jump") {
    jump_current_frame++;
    var t = jump_current_frame / jump_duration;
    x = lerp(start_x, jump_target_x, t);
    y = lerp(start_y, jump_target_y, t);
    if (t >= 1) {
        state = "land";
        jump_timer = 30; 
        instance_create_layer(x, y, "Instances", obj_shockwave);
    }
}
else if (state == "land") {
    jump_timer--;
    if (jump_timer <= 0) {
        state = "walk";
        jump_timer = jump_cooldown; 
    }
}
else if (state == "shoot_circle") {
    shoot_timer--;
    if (shoot_timer % 4 == 0) {
        spiral_angle += 15 * spiral_direction; 
        var streams = 4; 
        var angle_step = 360 / streams;
        for (var i = 0; i < streams; i++) {
            var bullet_angle = spiral_angle + (i * angle_step);
            var b = instance_create_layer(x, y, "Instances", obj_pyli_sceleton_sherif); 
            with(b) { direction = bullet_angle; speed = 3.5; }
        }
    }
    if (shoot_timer <= 0) {
        state = "walk";
        jump_timer = jump_cooldown; 
    }
}
