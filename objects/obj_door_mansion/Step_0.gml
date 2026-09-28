var walker = instance_place(x, y, obj_player_mansion);
if (walker != noone) {
    if (walker.has_key) {
        show_message("Вы нашли ключ и сбежали! Победа!");
        room_restart(); 
    }
}
