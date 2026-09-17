if (instance_exists(obj_beg_terrei) && instance_exists(obj_inventory)) {
    var dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    
    if (dist < 65) {
        if (keyboard_check_pressed(ord("F"))) {
            is_open = !is_open;
        }
        
        if (is_open) {
            var current_player_coins = 0;
            var _inv = obj_inventory.inventory; 
            for (var i = 0; i < array_length(_inv); i++) {
                var _check_slot = _inv[i];
                if (_check_slot != undefined && _check_slot != noone && is_struct(_check_slot)) {
                    if (struct_exists(_check_slot, "item") && _check_slot.item != undefined && is_struct(_check_slot.item)) {
                        if (struct_exists(_check_slot.item, "item_id") && _check_slot.item.item_id == 6) {
                            current_player_coins += _check_slot.count;
                        }
                    }
                }
            }
            
            if (keyboard_check_pressed(ord("1"))) {
                if (current_player_coins >= game_cost) {
                    inventory_remove_coins(game_cost);
                    is_open = false;
                    
                    var _game_room = asset_get_index("r_mini_game_room");
                    if (_game_room != -1) {
                        room_goto(_game_room);
                    }
                }
            }
        }
    } else {
        is_open = false;
    }
} else {
    is_open = false;
}
