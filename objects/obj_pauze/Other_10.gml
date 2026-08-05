paused = !paused;

if (paused)
{
    with (all)
    {
        if (id != other.id && object_index != obj_knopka_exet && object_index != obj_button_save)
        {
            old_image_speed = image_speed;
            old_speed = speed;
            old_hspeed = hspeed;
            old_vspeed = vspeed;
            
            image_speed = 0;
            speed = 0;
            hspeed = 0;
            vspeed = 0;
        }
    }
    
    var target_layer = layer_get_id("Instances");
    if (target_layer == -1) target_layer = layer_create(-10000, "Pause_Layer");
    
    var cam_x = camera_get_view_x(view_camera);
    var cam_y = camera_get_view_y(view_camera);
    var cam_w = camera_get_view_width(view_camera);
    var cam_h = camera_get_view_height(view_camera);
    
    pause_seq_id = layer_sequence_create(target_layer, cam_x, cam_y, seq_pause_menu);
    
    if (!instance_exists(obj_button_save)) {
        instance_create_layer(cam_x + (cam_w / 2), cam_y + (cam_h / 2) + 60, target_layer, obj_button_save);
    }
}
else
{
    var inst_layer = layer_get_id("Instances");
    if (inst_layer != -1 && layer_sequence_exists(inst_layer, pause_seq_id)) layer_sequence_destroy(pause_seq_id);
    
    var extra_layer = layer_get_id("Pause_Layer");
    if (extra_layer != -1 && layer_sequence_exists(extra_layer, pause_seq_id)) layer_sequence_destroy(pause_seq_id);
    
    if (instance_exists(obj_button_save)) {
        instance_destroy(obj_button_save);
    }
    
    with (all)
    {
        if (id != other.id && variable_instance_exists(id, "old_image_speed"))
        {
            image_speed = old_image_speed;
            speed = old_speed;
            hspeed = old_hspeed;
            vspeed = old_vspeed;
        }
    }
}
