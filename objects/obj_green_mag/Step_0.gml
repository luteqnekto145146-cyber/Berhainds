if (hp <= 0) {
    instance_destroy();
    exit;
}

if (shoot_timer > 0) {
    shoot_timer -= 1;
}

var target = instance_nearest(x, y, obj_beg_terrei);

if (target != noone) {
    var dist_to_player = point_distance(x, y, target.x, target.y);
    if (state == M_STATE.WANDER && dist_to_player <= vision_radius) {
        state = M_STATE.ATTACK;
    }
}

switch (state) {
    case M_STATE.WANDER:
        if (point_distance(x, y, home_x, home_y) > wander_max_dist) {
            state = M_STATE.RETURN;
            break;
        }
        wander_timer -= 1;
        if (wander_timer <= 0) {
            wander_timer = irandom_range(60, 180);
            if (irandom(1) == 1) {
                move_x = home_x + random_range(-wander_max_dist, wander_max_dist);
                move_y = home_y + random_range(-wander_max_dist, wander_max_dist);
            } else {
                move_x = x; 
                move_y = y;
            }
        }
        
        if (point_distance(x, y, move_x, move_y) > 4) {
            move_towards_point(move_x, move_y, move_speed);
            if (move_x > x) image_xscale = 1; else if (move_x < x) image_xscale = -1;
        } else {
            speed = 0;
        }
        break;
        
    case M_STATE.ATTACK:
        if (target == noone) {
            state = M_STATE.RETURN;
            break;
        }
        
        var current_dist = point_distance(x, y, target.x, target.y);
        if (current_dist > vision_radius * 1.2) {
            state = M_STATE.RETURN;
            break;
        }
        
        if (target.x > x) image_xscale = 1; else if (target.x < x) image_xscale = -1;
        
        if (current_dist > attack_distance) {
            move_towards_point(target.x, target.y, move_speed);
        } else {
            speed = 0;
            
            if (shoot_timer <= 0) {
                shoot_timer = shoot_cooldown; 
                var bullet = instance_create_layer(x, y, "Instances", obj_sgystok_green_magic);
                if (bullet != noone) {
                    bullet.speed = 5; 
                    bullet.direction = point_direction(x, y, target.x, target.y); 
                }
            }
        }
        break;
        
    case M_STATE.RETURN:
        move_towards_point(home_x, home_y, move_speed);
        if (home_x > x) image_xscale = 1; else if (home_x < x) image_xscale = -1;
        
        if (point_distance(x, y, home_x, home_y) < 10) {
            speed = 0;
            state = M_STATE.WANDER;
            wander_timer = 0;
        }
        break;
}
if (hp <= 0) {
    var ctrl_list = [obj_control, obj_game, obj_spawner, obj_level];
    for (var i = 0; i < array_length(ctrl_list); i++) {
        var c_obj = ctrl_list[i];
        if (instance_exists(c_obj)) {
            var inst = instance_find(c_obj, 0);
            if (variable_instance_exists(inst.id, "enemies")) inst.enemies -= 1;
            if (variable_instance_exists(inst.id, "enemies_count")) inst.enemies_count -= 1;
            if (variable_instance_exists(inst.id, "enemy_count")) inst.enemy_count -= 1;
            if (variable_instance_exists(inst.id, "count")) inst.count -= 1;
        }
    }
    if (variable_global_exists("enemies")) global.enemies -= 1;
    if (variable_global_exists("enemies_count")) global.enemies_count -= 1;

    event_inherited();
    instance_destroy();
    exit;
}