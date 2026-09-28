if (is_stunned) exit;

var target = instance_nearest(x, y, obj_player_mansion);

if (target != noone && !target.is_dead) {
    move_towards_point(target.x, target.y, ghost_speed);
} else {
    speed = 0; 
}

var player_hit = instance_place(x, y, obj_player_mansion);
if (player_hit != noone && !player_hit.is_dead) {
    player_hit.is_dead = true;
    player_hit.image_alpha = 0.4; 
    show_message("Призрак поймал вас!");
}
