if (distance_to_object(obj_beg_terrei) < 0.0001) {
    obj_beg_terrei.player_hp-=10
}
if (instance_exists(obj_beg_terrei)) {
    move_towards_point(obj_beg_terrei.x, obj_beg_terrei.y, 2);
} else {
    speed = 0;
}
