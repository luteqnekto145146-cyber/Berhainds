if (instance_exists(obj_pauze) && obj_pauze.paused) exit;
// Защита от работы кода во время паузы (наша прошлая механика)
if (instance_exists(obj_pauze) && obj_pauze.paused) exit;
hdir = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) 
vdir = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) 

beg_cod();

move_and_collide(hdir * move_speed, vdir * move_speed, obj_wall, 4, 0,0, move_speed, move_speed)
