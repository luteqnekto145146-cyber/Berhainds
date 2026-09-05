draw_self();

if (instance_exists(obj_beg_terrei) && instance_exists(obj_inventory)) {
    var dist = point_distance(x, y, obj_beg_terrei.x, obj_beg_terrei.y);
    
    if (dist < 65) {
        draw_set_halign(fa_center);
        
        var has_card_in_hand = false;
        var active_slot = obj_inventory.selected_slot;
        var slot_data = obj_inventory.inventory[active_slot];
        
        if (slot_data != undefined && slot_data != noone && is_struct(slot_data)) {
            if (struct_exists(slot_data, "item") && slot_data.item != undefined) {
                var _item = slot_data.item;
                if (struct_exists(_item, "item_id") && _item.item_id == 8) {
                    has_card_in_hand = true;
                }
            }
        }
        
        if (has_card_in_hand) {
            if (!is_open) {
                draw_set_color(c_lime);
                draw_text(x, y - 40, "КАРТА СЧИТАНА");
                draw_set_color(c_white);
                draw_text(x, y - 25, "Нажмите [F] для входа");
            } else {
                draw_set_color(c_black);
                draw_rectangle(x - 80, y - 130, x + 80, y - 45, false);
                draw_set_color(c_purple);
                draw_rectangle(x - 80, y - 130, x + 80, y - 45, true);
                
                draw_set_color(c_lime);
                draw_text(x, y - 125, "БАНК СИТИ");
                draw_set_color(c_white);
                draw_text(x, y - 110, "Баланс: " + string(global.bank_gold));
                
                draw_set_color(c_yellow);
                draw_text(x, y - 95, "1. Пополнить 10");
                draw_text(x, y - 80, "2. Снять 10");
                
                if (delivery_active) {
                    draw_set_color(c_orange);
                    draw_text(x, y - 65, "Доставка: " + string(ceil(delivery_timer)) + "с");
                } else {
                    draw_set_color(c_aqua);
                    draw_text(x, y - 65, "3. Доставка лута (50)");
                }
                
                draw_set_color(c_white);
                draw_text(x, y - 50, "[F] Выход");
            }
        } else {
            draw_set_color(c_red);
            draw_text(x, y - 40, "ВОЗЬМИТЕ КАРТУ В РУКИ");
            draw_set_color(c_white);
            draw_text(x, y - 25, "Выберите карту в хот-баре");
        }
    }
}
