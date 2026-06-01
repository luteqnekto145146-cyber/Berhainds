if(instance_exists(obj_beg_terrei))
var is_player_see = !collision_line(x, y,obj_beg_terrei.x, obj_beg_terrei.y, obj_wall,true, false)
if(distance_to_object(obj_beg_terrei) > stop_distance or !is_player_see)
mp_potential_step_object(obj_beg_terrei.x, obj_beg_terrei.y, move_speed, obj_wall )

if (distance_to_object(obj_beg_terrei) < shooting_distance and
is_player_see and shooting_timer <=0)
instance_create_depth(x, y,depth, obj_pyli_sceleton_sherif)
shooting_timer = shooting_delay
shooting_timer--

