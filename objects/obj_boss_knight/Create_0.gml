boss_hp_max = 500;
boss_hp = boss_hp_max;
boss_speed = 2;
boss_damage_basic = 15;
boss_damage_heavy = 35;

attack_range_basic = 50;  
attack_range_heavy = 180; 
attack_range_knives = 300; 

heavy_attack_cooldown = 5 * game_get_speed(gamespeed_fps); 
heavy_attack_timer = 0;

knife_attack_cooldown = 7 * game_get_speed(gamespeed_fps);
knife_attack_timer = game_get_speed(gamespeed_fps) * 2; 

phase_summon_done = false; 
summon_cooldown = 15 * game_get_speed(gamespeed_fps); 
summon_timer = summon_cooldown; 

enum KNIGHT_STATE {
    SPAWN,
    CHASE,
    ATTACK_BASIC,
    ATTACK_HEAVY,
    ATTACK_KNIVES, 
    HURT,
    DEATH
}

state = KNIGHT_STATE.CHASE;

boss_hp_draw = boss_hp; 
boss_hp_delayed = boss_hp; 
function set_boss_sprite(_sprite_name, _actual_sprite) {
    if (asset_get_index(_sprite_name) != -1) {
        if (sprite_index != _actual_sprite) sprite_index = _actual_sprite;
    }
}
