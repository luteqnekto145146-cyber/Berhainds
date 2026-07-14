draw_self();

if (speaker == "player") {
    draw_sprite(spr_player_avatar, 0, x + 10, y + 30);
} 
else if (speaker == "tower_guard") {
    draw_sprite(spr_tower_guard_avatar, 0, x + 10, y + 30);
}
else if (speaker == "meme_ant") {
    draw_sprite(spr_meme_ant_avatar, 0, x + 10, y + 30);
}

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var text_offset_x = 160; 
draw_text_ext(x + text_offset_x, y + 35, show_text, 22, sprite_width - 200)