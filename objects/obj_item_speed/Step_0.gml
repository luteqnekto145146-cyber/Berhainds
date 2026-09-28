var walker = instance_place(x, y, obj_player_mansion);
if (walker != noone && !walker.is_dead) {
    walker.move_speed = 7; 
    walker.alarm[0] = 60 * 4; 
    instance_destroy(); 
}
