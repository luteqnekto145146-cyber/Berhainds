if (!variable_global_exists("db_items") || global.db_items == undefined) {
    instance_create_depth(x, y, depth, obj_loot_spawner);
    instance_destroy();
    exit;
}

var loot_table = [
    { key: "coin",    weight: 60, min_amt: 5,  max_amt: 15 },
    { key: "ammo",    weight: 25, min_amt: 2,  max_amt: 6 },
    { key: "suriken", weight: 10, min_amt: 1,  max_amt: 3 },
    { key: "potion",  weight: 5,  min_amt: 1,  max_amt: 1 }
];

var total_weight = 0;
for (var i = 0; i < array_length(loot_table); i++) {
    total_weight += loot_table[i].weight;
}

var random_roll = irandom(total_weight - 1);
var chosen_loot = undefined;
var current_weight_sum = 0;

for (var i = 0; i < array_length(loot_table); i++) {
    current_weight_sum += loot_table[i].weight;
    if (random_roll < current_weight_sum) {
        chosen_loot = loot_table[i];
        break;
    }
}

if (chosen_loot != undefined && struct_exists(global.db_items, chosen_loot.key)) {
    var item_data = global.db_items[$ chosen_loot.key];
    var dropped = instance_create_depth(x, y, depth, obj_dropped_loot);
    
    if (instance_exists(dropped)) {
        dropped.my_item_data = variable_clone(item_data);
        dropped.item_key = chosen_loot.key;
        
        if (struct_exists(item_data, "sprite") && sprite_exists(item_data.sprite)) {
            dropped.sprite_index = item_data.sprite;
        }
        
        dropped.amount = irandom_range(chosen_loot.min_amt, chosen_loot.max_amt);
        dropped.alarm = 20;
    }
}

instance_destroy();
