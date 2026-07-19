if (heavy_attack_timer > 0) heavy_attack_timer--;
if (knife_attack_timer > 0) knife_attack_timer--; 
if (summon_timer > 0) summon_timer--;

if (!instance_exists(obj_beg_terrei)) {
    state = KNIGHT_STATE.CHASE;
    exit;
}

var _dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);

if (state != KNIGHT_STATE.ATTACK_BASIC && state != KNIGHT_STATE.ATTACK_HEAVY && state != KNIGHT_STATE.ATTACK_KNIVES && state != KNIGHT_STATE.DEATH) {
    if (obj_beg_terrei.x > x) image_xscale = 1;
    else image_xscale = -1;
}

switch (state) {
    
    case KNIGHT_STATE.CHASE:
        set_boss_sprite("spr_knight_walk", spr_knight_walk);
        
        mp_linear_step(obj_beg_terrei.x, obj_beg_terrei.y, boss_speed, false);
        
        if (boss_hp <= (boss_hp_max * 0.5) && !phase_summon_done) {
            phase_summon_done = true;
            for (var i = 0; i < 3; i++) {
                var _spawn_x = x + lengthdir_x(60, i * 120);
                var _spawn_y = y + lengthdir_y(60, i * 120);
                instance_create_layer(_spawn_x, _spawn_y, "Instances", obj_mini_knight);
            }
            boss_speed = 3; 
            state = KNIGHT_STATE.ATTACK_BASIC; 
            image_index = 0;
            break;
        }
        
        if (summon_timer == 0 && instance_number(obj_mini_knight) < 3) {
            summon_timer = summon_cooldown; 
            instance_create_layer(x - 50, y, "Instances", obj_mini_knight);
            instance_create_layer(x + 50, y, "Instances", obj_mini_knight);
            state = KNIGHT_STATE.ATTACK_BASIC;
            image_index = 0;
            break;
        }
        
        if (_dist <= attack_range_knives && _dist > attack_range_heavy && knife_attack_timer == 0) {
            state = KNIGHT_STATE.ATTACK_KNIVES;
            image_index = 0;
        }
        else if (_dist <= attack_range_heavy && heavy_attack_timer == 0 && _dist > attack_range_basic) {
            state = KNIGHT_STATE.ATTACK_HEAVY;
            image_index = 0;
        } 
        else if (_dist <= attack_range_basic) {
            state = KNIGHT_STATE.ATTACK_BASIC;
            image_index = 0;
        }
        break;
        
    case KNIGHT_STATE.ATTACK_BASIC:
        set_boss_sprite("spr_knight_attack_basic", spr_knight_attack_basic);
        if (floor(image_index) == 4) {
            if (_dist <= attack_range_basic && variable_instance_exists(obj_beg_terrei, "hp")) {
                obj_beg_terrei.hp -= boss_damage_basic;
            }
        }
        if (image_index >= image_number - 1) {
            state = KNIGHT_STATE.CHASE;
        }
        break;
        
    case KNIGHT_STATE.ATTACK_HEAVY:
        set_boss_sprite("spr_knight_attack_heavy", spr_knight_attack_heavy);
        if (image_index > 2 && image_index < 6) {
            var _dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
            x += lengthdir_x(boss_speed * 3, _dir);
            y += lengthdir_y(boss_speed * 3, _dir);
            if (_dist <= 40 && variable_instance_exists(obj_beg_terrei, "hp")) {
                obj_beg_terrei.hp -= boss_damage_heavy;
            }
        }
        if (image_index >= image_number - 1) {
            heavy_attack_timer = heavy_attack_cooldown;
            state = KNIGHT_STATE.CHASE;
        }
        break;
        
    case KNIGHT_STATE.ATTACK_KNIVES:
        set_boss_sprite("spr_knight_throw", spr_knight_throw);
        if (floor(image_index) == 3) {
            if (knife_attack_timer == 0) {
                knife_attack_timer = knife_attack_cooldown; 
                var _base_dir = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
                var _angles = [0, -15, 15]; 
                for (var n = 0; n < 3; n++) {
                    var _knife = instance_create_layer(x, y - 20, "Instances", obj_boss_knife);
                    if (instance_exists(_knife)) {
                        _knife.direction = _base_dir + _angles[n]; 
                        _knife.image_angle = _knife.direction; 
                    }
                }
            }
        }
        if (image_index >= image_number - 1) {
            state = KNIGHT_STATE.CHASE;
        }
        break;
        
    case KNIGHT_STATE.DEATH:
        set_boss_sprite("spr_knight_death", spr_knight_death);
        boss_speed = 0;
        if (image_index >= image_number - 1) {
            image_speed = 0;
        }
        break;
}

boss_hp_draw = lerp(boss_hp_draw, boss_hp, 0.1);
boss_hp_delayed = lerp(boss_hp_delayed, boss_hp_draw, 0.05);
