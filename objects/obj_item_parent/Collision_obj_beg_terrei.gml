
if (my_item_data != undefined && instance_exists(obj_inventory)) {
    

    var picked_up = obj_inventory.add_item_to_inv(my_item_data, amount);
    
 
    if (picked_up) {
        instance_destroy();
    }
}