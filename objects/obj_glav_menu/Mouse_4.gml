if (mouse_check_button_pressed(mb_left)) {
    with (all) {
        if (variable_instance_exists(id, "old_image_speed")) {
            image_speed = old_image_speed;
            speed = old_speed;
            hspeed = old_hspeed;
            vspeed = old_vspeed;
        }
    }
    
    var inst_layer = layer_get_id("Instances");
    if (inst_layer != -1 && variable_global_exists("pause_seq_id") && layer_sequence_exists(inst_layer, global.pause_seq_id)) {
        layer_sequence_destroy(global.pause_seq_id);
    }
    
    var extra_layer = layer_get_id("Pause_Layer");
    if (extra_layer != -1 && variable_global_exists("pause_seq_id") && layer_sequence_exists(extra_layer, global.pause_seq_id)) {
        layer_sequence_destroy(global.pause_seq_id);
    }
    
    if (instance_exists(obj_button_save)) {
        instance_destroy(obj_button_save);
    }
    
    room_goto(r_menu_i);
}

