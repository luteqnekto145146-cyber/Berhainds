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
has_shield = false
my_shield_type = noone 


// По умолчанию щит не подобран
has_shield = false; 
my_shield_type = noone

// Переменные для красивого всплывающего текста
shield_text = "";
text_color = c_white;
text_timer = 0;
text_y_offset = 0; // Смещение текста вверх
text_alpha = 1.0;  // Прозрачность текста (1 = полностью виден, 0 = невидим)
my_shield_object = noone;








