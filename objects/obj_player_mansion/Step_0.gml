if (is_dead) exit; 

var key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var key_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var key_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

hsp = (key_right - key_left) * move_speed;
vsp = (key_down - key_up) * move_speed;

if (place_meeting(x + hsp, y, obj_wall)) {
    while (!place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_wall)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (keyboard_check_pressed(vk_space) && flash_charges > 0) {
    flash_charges -= 1;
    
    with (obj_ghost) {
        if (distance_to_object(other) < 200) {
            is_stunned = true;
            direction = point_direction(other.x, other.y, x, y); 
            speed = 3; 
            alarm[0] = 60 * 2; 
        }
    }
}
