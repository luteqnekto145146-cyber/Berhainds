var player = instance_nearest(x, y, obj_player_mansion);

if (player != noone) {
    draw_set_color(c_white);
    draw_text(20, 20, "FLASH CHARGES: " + string(player.flash_charges));
    
    if (player.has_key) {
        draw_set_color(c_yellow);
        draw_text(20, 40, "KEY: FOUND");
    } else {
        draw_set_color(c_red);
        draw_text(20, 40, "KEY: NEEDED");
    }
}
