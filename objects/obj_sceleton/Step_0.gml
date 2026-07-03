// 1. СМЕРТЬ
if (state == Z_STAT.DIE) {
    speed = 0;                          
    sprite_index = spr_sceleton_die      
    
    if (image_index >= image_number - 1) {
        image_speed = 0;                
        image_index = image_number - 1; 
        
        // лут
        instance_create_layer(x, y, "Instances", obj_exp);
        var chance = random(100);
        
		if (chance <= 15) {
			instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_koct);
		}
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
    state = Z_STAT.DIE;
    image_index = 0; 
    image_speed = 1; 
    exit;
}
var neighbor = instance_place(x, y, obj_sceleton); 

if (neighbor != noone) {
    
    var push_dir = point_direction(neighbor.x, neighbor.y, x, y);
    x += lengthdir_x(1.5, push_dir);
    y += lengthdir_y(1.5, push_dir);
}
if (instance_exists(obj_beg_terrei)) {
    
   
    var dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    var move_dir = direction; 
    
    switch (state) {
        
        case Z_STAT.WANDER:
            // ЛОГИКА БЛУЖДАНИЯ С УМНЫМИ ПАУЗАМИ (Вариант 2, шанс 15%)
            wander_timer++;
            if (wander_timer >= 120) {
                var dist_to_home = point_distance(x, y, home_x, home_y);
                
                if (dist_to_home > 100) {
                    direction = point_direction(x, y, home_x, home_y);
                    speed = move_speed;
                } else {
                    var wander_chance = random(100);
                    var decide_to_walk = (wander_chance > 15); // 85% идет, 15% стоит
                    
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
                state = Z_STAT.CHASE;
            }
            break;
			    case Z_STAT.CHASE:
          
            var target_x = obj_beg_terrei.x;
            var target_y = obj_beg_terrei.y; 
            
            mp_potential_step(target_x, target_y, chase_speed, true);
            move_dir = point_direction(x, y, target_x, target_y);
            
 
            var dist_to_feet = point_distance(x, y, target_x, target_y);
            
            if (dist > detection_radius * 1.5) {
                state = Z_STAT.RETURN;
            }
           
            else if (dist_to_feet <= attack_radius) {
                state = Z_STAT.ATTACK;
                image_index = 0;
            }
            break;
			case Z_STAT.ATTACK:
            // 3. ЛОГИКА АТАКИ 
            speed = 0; 
            
          
            var attack_dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y + 16);
            attack_dir = (attack_dir + 360) % 360; 
            
            
            if (attack_dir >= 45 && attack_dir < 135) sprite_index = Spr_zombie_ataka_ot_nas;    
            else if (attack_dir >= 135 && attack_dir < 225) sprite_index = Spr_zombie_ataka_v_levo;    
            else if (attack_dir >= 225 && attack_dir < 315) sprite_index = Spr_zombie_ataka_na_nas;    
            else sprite_index = Spr_zombie_ataka_v_pravo;   
            
            image_xscale = 1; 
            
            
         
            if (floor(image_index) == 5 && attack_cooldown <= 0) {
                
         
                var check_dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y + 16);
                if (check_dist <= attack_radius + 10) { 
                    obj_beg_terrei.player_hp -= 15; 
                    attack_cooldown = 1; 
                }
            }
            
            
            if (image_index < 1) {
                attack_cooldown = 0;
            }
            
      
            var current_dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y + 16);
            if (current_dist > attack_radius + 10) {
                state = Z_STAT.CHASE;
                attack_cooldown = 0;
            }
            break;
			     case Z_STAT.RETURN:
            // ЛОГИКА ВОЗВРАЩЕНИЯ ДОМОЙ
            mp_potential_step(home_x, home_y, move_speed, true);
            move_dir = point_direction(x, y, home_x, home_y);
            
            var dist_to_home = point_distance(x, y, home_x, home_y);
            if (dist_to_home <= 10) {
                state = Z_STAT.WANDER;
                wander_timer = 120; 
            }
            
            if (dist < detection_radius) {
                state = Z_STAT.CHASE;
            }
            break;
	}
   if (state != Z_STAT.ATTACK) {
        move_dir = (move_dir + 360) % 360;
        
        if (speed > 0) {
            // Если идет — включаем анимацию ходьбы
            if (move_dir >= 45 && move_dir < 135) sprite_index = spr_idet_ot_nas_sceleton;
            else if (move_dir >= 135 && move_dir < 225) sprite_index = spr_idet_v_levo_scelet;
            else if (move_dir >= 225 && move_dir < 315) sprite_index = spr_idet_na_nas_sceleton;
            else sprite_index = spr_idet_v_pravo_scelet;
        } else {
            
            if (move_dir >= 45 && move_dir < 135) sprite_index = spr_ne_dvigayetsa_ot_nas_scelet;
            else if (move_dir >= 135 && move_dir < 225) sprite_index = spr_ne_dvigayetsa_v_levo_scelet;
            else if (move_dir >= 225 && move_dir < 315) sprite_index = spr_ne_dvigayetsa_na_nas_scelet;
            else sprite_index = spr_ne_dvigayetsa_v_pravo_scelet;
        }
        image_xscale = 1; 
    }
    
} else {
    speed = 0;
    sprite_index = spr_ne_dvigayetsa_zombie_na_nas;
}