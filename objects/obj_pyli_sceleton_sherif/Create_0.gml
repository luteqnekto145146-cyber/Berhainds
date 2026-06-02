
bullet_speed = 6 

if (instance_exists(obj_beg_terrei)){
var _target = instance_find(obj_beg_terrei, 0)

var _target_x = _target.x
var _target_y = _target.y

var _dir = point_direction(x, y, _target_x, _target_y)
motion_set(_dir, bullet_speed)
}

image_angle = direction
image_xscale = 0.3
image_yscale = 0.3