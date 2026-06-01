
bullet_speed = 6 

if (instance_exists(obj_beg_terrei)){
dir_to_player = point_direction(x, y, obj_beg_terrei.x, obj_beg_terrei.y)
motion_set(dir_to_player, bullet_speed)

}else{ 
instance_destroy()


}