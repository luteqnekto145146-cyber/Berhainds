if (!instance_exists(obj_beg_terrei)) exit;

mp_linear_step(obj_beg_terrei.x, obj_beg_terrei.y, speed, false);

var _dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
if (_dist <= attack_range && variable_instance_exists(obj_beg_terrei, "hp")) {
    if (irandom(60) == 1) {
        obj_beg_terrei.hp -= damage;
    }
}

if (obj_beg_terrei.x > x) image_xscale = 0.6; 
else image_xscale = -0.6;
image_yscale = 0.6;
