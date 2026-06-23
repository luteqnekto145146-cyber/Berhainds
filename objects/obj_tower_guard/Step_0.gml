if (!instance_exists(obj_player)) exit;

var dist = distance_to_object(obj_player);

if (dist <= talk_distance && !has_given_gear) {
    has_given_gear = true;
    global.gold += 100; 
    global.has_revolver = true; 
    show_message("Охранник: Приветствую в Башне! Возьми эти 100 монет и револьвер. Проход открыт, покажи на что способен!");
    global.current_floor = 1;
    room_goto(rm_tower_floor_1); 
}
