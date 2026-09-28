move_speed = 4;
hsp = 0; 
vsp = 0; 
has_key = false;    
is_dead = false;    
flash_charges = 1;  

var colors = [c_red, c_blue, c_green, c_yellow, c_orange, c_purple, c_lime];
image_blend = colors[irandom(array_length(colors) - 1)];
