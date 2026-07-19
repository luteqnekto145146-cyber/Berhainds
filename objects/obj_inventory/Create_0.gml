hotbar_slots = 4;       
inventory_slots = 28; // СРАЗУ задаем размер рюкзака (4 колонки на 7 строк = 28)   
show_inventory = false; 
selected_slot = 0;      
hovered_slot = -1;      

// Создаем массив сразу на ВСЕ 32 ячейки (4 хот-бара + 28 рюкзака)
var _total_slots = hotbar_slots + inventory_slots;
inventory = array_create(_total_slots, undefined); 

current_weapon = "fists"; 
revolver_ammo = 0;        

dragged_slot = -1;       
dragged_item_data = undefined;

function upgrade_backpack_stats(_backpack_item) {
    hotbar_slots = 4 + _backpack_item.hotbar_add; 
    inventory_slots = _backpack_item.inventory_add; 
    var _new_total = hotbar_slots + inventory_slots;
    array_resize(inventory, _new_total);
    if (selected_slot >= hotbar_slots) {
        selected_slot = 0;
    }
}

function add_item_to_inv(_item_struct, _amount) {
    
    if (_item_struct == undefined || _item_struct == noone) return false;

   
    if (struct_exists(_item_struct, "stackable") && _item_struct.stackable) {
        var _len = array_length(inventory); 
        for (var i = 0; i < _len; i++) {
            var _slot = inventory[i];
            if (_slot != undefined && _slot != noone && is_struct(_slot) && struct_exists(_slot, "item") && _slot.item != undefined) {
                if (_slot.item.item_id == _item_struct.item_id) {
                    _slot.count += _amount;
                    return true; 
                }
            }
        }
    }

   
    var _len = array_length(inventory); 
    for (var i = 0; i < _len; i++) {
        if (inventory[i] == undefined || inventory[i] == noone) {
            inventory[i] = {
                item: _item_struct,
                count: _amount
            };
            return true; 
        }
    }

    return false; 
}


function get_total_coins() {
    var count = 0;
    var _len = array_length(inventory);
    for (var i = 0; i < _len; i++) {
        var slot = inventory[i];
        if (slot != undefined && slot != noone && slot.item.item_id == 6) {
            count += slot.count;
        }
    }
    return count;
}

function get_total_shurikens() {
    var count = 0;
    var _len = array_length(inventory);
    for (var i = 0; i < _len; i++) {
        var slot = inventory[i];
        if (slot != undefined && slot != noone && slot.item.item_id == 7) {
            count += slot.count;
        }
    }
    return count;
}
