inventory_slots = 6; 
inventory = array_create(inventory_slots, undefined); 

selected_slot = 0; 



     



hotbar_slots = 4;    
inventory_slots = 4;  
inventory = array_create(32, undefined); 

selected_slot = 0;    
show_inventory = false; 
hovered_slot = -1;    

current_weapon = "fists"; 
revolver_ammo = 0;        


function upgrade_backpack_stats(_backpack_item) {
    hotbar_slots = 4 + _backpack_item.hotbar_add;       
    inventory_slots = hotbar_slots + _backpack_item.inventory_add; 
    

    if (selected_slot >= hotbar_slots && !show_inventory) selected_slot = 0;
}


function add_item_to_inv(_item_struct, _amount) {
    // Если подобрали предмет с типом "backpack" — берем его характеристики вместимости!
    if (_item_struct.type == "backpack") {
        upgrade_backpack_stats(_item_struct);
        return true; // Рюкзак "экипировался", в ячейку его не кладем
    }

    // Стак в существующий слот
    if (_item_struct.stackable) {
        for (var i = 0; i < inventory_slots; i++) {
            if (inventory[i] != undefined && inventory[i].item.item_id == _item_struct.item_id) {
                inventory[i].count += _amount;
                return true;
            }
        }
    }
    // Поиск пустой доступной ячейки
    for (var i = 0; i < inventory_slots; i++) {
        if (inventory[i] == undefined) {
            inventory[i] = { item: _item_struct, count: _amount, durability: _item_struct.max_durability };
            return true;
        }
    }
    return false; 
}


// Функция считает ВСЕ монеты в инвентаре (ID = 6)
function get_total_coins() {
    var count = 0;
    for (var i = 0; i < inventory_slots; i++) {
        var slot = inventory[i];
        if (slot != undefined && slot.item.item_id == 6) {
            count += slot.count;
        }
    }
    return count;
}

// Функция считает ВСЕ сапфировые сюрикены в инвентаре (ID = 7)
function get_total_shurikens() {
    var count = 0;
    for (var i = 0; i < inventory_slots; i++) {
        var slot = inventory[i];
        if (slot != undefined && slot.item.item_id == 7) {
            count += slot.count;
        }
    }
    return count;
}