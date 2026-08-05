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
    bg_small: new GameItem(4, "Малый рюкзак", spr_bag_small, "Походная сумка.", "backpack", 0, 0, false, 0, 0, 10),
    bg_large: new GameItem(5, "Большой рюкзак", spr_bag_large, "Военный рюкзак.", "backpack", 0, 0, false, 0, 0, 20),
    coin:     new GameItem(6, "Монета", spr_coin, "Валюта для торговли.", "currency", 0, 0, true, 0, 0, 0),
    suriken:  new GameItem(7, "Маленький сапфировый сюрикен", spr_small_sapfir_suriken, "Оружие, сделанное на заказ.", "ammo", 0, 25, true, 0, 0, 0)
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
    
    if (_item_data.stackable) {
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
        if (_inv[i] == undefined || _inv[i] == noone) {
            var _cloned_item = variable_clone(_item_data);
            _inv[i] = {
                item: _cloned_item,
                count: _quantity
            };
            return true;
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

global.deal_damage_to_enemy = function(_enemy_id, _damage_amount) {
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
global.save_game = function() {
    var _floor = 1;
    if (variable_global_exists("current_floor")) {
        _floor = global.current_floor;
    }
    
    var _save_data = {
        saved_room_name: room_get_name(room), // ДОБАВЛЕНО: Запоминаем имя текущей комнаты текстом
        current_floor: _floor,
        player_hp: instance_exists(obj_beg_terrei) ? obj_beg_terrei.player_hp : 100,
        revolver_ammo: instance_exists(obj_beg_terrei) ? obj_beg_terrei.revolver_ammo : 0,
        saved_inventory: instance_exists(obj_inventory) ? variable_clone(obj_inventory.inventory) : []
    };
    
    var _json_string = json_stringify(_save_data);
    var _encrypted_string = base64_encode(_json_string);
    
    var _file = file_text_open_write(working_directory + "save.dat");
    file_text_write_string(_file, _encrypted_string);
    file_text_close(_file);
    
    show_debug_message("Игра зашифрована и сохранена!");
}

global.load_game = function() {
    var _file_path = working_directory + "save.dat";
    
    if (!file_exists(_file_path)) return false;
    
    var _file = file_text_open_read(_file_path);
    var _encrypted_string = file_text_read_string(_file);
    file_text_close(_file);
    
    var _json_string = base64_decode(_encrypted_string);
    var _load_data = json_parse(_json_string);
    
    global.current_floor = _load_data.current_floor;
    
    if (instance_exists(obj_beg_terrei)) {
        obj_beg_terrei.player_hp = _load_data.player_hp;
        obj_beg_terrei.revolver_ammo = _load_data.revolver_ammo;
    }
    
    if (instance_exists(obj_inventory)) {
        obj_inventory.inventory = variable_clone(_load_data.saved_inventory);
        obj_inventory.inventory_slots = array_length(obj_inventory.inventory) - obj_inventory.hotbar_slots;
    }
    
    // ДОБАВЛЕНО ТУТ: Перемещаем игрока строго в ту комнату, которую мы прочитали из сохранения!
    if (struct_exists(_load_data, "saved_room_name")) {
        var _target_room = asset_get_index(_load_data.saved_room_name);
        if (room_exists(_target_room)) {
            room_goto(_target_room);
        } else {
            room_goto(rm_tower_floor_1); // Запасной вариант, если комната не найдена
        }
    } else {
        room_goto(rm_tower_floor_1);
    }
    
    show_debug_message("Игра успешно расшифрована и загружена!");
    return true;
}
