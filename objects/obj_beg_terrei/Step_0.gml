hdir = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) 
vdir = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) 

beg_cod();

move_and_collide(hdir * move_speed, vdir * move_speed, obj_wall, 4, 0,0, move_speed, move_speed)
// Если здоровье закончилось — перемещаем игрока в комнату главного меню
if (player_hp <= 0) {
    room_goto(r_menu_i);
}
// Проверяем, идет ли сейчас анимация броска
if (sprite_index == spr_terrei_brosok_suriken) {
    
    // Если анимация дошла до 6-го кадра (в коде это 5) и мы еще НЕ выпустили снаряд
    if (floor(image_index) == 5 && shuriken_thrown == false) {
        
        shuriken_thrown = true; // Отмечаем, что сюрикен выпущен (чтобы код не сработал повторно на этом же кадре)
        
        // СОЗДАЕМ СЮРИКЕН В ТОЧКЕ ИГРОКА
        var my_shuriken = instance_create_layer(x, y, "Instances", obj_sapfir_suriken);
        
        // Направляем его в сторону мышки
        var target_dir = point_direction(x, y, mouse_x, mouse_y);
        my_shuriken.direction = target_dir;
        my_shuriken.speed = 8; // Скорость полета
    }
}
