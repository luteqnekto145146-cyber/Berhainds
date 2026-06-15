inventory_slots = 6; 
inventory = array_create(inventory_slots, undefined); 

selected_slot = 0; 


     



hotbar_slots = 4;    
inventory_slots = 0
inventory = array_create(32, undefined); 

selected_slot = 0;    
show_inventory = false; 
hovered_slot = -1;    

current_weapon = "fists"; 
revolver_ammo = 0;        

function upgrade_backpack_stats(_backpack_item) {
    // 1. Увеличиваем хот-бар (к базовым 4 прибавляем то, что дает сумка)
    hotbar_slots = 4 + _backpack_item.hotbar_add; 
    
    // 2. Задаем количество ячеек самого инвентаря (например, 10)
    inventory_slots = _backpack_item.inventory_add; 
    
    // 3. Высчитываем общий новый размер всего инвентаря вместе с хот-баром
    var _total_slots = hotbar_slots + inventory_slots;
    
    // 4. Физически увеличиваем массив под новый размер, заполняя новые ячейки "пустотой" (undefined)
    array_resize(inventory, _total_slots);
    
    // Безопасность: если выбранный слот улетел за границы, сбрасываем его на 0
    if (selected_slot >= hotbar_slots) {
        selected_slot = 0;
    }
}
// Замените вашу старую функцию add_item_to_inv на этот код:
function add_item_to_inv(_item_struct, _amount) {
    // 1. СТАКИНГ: Ищем, есть ли уже такой предмет в инвентаре
    if (_item_struct.stackable) {
        for (var i = 0; i < array_length(inventory); i++) {
            if (inventory[i] != noone && inventory[i] != undefined) {
                if (inventory[i].item.item_id == _item_struct.item_id) {
                    inventory[i].count += _amount;
                    return true; // Успешно добавили в существующий стак и вышли
                }
            }
        }
    }

    // 2. ПОИСК ПУСТОЙ ЯЧЕЙКИ: Если предмета еще нет или он не стакается
    for (var i = 0; i < array_length(inventory); i++) {
        if (inventory[i] == undefined || inventory[i] == noone) {
            // Создаем новую структуру слота напрямую через аргументы
            inventory[i] = {
                item: _item_struct,
                count: _amount
            };
            return true; // Успешно положили в свободную ячейку!
        }
    }

    // Если свободного места вообще нет
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