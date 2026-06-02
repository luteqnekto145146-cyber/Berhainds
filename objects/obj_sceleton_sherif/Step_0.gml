if(instance_exists(obj_beg_terrei))
var is_player_see = !collision_line(x, y,obj_beg_terrei.x, obj_beg_terrei.y, obj_wall,true, false)
if(distance_to_object(obj_beg_terrei) > stop_distance or !is_player_see)
mp_potential_step_object(obj_beg_terrei.x, obj_beg_terrei.y, move_speed, obj_wall )

if (distance_to_object(obj_beg_terrei) < shooting_distance and
is_player_see and shooting_timer <=0)
{
instance_create_depth(x, y,depth, obj_pyli_sceleton_sherif)
shooting_timer = shooting_delay
}
if (shooting_timer > 0) {
shooting_timer--;
}

if (hp <=0) {
	instance_destroy()
}
if (hp <= 0 && !is_dying) {
    is_dying = true;
    speed = 0;
    image_index = 0;
    image_speed = 1;
    sprite_index = spr_sceleton_sherif_die; 
}
if (is_dying) {
    speed = 0;
    if (image_index >= image_number - 1) {
        image_speed = 0;
        image_index = image_number - 1;
        
        instance_create_layer(x, y, "Instances", obj_exp); // Опыт
        
        var chance = random(100);
        
        if (chance <= 10) {
       
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
            instance_create_layer(x + random_range(-10, 10), y + random_range(-10, 10), "Instances", obj_coin);
        } else if (chance > 10 && chance <= 50) {
           
            instance_create_layer(x, y, "Instances", obj_coin);
        }
     var ammo_chance = random(100);
if (ammo_chance <= 50) {
    instance_create_layer(x, y, "Instances", obj_ammo);
}   
var weapon_chance = random(100)       
if (weapon_chance <=10) { 
 instance_create_layer(x, y, "Instances", obj_revolver)

}
        instance_destroy();
    }
    
    exit; 
}