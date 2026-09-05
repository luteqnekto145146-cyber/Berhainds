if (!is_dashing && dash_cooldown == 0) {
    var _check_h = (keyboard_check(ord("D")) - keyboard_check(ord("A"))); 
    var _check_v = (keyboard_check(ord("S")) - keyboard_check(ord("W"))); 
    
    if (_check_h != 0 || _check_v != 0) {
        is_dashing = true;
        dash_cooldown = 35; 
        
        var _dir = point_direction(0, 0, _check_h, _check_v);
        dash_dir_x = lengthdir_x(7, _dir);
        dash_dir_y = lengthdir_y(7, _dir);
        
        if (sprite_exists(spr_player_dash)) {
            sprite_index = spr_player_dash;
            image_index = 0;
        }
        
        alarm[11] = 12;
    }
}
