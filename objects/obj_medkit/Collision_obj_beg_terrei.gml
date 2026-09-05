
if (other.player_hp < other.player_hp_max) {
    
    other.player_hp += 30; 
    
   
    if (other.player_hp > other.player_hp_max) {
        other.player_hp = other.player_hp_max;
    }
    
    instance_destroy(); 
}
