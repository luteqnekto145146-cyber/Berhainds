if (my_item_data != undefined) {
    if (struct_exists(my_item_data, "sprite")) {
        var _item_sprite = my_item_data.sprite;
        if (sprite_exists(_item_sprite)) {
            draw_sprite(_item_sprite, 0, x, y);
        }
    }
} else if (sprite_exists(sprite_index)) {
    draw_self();
}
