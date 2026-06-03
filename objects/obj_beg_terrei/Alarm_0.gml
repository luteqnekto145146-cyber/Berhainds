can_shoot = true;
// Этот код сработает с задержкой в 1 кадр, когда все остальные скрипты отыграли
if (instance_exists(obj_spawn_point)) {
    var spawn = instance_find(obj_spawn_point, 0);
    x = spawn.x;
    y = spawn.y;
}