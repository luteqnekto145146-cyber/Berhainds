
move_speed = 0.5;        
chase_speed = 1.5;      
detection_radius = 200; 
attack_radius = 40;     

enum Z_STAT {
    WANDER,
    CHASE,
    ATTACK,
    RETURN,
    DIE     
}

state = Z_STATE.WANDER; 
wander_timer = 0;      

home_x = x;
home_y = y;

hp_max = 100; 
hp = hp_max;  
attack_cooldown = 0; 
