
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