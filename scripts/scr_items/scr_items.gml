function GameItem(_id, _name, _sprite, _description, _type, _hp_bonus, _damage, _stackable, _max_durability, _hotbar_add, _inventory_add, _w = 1) constructor {
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
    size_width = _w; 
}

global.db_items = {
    revolver: new GameItem(1, "Револьвер", spr_revolver, "Старый шестизарядник.", "weapon", 0, 25, false, 100, 0, 0, 1),
    ammo:     new GameItem(2, "Патрон .45", spr_ammo, "Снаряд для револьвера.", "ammo", 0, 0, true, 0, 0, 0, 1),
    potion:   new GameItem(3, "Зелье ОЗ", spr_medkit, "Восстанавливает 30 здоровья.", "potion", 50, 0, true, 0, 0, 0, 1),
    bg_small: new GameItem(4, "Малый рюкзак", spr_bag_small, "Походная сумка.", "backpack", 0, 0, false, 0, 0, 10, 1),
    bg_large: new GameItem(5, "Большой рюкзак", spr_bag_large, "Военный рюкзак.", "backpack", 0, 0, false, 0, 0, 20, 1),
    coin:     new GameItem(6, "Монета", spr_coin, "Валюта для торговли.", "currency", 0, 0, true, 0, 0, 0, 1),
    suriken:  new GameItem(7, "Маленький сапфировый сюрикен", spr_small_sapfir_suriken, "Оружие, сделанное на заказ.", "ammo", 0, 25, true, 0, 0, 0, 1),
    bone:     new GameItem(8, "Старая кость", spr_koct, "Тяжелая кость. Подойдет для продажи.", "material", 0, 0, false, 0, 0, 0, 2)
};
function inventory_count_coins() {
    if (!instance_exists(obj_inventory)) return 0;
    var _total_coins = 0;
    var _inv = obj_inventory.inventory; 
    for (var i = 0; i < array_length(_inv); i++) {
        var _slot = _inv[i];
        if (_slot != undefined && _slot != noone) {
            if (_slot.item.item_id == 6) {
                _total_coins += _slot.count;
            }
        }
    }
    return _total_coins;
}

function inventory_remove_coins(_amount) {
    if (!instance_exists(obj_inventory)) return;
    var _inv = obj_inventory.inventory;
    for (var i = 0; i < array_length(_inv); i++) {
        var _slot = _inv[i];
        if (_slot != undefined && _slot != noone && _slot.item.item_id == 6) {
            if (_slot.count >= _amount) {
                _slot.count -= _amount;
                if (_slot.count <= 0) _inv[i] = undefined; 
                break;
            } else {
                _amount -= _slot.count;
                _inv[i] = undefined;
            }
        }
    }
}

function scr_items(_item_data, _quantity) {
    if (!instance_exists(obj_inventory)) return false;
    
    var _inv = obj_inventory.inventory;
    var _max_slots = array_length(_inv);
    var _item_w = struct_exists(_item_data, "size_width") ? _item_data.size_width : 1;
    
    if (_item_data.stackable && _item_w == 1) {
        for (var i = 0; i < _max_slots; i++) {
            var _slot = _inv[i];
            if (_slot != undefined && _slot != noone && is_struct(_slot) && struct_exists(_slot, "item")) {
                if (_slot.item.item_id == _item_data.item_id) {
                    _slot.count += _quantity;
                    return true;
                }
            }
        }
    }
    
    for (var i = 0; i < _max_slots; i++) {
        if (i < obj_inventory.hotbar_slots && _item_w > 1) continue;
        
        if (_item_w == 2) {
            if (i + 1 >= _max_slots) continue;
            
            if ((_inv[i] == undefined || _inv[i] == noone) && (_inv[i + 1] == undefined || _inv[i + 1] == noone)) {
                var _cloned_item = variable_clone(_item_data);
                
                _inv[i] = {
                    item: _cloned_item,
                    count: _quantity,
                    is_child: false
                };
                
                _inv[i + 1] = {
                    item: _cloned_item,
                    count: 0,
                    is_child: true
                };
                
                return true;
            }
        } else {
            if (_inv[i] == undefined || _inv[i] == noone) {
                var _cloned_item = variable_clone(_item_data);
                _inv[i] = {
                    item: _cloned_item,
                    count: _quantity,
                    is_child: false
                };
                return true;
            }
        }
    }
    return false; 
}
function inventory_sell_revolver() {
    if (!instance_exists(obj_inventory)) return false;
    var _inv = obj_inventory.inventory;
    var _revolver_found = false;
    for (var i = 0; i < array_length(_inv); i++) {
        var _slot = _inv[i];
        if (_slot != undefined && _slot != noone && _slot.item.item_id == 1) {
            _slot.count -= 1;
            if (_slot.count <= 0) _inv[i] = undefined;
            _revolver_found = true;
            break; 
        }
    }
    if (_revolver_found) {
        scr_items(global.db_items.coin, 10);
        return true;
    }
    return false; 
}
 function deal_damage_to_enemy(_enemy_id, _damage_amount) {
    if (!instance_exists(_enemy_id)) return;
    
    with (_enemy_id) {
        if (variable_instance_exists(id, "boss_hp")) {
            boss_hp -= _damage_amount;
            if (boss_hp <= 0 && variable_instance_exists(id, "state") && state != KNIGHT_STATE.DEATH) {
                state = KNIGHT_STATE.DEATH;
                image_index = 0;
            }
        } else if (variable_instance_exists(id, "hp")) {
            hp -= _damage_amount;
            if (hp <= 0) {
                if (variable_instance_exists(id, "state") && state != Z_STATE.DIE) {
                    state = Z_STATE.DIE;
                    image_index = 0;
                } else if (variable_instance_exists(id, "is_dying") && !is_dying) {
                    is_dying = true;
                    image_index = 0;
                } else if (!variable_instance_exists(id, "state") && !variable_instance_exists(id, "is_dying")) {
                    instance_create_layer(x, y, "Instances", obj_exp);
                    instance_destroy();
                }
            }
        }
    }
}