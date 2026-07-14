event_inherited();

hp_max = 100;
hp = hp_max;
move_speed = 1.5;

home_x = x;
home_y = y;
wander_max_dist = 120;

vision_radius = 250;
attack_distance = 180;
shoot_cooldown = game_get_speed(gamespeed_fps) * 4; 
shoot_timer = 0;

enum M_STATE {
    WANDER,
    ATTACK,
    RETURN
}

state = M_STATE.WANDER;

wander_timer = 0;
move_x = x;
move_y = y
if (instance_exists(obj_fade_controller)) {
    var inst = instance_find(obj_fade_controller, 0);
    if (variable_instance_exists(inst.id, "enemies")) inst.enemies += 1;
    if (variable_instance_exists(inst.id, "enemies_count")) inst.enemies_count += 1;
    if (variable_instance_exists(inst.id, "enemy_count")) inst.enemy_count += 1;
    if (variable_instance_exists(inst.id, "count")) inst.count += 1;
}

if (variable_global_exists("enemies")) global.enemies += 1;
if (variable_global_exists("enemies_count")) global.enemies_count += 1;