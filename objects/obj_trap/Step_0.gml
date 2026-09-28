if (is_active) {
    var walker = instance_place(x, y, obj_player_mansion);
    if (walker != noone && !walker.is_dead) {
        walker.is_dead = true;
        walker.image_alpha = 0.4;
        show_message("Вы наступили на ловушку!");
    }
}
