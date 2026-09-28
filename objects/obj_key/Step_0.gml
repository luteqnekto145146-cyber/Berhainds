var walker = instance_place(x, y, obj_player_mansion);
if (walker != noone && !walker.is_dead) {
    walker.has_key = true; 
    instance_destroy();    
}
