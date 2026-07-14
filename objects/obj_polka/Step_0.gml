var target_player = instance_find(obj_beg_terrei, 0);

if (target_player != noone) {
    var dist = point_distance(x, y, target_player.x, target_player.y);
    
    if (dist < 70) {
        if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter)) {
            if (!instance_exists(obj_dialogwindow)) {
                
                var spawn_x = instance_exists(obj_dialog_spawn) ? obj_dialog_spawn.x : target_player.x - 400;
                var spawn_y = instance_exists(obj_dialog_spawn) ? obj_dialog_spawn.y : target_player.y + 100;
                
                var dialog = instance_create_layer(spawn_x, spawn_y, "Instances", obj_dialogwindow);
                
                with (dialog) {
                    timeline_index = t_meme_ant;
                    timeline_position = 0;
                    dialogue_step = 0;
                    timeline_running = true;
                }
            }
        }
    }
}