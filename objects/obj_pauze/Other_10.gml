paused = !paused;

if (paused)
{
    // Замораживаем все объекты в комнате
    with (all)
    {
        // Игнорируем сам объект паузы и кнопки меню
        if (id != other.id && object_index != obj_knopka_exet)
        {
            // Сохраняем текущие скорости в память объекта
            old_image_speed = image_speed;
            old_speed = speed;
            old_hspeed = hspeed;
            old_vspeed = vspeed;
            
            // Останавливаем объект
            image_speed = 0;
            speed = 0;
            hspeed = 0;
            vspeed = 0;
            
            // Отключаем выполнение событий Step у объектов на время паузы
            // (Для этого в другие ваши объекты нужно будет добавить одну строчку, см. Шаг 2)
        }
    }
    
    // Создаем последовательность меню паузы
    var target_layer = layer_get_id("Instances");
    if (target_layer == -1) target_layer = layer_create(-10000, "Pause_Layer");
    
    var cam_x = camera_get_view_x(view_camera);
    var cam_y = camera_get_view_y(view_camera);
    
    pause_seq_id = layer_sequence_create(target_layer, cam_x, cam_y, seq_pause_menu);
}
else
{
    // Удаляем меню паузы
    var inst_layer = layer_get_id("Instances");
    if (inst_layer != -1 && layer_sequence_exists(inst_layer, pause_seq_id)) layer_sequence_destroy(pause_seq_id);
    
    var extra_layer = layer_get_id("Pause_Layer");
    if (extra_layer != -1 && layer_sequence_exists(extra_layer, pause_seq_id)) layer_sequence_destroy(pause_seq_id);
    
    // Возвращаем объектам их движение и анимации
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