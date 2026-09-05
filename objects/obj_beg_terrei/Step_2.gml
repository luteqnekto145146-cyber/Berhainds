if (dash_cooldown > 0) {
    dash_cooldown -= 1;
}

if (is_dashing) {
    var _dash_sprite_asset = asset_get_index("spr_player_dash");
    if (_dash_sprite_asset != -1) {
        if (sprite_index != _dash_sprite_asset) {
            sprite_index = _dash_sprite_asset;
            image_index = 0;
        }
    }

    move_and_collide(dash_dir_x, dash_dir_y, obj_wall);
    
    var _ghost_asset = asset_get_index("obj_dash_ghost");
    if (_ghost_asset != -1) {
        var ghost = instance_create_depth(x, y, depth + 1, _ghost_asset);
        if (instance_exists(ghost)) {
            ghost.sprite_index = sprite_index;
            ghost.image_index = image_index;
            ghost.image_xscale = image_xscale;
        }
    }
}
