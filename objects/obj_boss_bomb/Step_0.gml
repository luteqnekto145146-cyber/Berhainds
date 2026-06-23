if (point_distance(x, y, target_x, target_y) < 8) {
    instance_create_layer(x, y, "Instances", obj_fire_puddle);
    instance_destroy();
}
