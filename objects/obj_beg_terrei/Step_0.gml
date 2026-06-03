
if (mouse_wheel_up()) {
    if (has_revolver) { 
        weapon_select = 1;
        current_weapon = "revolver";
    }
}

if (mouse_wheel_down()) {
    weapon_select = 0;
    current_weapon = "none";
}
hdir = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) 
vdir = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) 

beg_cod();

move_and_collide(hdir * move_speed, vdir * move_speed, obj_wall, 4, 0,0, move_speed, move_speed)
// Если здоровье закончилось — перемещаем игрока в комнату главного меню
if (player_hp <= 0) {
	instance_destroy()
    room_goto(r_menu_i);
	exit
}
// Проверяем, идет ли сейчас анимация броска
if (sprite_index == spr_terrei_brosok_suriken) {
    
    // Если анимация дошла до 6-го кадра (в коде это 5) и мы еще НЕ выпустили снаряд
    if (floor(image_index) == 5 && shuriken_thrown == false) {
        
shuriken_thrown = true; // Отмечаем, что сюрикен выпущен
        
        if (global.crazy_mode == false) {
            var my_shuriken = instance_create_layer(x, y, "Instances", obj_sapfir_suriken);
            var target_dir = point_direction(x, y, mouse_x, mouse_y);
            my_shuriken.direction = target_dir;
            my_shuriken.speed = 8; // Скорость полета
        } else {
            var my_hornet = instance_create_layer(x, y, "Instances", obj_hornet);
            var target_dir = point_direction(x, y, mouse_x, mouse_y);
            
            // Шершень летит в сторону мышки, но с веерным разбросом!
            my_hornet.direction = target_dir + irandom_range(-15, 15);
            my_hornet.speed = 12; // Сделаем шершня чуть быстрее сюрикена!
        }
    }
}
// Проверяем нажатие ЛКМ и что в руках именно револьвер
if (mouse_check_button_pressed(mb_left) && current_weapon == "revolver") {
    
    // Проверяем, есть ли патроны
    if (revolver_ammo > 0) {
        revolver_ammo -= 1; // Тратим 1 патрон
        
        // Создаем пулю на координатах игрока. 
        // ВНИМАНИЕ: убедитесь, что на вашей карте слой называется именно "Instances"
        var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
        
        // Направляем пулю в сторону мышки
        bullet.direction = point_direction(x, y, mouse_x, mouse_y);
        
        // Задаем пуле скорость (можно изменить число, если летит слишком быстро/медленно)
        bullet.speed = 8; 
        
        // Поворачиваем сам спрайт пули по направлению полета
        bullet.image_angle = bullet.direction;
    }
}