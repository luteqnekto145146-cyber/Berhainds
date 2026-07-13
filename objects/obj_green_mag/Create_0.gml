event_inherited(); 


hp_max = 100;
hp = hp_max;
move_speed = 1.5; 


home_x = x; 
home_y = y;
wander_max_dist = 120; 


vision_radius = 250;    
attack_distance = 180;  
shoot_cooldown = 60;    
shoot_timer = 0;      


enum M_STATE {
    WANDER,
    ATTACK,
    RETURN
}
state = M_STATE.WANDER;


wander_timer = 0;
move_x = x;
move_y = y;