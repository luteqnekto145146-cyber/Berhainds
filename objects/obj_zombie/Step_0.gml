if (state == Z_STATE.DIE) {
    speed = 0;                          
    sprite_index = spr_zombie_die;      
    
    if (image_index >= image_number - 1) {
        image_speed = 0;                
        image_index = image_number - 1; 
        
        instance_create_layer(x, y, "Instances", obj_exp);
        var chance = random(100);
        
        if (chance <= 10) {
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
        }
        else if (chance > 10 && chance <= 50) {
            instance_create_layer(x, y, "Instances", obj_coin);
        }
        
        instance_destroy(); 
    }
    exit; 
}

if (hp <= 0) {
    state = Z_STATE.DIE;
    image_index = 0; 
    image_speed = 1; 
    exit;
}

if (attack_cooldown > 0) {
    attack_cooldown--;
}

if (state != Z_STATE.ATTACK) {
    var neighbor = instance_place(x, y, obj_zombie); 
    if (neighbor != noone) {
        var push_dir = point_direction(neighbor.x, neighbor.y, x, y);
        x += lengthdir_x(1.2, push_dir);
        y += lengthdir_y(1.2, push_dir);
    }
}

if (instance_exists(obj_beg_terrei)) {
    
    var dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    var move_dir = direction; 
    
    switch (state) {
        
        case Z_STATE.WANDER:
            wander_timer++;
            if (wander_timer >= 120) {
                var dist_to_home = point_distance(x, y, home_x, home_y);
                
                if (dist_to_home > 100) {
                    direction = point_direction(x, y, home_x, home_y);
                    speed = move_speed;
                } else {
                    var wander_chance = random(100);
                    var decide_to_walk = (wander_chance > 15); 
                    
                    if (decide_to_walk) {
                        direction = random(360); 
                        speed = move_speed;
                    } else {
                        speed = 0;
                    }
                }
                wander_timer = 0;
            }
            
            if (speed > 0) move_dir = direction;
            
            if (dist < detection_radius) {
                state = Z_STATE.CHASE;
            }
            break;
            
        case Z_STATE.CHASE:
            var target_x = obj_beg_terrei.x;
            var target_y = obj_beg_terrei.y + 16; 
            
            var dist_to_feet = point_distance(x, y, target_x, target_y);
            
            if (dist > detection_radius * 1.5) {
                state = Z_STATE.RETURN;
                break;
            }
            
            if (dist_to_feet <= attack_radius) {
                state = Z_STATE.ATTACK;
                image_index = 0; 
                speed = 0;
                break;
            }
            
            mp_potential_step(target_x, target_y, chase_speed, false);
            move_dir = point_direction(x, y, target_x, target_y);
            break;

        case Z_STATE.ATTACK:
            speed = 0; 
            
            var attack_dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y + 16);
            attack_dir = (attack_dir + 360) % 360; 
            
            var target_sprite = Spr_zombie_ataka_v_pravo;
            if (attack_dir >= 45 && attack_dir < 135)       target_sprite = Spr_zombie_ataka_ot_nas;    
            else if (attack_dir >= 135 && attack_dir < 225) target_sprite = Spr_zombie_ataka_v_levo;    
            else if (attack_dir >= 225 && attack_dir < 315) target_sprite = Spr_zombie_ataka_na_nas;    
            
            if (sprite_index != target_sprite) {
                sprite_index = target_sprite;
            }
            
            image_xscale = 1; 
            
            var check_dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y + 16);
            
            if (check_dist <= attack_radius + 15) {
                if (attack_cooldown <= 0) {
                    obj_beg_terrei.player_hp -= 15; 
                    attack_cooldown = 40; 
                }
            } else {
                state = Z_STATE.CHASE;
            }
            
            if (image_index >= image_number - 1) {
                image_index = 0;
            }
            break;
            
        case Z_STATE.RETURN:
            mp_potential_step(home_x, home_y, move_speed, true);
            move_dir = point_direction(x, y, home_x, home_y);
            
            var dist_to_home = point_distance(x, y, home_x, home_y);
            if (dist_to_home <= 10) {
                state = Z_STATE.WANDER;
                wander_timer = 120; 
            }
            
            if (dist < detection_radius) {
                state = Z_STATE.CHASE;
            }
            break;
    }
    
    if (state != Z_STATE.ATTACK) {
        move_dir = (move_dir + 360) % 360;
        
        if (speed > 0) {
            if (move_dir >= 45 && move_dir < 135) sprite_index = spr_idet_ot_nas_zombie;
            else if (move_dir >= 135 && move_dir < 225) sprite_index = spr_idet_v_levo_zombie;
            else if (move_dir >= 225 && move_dir < 315) sprite_index = spr_idet_na_nas_zombie;
            else sprite_index = spr_idet_v_pravo_zombie;
        } else {
            if (move_dir >= 45 && move_dir < 135) sprite_index = spr_ne_dvigayetsa_zombie_ot_nas;
            else if (move_dir >= 135 && move_dir < 225) sprite_index = spr_ne_dvigayetsa_zombie_v_levo;
            else if (move_dir >= 225 && move_dir < 315) sprite_index = spr_ne_dvigayetsa_zombie_na_nas;
            else sprite_index = spr_ne_dvigayetsa_zombie_v_pravo;
        }
        image_xscale = 1; 
    }
    
} else {
    speed = 0;
    sprite_index = spr_ne_dvigayetsa_zombie_na_nas;
}
