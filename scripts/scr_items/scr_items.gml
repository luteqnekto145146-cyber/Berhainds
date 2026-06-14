
function GameItem(_id, _name, _sprite, _description, _type, _hp_bonus, _damage, _stackable, _max_durability, _hotbar_add, _inventory_add) constructor {
    item_id = _id;          
    name = _name;           
    sprite = _sprite;       
    description = _description; 
    type = _type;               
    hp_bonus = _hp_bonus;   
    damage = _damage;       
    stackable = _stackable;     
    max_durability = _max_durability; 
    
    
    hotbar_add = _hotbar_add;       
    inventory_add = _inventory_add; 
}

global.db_items = {
    
    revolver: new GameItem(1, "Револьвер", spr_revolver, "Старый шестизарядник.", "weapon", 0, 25, false, 100, 0, 0),
    ammo:     new GameItem(2, "Патрон .45", spr_ammo, "Снаряд для револьвера.", "ammo", 0, 0, true, 0, 0, 0),
    potion:   new GameItem(3, "Зелье ОЗ", spr_medkit, "Восстанавливает 30 здоровья.", "potion", 50, 0, true, 0, 0, 0),
    

    bg_small: new GameItem(4, "Малый рюкзак", spr_bag_small, "Походная сумка.", "backpack", 0, 0, false, 0, 1, 10),
    bg_large: new GameItem(5, "Большой рюкзак", spr_bag_large, "Военный рюкзак.", "backpack", 0, 0, false, 0, 3, 20),
	coin: new GameItem(6, "Монета", spr_coin, "Валюта для торговли.", "currency", 0, 0, true, 0, 0, 0),
	suriken: new GameItem(7, "Маленький сапфировый срикен", spr_small_sapfir_suriken, "Оружие сдеанное на заказ, один убитый зомби вряд ли стоит его.", "ammo", 0, 25, true, 0, 0, 0)
	
	
	
	
};


function inventory_count_coins() {
    if (!instance_exists(obj_inventory)) return 0;
    
    var _total_coins = 0;
    var _inv_array = obj_inventory.inventory; 
    
    for (var i = 0; i < array_length(_inv_array); i++) {
        var _slot = _inv_array[i];
        
        if (_slot != noone && _slot != undefined && is_struct(_slot)) {
            
            // Проверка 1: Если у вас в ячейке структура самого предмета (где есть item_id)
            if (struct_exists(_slot, "item_id") && _slot.item_id == 6) {
                _total_coins += _slot.count;
            }
            // Проверка 2: Если предмет лежит внутри переменной item_data
            else if (struct_exists(_slot, "item_data") && is_struct(_slot.item_data) && _slot.item_data.item_id == 6) {
                _total_coins += _slot.count;
            }
            // Проверка 3: Если переменная называется просто item
            else if (struct_exists(_slot, "item") && is_struct(_slot.item) && _slot.item.item_id == 6) {
                _total_coins += _slot.count;
            }
        }
    }
    return _total_coins;
}

function inventory_remove_coins(_amount) {
    if (!instance_exists(obj_inventory)) return;
    
    var _inv_array = obj_inventory.inventory;
    
    for (var i = 0; i < array_length(_inv_array); i++) {
        var _slot = _inv_array[i];
        
        if (_slot != noone && _slot != undefined && is_struct(_slot)) {
            var _is_coin = false;
            
            if (struct_exists(_slot, "item_id") && _slot.item_id == 6) _is_coin = true;
            else if (struct_exists(_slot, "item_data") && is_struct(_slot.item_data) && _slot.item_data.item_id == 6) _is_coin = true;
            else if (struct_exists(_slot, "item") && is_struct(_slot.item) && _slot.item.item_id == 6) _is_coin = true;
            
            if (_is_coin) {
                if (_slot.count >= _amount) {
                    _slot.count -= _amount;
                    if (_slot.count <= 0) _inv_array[i] = noone; 
                    break;
                } else {
                    _amount -= _slot.count;
                    _inv_array[i] = noone;
                }
            }
        }
    }
}
function scr_items(_item_data, _quantity) {
    if (!instance_exists(obj_inventory)) return false;
    
    var _inv_array = obj_inventory.inventory;
    var _max_slots = array_length(_inv_array);
    
    // Ищем, есть ли уже такой предмет, чтобы добавить в стак
    for (var i = 0; i < _max_slots; i++) {
        var _slot = _inv_array[i];
        if (_slot != noone && _slot != undefined && is_struct(_slot)) {
            var _match = false;
            if (struct_exists(_slot, "item_id") && _slot.item_id == _item_data.item_id) _match = true;
            else if (struct_exists(_slot, "item_data") && is_struct(_slot.item_data) && _slot.item_data.item_id == _item_data.item_id) _match = true;
            else if (struct_exists(_slot, "item") && is_struct(_slot.item) && _slot.item.item_id == _item_data.item_id) _match = true;
            
            if (_match) {
                _slot.count += _quantity;
                return true;
            }
        }
    }
    
 // Ищем свободную ячейку
    for (var i = 0; i < _max_slots; i++) {
        if (_inv_array[i] == noone || _inv_array[i] == undefined) {
            
            // Записываем предмет во всех возможных вариантах, 
            // чтобы и магазин, и ваш инвентарь видели его одинаково:
            _inv_array[i] = {
                item: _item_data,       // Это исправит ошибку инвентаря!
                item_data: _item_data,  // Это нужно для магазина
                item_id: _item_data.item_id,
                count: _quantity
				}; // Строка 124 (закрывает структуру предмета)
            return true; // Строка 125 (выходим из функции, если успешно добавили)
        }
    }
    return false; // Если прошлись по всему инвентарю и не нашли свободного места
}