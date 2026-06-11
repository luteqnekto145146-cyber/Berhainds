can_shoot = true;

canwalk = true;

move_speed = 2;

hdir = 0;

vdir = 0;

global.coins = 0;

global.xp = 0;

player_hp_max = 100;

player_hp = player_hp_max;

shurikens = 0;

shuriken_thrown = false; 
has_revolver = false 
current_weapon = "none"
revolver_ammo = 0
weapon_select = 0


if (instance_exists(obj_spawn_point)) {
    var spawn = instance_find(obj_spawn_point, 0);
    x = spawn.x;
    y = spawn.y;
    show_debug_message("ТОЧКА СПАВНА НАЙДЕНА ИГРОКОМ!");
} else {
    show_debug_message("ОШИБКА: Игрок не видит объект obj_spawnpoint!");
}
alaram[0] = 1 

has_parry_item = true
popup_text = ""
popup_timer = 0








