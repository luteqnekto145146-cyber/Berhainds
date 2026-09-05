if (my_item_data != undefined && struct_exists(my_item_data, "sprite") && sprite_exists(my_item_data.sprite)) {
    draw_sprite(my_item_data.sprite, 0, x, y);
} else if (sprite_exists(sprite_index)) {
    draw_self();
} else {
    draw_set_color(c_red);
    draw_rectangle(x - 8, y - 8, x + 8, y + 8, false);
    draw_set_color(c_white);
    draw_text(x - 4, y - 20, "?");
}
